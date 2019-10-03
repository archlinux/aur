# Maintainer: Pavol Hluchy (Lopo) <lopo at losys dot eu>

_model=mg6200
pkgname=scangearmp-${_model}
pkgver=1.80
pkgrel=4
_pkgver=1.80-1
pkgdesc="Canon Scanner Driver (for ${_model} series)"
url="http://support-au.canon.com.au/contents/AU/EN/0100393102.html"
arch=('i686' 'x86_64')
license=('custom')
depends=('gtk2' 'libpng>=1.2.8')
makedepends=('findutils' 'grep' 'gawk' 'libusb-compat' 'gimp' 'sane')
source=("http://gdlp01.c-wss.com/gds/1/0100003931/01/scangearmp-source-${_pkgver}.tar.gz"
	'fix_scanfile.patch'
	'configures.patch'
	'gimp.patch'
	)
sha512sums=('775fdde3a2da795102e9267bde6ae59108184094c7b8e3d77bed4c0c9293543816b6e4b33ad997379a8d19e0f2698b9f84a031db63b63dcdc40c80b2cb8be56c'
	'9bad4f8e9092a50a3804defcd558f2ec69c7f76b266f770d350b43c861faa820796c7b7e61a6e8ea9132c4da8638dba524c0f39ee29ea511f41e1307b12fe586'
	'914647b8a401c9a51ec6e477fd16cff2fe74025292a86fde0bdcd9518028c37a173d6a4b37badc6e55546f075beafe9b5c933e88ccb99bce10ad8d24f9f7afda'
	'984062422a94cac90528abbb238806943f4d9c518f6e30cb37f45acfc9e0584363974ae7d1e0315ccd1b906c6cff957f32f405c8b22bdedae79e31b6266bebea'
	)

_getmodelid() {
	echo `grep ^PRINTER_DEPEND_PKG=scangearmp-${_model}- ${srcdir}/scangearmp-source-${_pkgver}/debian/scangearmp-${_model}series.postrm \
		| gawk -F- '{print $3}'`
}

build() {
	# Apply patch
	cd ${srcdir}/scangearmp-source-${_pkgver}
	patch -p1 -i ${srcdir}/fix_scanfile.patch
	patch -p1 -i ${srcdir}/configures.patch
	patch -p1 -i ${srcdir}/gimp.patch

	cd ${srcdir}/scangearmp-source-${_pkgver}/scangearmp
	./autogen.sh --prefix=/usr LDFLAGS="-L`pwd`/../com/libs_bin64" LIBS=-lm
	# Force the use of system's libtool
	rm libtool
	ln -s `which libtool` .
	# Build package
	make clean || return 1
	make || return 1
}

package() {
	_modelid=$(_getmodelid)

	# Install package
	cd ${srcdir}/scangearmp-source-${_pkgver}/scangearmp
	make install DESTDIR=${pkgdir} || return 1

	# Install SANE configuration file
	install -d -m 0755 ${pkgdir}/etc/sane.d/
	install -m 0644 ${srcdir}/scangearmp-source-${_pkgver}/scangearmp/backend/canon_mfp.conf ${pkgdir}/etc/sane.d/canon_mfp.conf

	#Install common libraries
	for _l in cmcm msimg mslld msui net; do
		install -m 0755 ${srcdir}/scangearmp-source-${_pkgver}/com/libs_bin64/libcncp${_l}.so.*.*.* ${pkgdir}/usr/lib/
	done
	# Install ${_model} series specific libraries
	install -m 0755 ${srcdir}/scangearmp-source-${_pkgver}/${_modelid}/libs_bin64/libcncpmsimg${_modelid}.so.*.*.* ${pkgdir}/usr/lib/
	install -m 0755 ${srcdir}/scangearmp-source-${_pkgver}/${_modelid}/libs_bin64/libcncpmslld${_modelid}c.so.*.*.* ${pkgdir}/usr/lib/
	install -m 0755 ${srcdir}/scangearmp-source-${_pkgver}/${_modelid}/libs_bin64/libcncpmslld${_modelid}.so.*.*.* ${pkgdir}/usr/lib/
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
