# Maintainer: sulhan <ms at kilabit.info>
##
## NOTE
##
## The original source url is : http://gdlp01.c-wss.com/gds/8/0100004708/01/scangearmp-source-2.00-1.tar.gz.
##
## Due to makepkg failed downloading the source (for unknown reason), I
## uploaded the source to my Copy directory.
##
## The source files contain drivers for
## - mp230 series in directory 401
## - mg2200 series in directory 402
## - e510 series in directory 403
## - mg3200 series in directory 404
## - mg4200 series in diretory 405
## - mg5400 series in directory 407
## - mg6300 series in directory 408
##
## One can create a new PKGBUILD by replacing variable _model with directory
## name and adjusting some files name in below.
##

## variables
_pkgver=2.00-1
_model=401

pkgname=scangearmp-mp230series
pkgver=2.00
pkgrel=1
pkgdesc="Canon Scanner Driver (for MP230 series)"
url="http://www.canon.co.uk/support/consumer_products/products/fax__multifunctionals/inkjet/pixma_mp_series/pixma_mp230.aspx?type=drivers&language=&os=LINUX"
arch=('i686' 'x86_64')
license=('custom')
depends=('gtk2' 'libpng12' 'libusb-compat')
makedepends=('gimp')
source=(
		"scangearmp-source-2.00-1.tar.gz::https://copy.com/FCUgSGHzE9avw48r"
		"configure.in.patch"
	)
md5sums=(
		'ccd538e1333bf34aa83900f093ecd9eb'
		'ff4bb2abed071af5bd6d38c33157c555'
	)

package() {
	if [ "$CARCH" == "x86_64" ]; then	
		libdir=libs_bin64
	else
		libdir=libs_bin32
	fi

	## patching ...
	cd ${srcdir}/scangearmp-source-${_pkgver}/scangearmp
  #patch src/scanfile.c "${srcdir}/attachment.cgi?id=296499"
	patch configure.in ${srcdir}/configure.in.patch

	## build ...
	./autogen.sh --prefix=/usr CFLAGS="-I/usr/include/libpng12" LDFLAGS="-L`pwd`/../com/${libdir}" LIBS="-lm -lpng12"
	## Force the use of system's libtool
	rm libtool
	ln -s `which libtool` .
	## Build package
	make clean || return 1
	make || return 1
	## Install package
	make install DESTDIR=${pkgdir} || return 1

	## Install common libraries
	install -m 755 ${srcdir}/scangearmp-source-${_pkgver}/com/${libdir}/libcncpcmcm.so.8.0.1 ${pkgdir}/usr/lib/
	install -m 755 ${srcdir}/scangearmp-source-${_pkgver}/com/${libdir}/libcncpmsimg.so.1.0.2 ${pkgdir}/usr/lib/
	install -m 755 ${srcdir}/scangearmp-source-${_pkgver}/com/${libdir}/libcncpmslld.so.1.0.1 ${pkgdir}/usr/lib/
	install -m 755 ${srcdir}/scangearmp-source-${_pkgver}/com/${libdir}/libcncpmsui.so.2.0.0 ${pkgdir}/usr/lib/
	install -m 755 ${srcdir}/scangearmp-source-${_pkgver}/com/${libdir}/libcncpnet.so.1.2.2 ${pkgdir}/usr/lib/
	## Install mpXXXX series specific libraries
	install -m 755 ${srcdir}/scangearmp-source-${_pkgver}/${_model}/${libdir}/libcncpmsimg${_model}.so.2.0.0 ${pkgdir}/usr/lib/
	install -m 755 ${srcdir}/scangearmp-source-${_pkgver}/${_model}/${libdir}/libcncpmslld${_model}c.so.1.04.1 ${pkgdir}/usr/lib/
	install -m 755 ${srcdir}/scangearmp-source-${_pkgver}/${_model}/${libdir}/libcncpmslld${_model}.so.2.0.0 ${pkgdir}/usr/lib/
	# Create symbolic links
	cd ${pkgdir}/usr/lib/
	ln -s libcncpcmcm.so.8.0.1 libcncpcmcm.so
	ln -s libcncpmsimg.so.1.0.2 libcncpmsimg.so
	ln -s libcncpmslld.so.1.0.1 libcncpmslld.so
	ln -s libcncpmsui.so.2.0.0 libcncpmsui.so
	ln -s libcncpnet.so.1.2.2 libcncpnet.so
	ln -s libcncpmsimg${_model}.so.2.0.0 libcncpmsimg${_model}.so
	ln -s libcncpmslld${_model}c.so.1.04.1 libcncpmslld${_model}c.so
	ln -s libcncpmslld${_model}.so.2.0.0 libcncpmslld${_model}.so
	
	## Make scangearmp usable from gimp
	install -d -m 755 ${pkgdir}/usr/lib/gimp/2.0/plug-ins/
	ln -s /usr/bin/scangearmp ${pkgdir}/usr/lib/gimp/2.0/plug-ins/

	## Install .tbl and .dat files
	install -d -m 755 ${pkgdir}/usr/lib/bjlib/
	install -D -m 755 ${srcdir}/scangearmp-source-${_pkgver}/${_model}/cnc175fd.tbl ${pkgdir}/usr/lib/bjlib/
	install -D -m 755 ${srcdir}/scangearmp-source-${_pkgver}/${_model}/cnc_${_model}0.tbl ${pkgdir}/usr/lib/bjlib/
	install -D -m 755 ${srcdir}/scangearmp-source-${_pkgver}/${_model}/CNC_${_model}H.DAT ${pkgdir}/usr/lib/bjlib/
	install -D -m 755 ${srcdir}/scangearmp-source-${_pkgver}/${_model}/CNC_${_model}P.DAT ${pkgdir}/usr/lib/bjlib/

	## Install udev rules
	install -D -m 644 ${srcdir}/scangearmp-source-${_pkgver}/scangearmp/etc/80-canon_mfp.rules ${pkgdir}/etc/udev/rules.d/80-canon_mfp.rules
	#sed -i -e 's/SYSFS/ATTR/g' ${pkgdir}/etc/udev/rules.d/80-canon_mfp.rules

	# Install .ini file
	install -D -m 444 ${srcdir}/scangearmp-source-${_pkgver}/com/ini/canon_mfp_net.ini ${pkgdir}/usr/lib/bjlib/

	# Install license file
	cd ${srcdir}/scangearmp-source-${_pkgver}
	install -D LICENSE-scangearmp-${pkgver}EN.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-scangearmp-${pkgver}EN.txt

	# Remove unneeded files
	rm ${pkgdir}/usr/lib/libsane-canon_mfp.a
	rm ${pkgdir}/usr/lib/libsane-canon_mfp.la
}
# vim:ts=2:sw=2
