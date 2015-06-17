# Maintainer: Pavol Hluchy (Lopo) <lopo at losys dot eu>
_model=mg6200
pkgname=scangearmp-${_model}
pkgver=1.80
pkgrel=2
_pkgver=1.80-1
pkgdesc="Canon Scanner Driver (for ${_model} series)"
url="http://support-au.canon.com.au/contents/AU/EN/0100393102.html"
arch=('i686' 'x86_64')
license=('custom')
depends=('sane' 'gtk2' 'libpng>=1.2.8')
makedepends=('findutils' 'grep' 'gawk')
source=("http://gdlp01.c-wss.com/gds/1/0100003931/01/scangearmp-source-${_pkgver}.tar.gz"
	'fix_scanfile.patch'
	'configures.patch')
md5sums=('88e3891918357304a9f527d043b435d2'
	'13df0530aaf3283490e09427070311a8'
	'356b6bfbd8577f3fc19d1044605fdbad')

_getmodelid() {
	echo `grep ^PRINTER_DEPEND_PKG=scangearmp-${_model}- ${srcdir}/scangearmp-source-${_pkgver}/debian/scangearmp-${_model}series.postrm \
		| gawk -F- '{print $3}'`
}

_getlibdir() {
	if [ "$CARCH" == "x86_64" ]; then
		echo libs_bin64
	else
		echo libs_bin32
	fi
}

build() {

	# Apply patch
	cd ${srcdir}/scangearmp-source-${_pkgver}
	patch -p1 -i ${srcdir}/fix_scanfile.patch
	patch -p1 -i ${srcdir}/configures.patch

	cd ${srcdir}/scangearmp-source-${_pkgver}/scangearmp
	./autogen.sh --prefix=/usr LDFLAGS="-L`pwd`/../com/${libdir}" LIBS=-lm
	# Force the use of system's libtool
	rm libtool
	ln -s `which libtool` .
	# Build package
	make clean || return 1
	make || return 1
}

package() {
	_modelid=$(_getmodelid)
	libdir=$(_getlibdir)

	# Install package
	cd ${srcdir}/scangearmp-source-${_pkgver}/scangearmp
	make install DESTDIR=${pkgdir} || return 1

	# Install SANE configuration file
	install -d -m 0755 ${pkgdir}/etc/sane.d/
	install -m 0644 ${srcdir}/scangearmp-source-${_pkgver}/scangearmp/backend/canon_mfp.conf ${pkgdir}/etc/sane.d/canon_mfp.conf

	#Install common libraries
	for _l in cmcm msimg mslld msui net; do
		install -m 0755 ${srcdir}/scangearmp-source-${_pkgver}/com/${libdir}/libcncp${_l}.so.*.*.* ${pkgdir}/usr/lib/
	done
	# Install ${_model} series specific libraries
	install -m 0755 ${srcdir}/scangearmp-source-${_pkgver}/${_modelid}/${libdir}/libcncpmsimg${_modelid}.so.*.*.* ${pkgdir}/usr/lib/
	install -m 0755 ${srcdir}/scangearmp-source-${_pkgver}/${_modelid}/${libdir}/libcncpmslld${_modelid}c.so.*.*.* ${pkgdir}/usr/lib/
	install -m 0755 ${srcdir}/scangearmp-source-${_pkgver}/${_modelid}/${libdir}/libcncpmslld${_modelid}.so.*.*.* ${pkgdir}/usr/lib/
	# Create symbolic links
	cd ${pkgdir}/usr/lib/
	for _l in cmcm msimg mslld msui net; do
		ln -s libcncp${_l}.so.*.*.* libcncp${_l}.so
	done
	ln -s libcncpmsimg${_modelid}.so.*.*.* libcncpmsimg${_modelid}.so
	ln -s libcncpmslld${_modelid}c.so.*.*.* libcncpmslld${_modelid}c.so
	ln -s libcncpmslld${_modelid}.so.*.*.* libcncpmslld${_modelid}.so

	# Make scangearmp usable from gimp
	install -d -m 0755 ${pkgdir}/usr/lib/gimp/2.0/plug-ins/
	ln -s /usr/bin/scangearmp ${pkgdir}/usr/lib/gimp/2.0/plug-ins/

	# Install .tbl and .dat files for ${_model} series
	install -d -m 0755 ${pkgdir}/usr/lib/bjlib
	install -D -m 0755 ${srcdir}/scangearmp-source-${_pkgver}/${_modelid}/cnc*.tbl ${pkgdir}/usr/lib/bjlib/
	install -D -m 0755 ${srcdir}/scangearmp-source-${_pkgver}/${_modelid}/CNC*.DAT ${pkgdir}/usr/lib/bjlib/

	# Install udev rules
	install -D -m 0644 ${srcdir}/scangearmp-source-${_pkgver}/scangearmp/etc/80-canon_mfp.rules ${pkgdir}/etc/udev/rules.d/80-canon_mfp.rules

	# Install .ini file
	install -D -m 0666 ${srcdir}/scangearmp-source-${_pkgver}/com/ini/canon_mfp_net.ini ${pkgdir}/usr/lib/bjlib/

	# Install license file
	cd ${srcdir}/scangearmp-source-${_pkgver}
	install -D LICENSE-scangearmp-${pkgver}EN.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-scangearmp-${pkgver}EN.txt

	# Remove unneeded files
	rm ${pkgdir}/usr/lib/libsane-canon_mfp.a
	rm ${pkgdir}/usr/lib/libsane-canon_mfp.la
}
