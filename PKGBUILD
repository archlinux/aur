# Maintainer: sourcesmith <sourcesmith 'at' homeport 'dot' org.uk> 
# Original Contributors: Pavol Hluchy (Lopo) <lopo at losys dot eu>
#                        Sonic-Y3k <sonic.y3k@googlemail.com>
#                        Giancarlo Bianchi <giancarlobianchi76@gmail.com>
#                        Fortunato Ventre (voRia) <vorione@gmail.com>
#                        Custom Processing Unlimited (CPUnltd) <CPUnltd 'at' gmail 'dot' com>
_model=mg8100
pkgname=scangearmp-${_model}series
pkgver=1.60
pkgrel=1
_pkgver=1.60-1
pkgdesc="Canon IJ Scanner Driver (for ${_model} series)"
url="http://www.canon.co.uk/support/consumer_products/products/fax__multifunctionals/inkjet/pixma_mg_series/pixma_mg8150.aspx?type=drivers'&'os=LINUX"
arch=('i686' 'x86_64')
license=('custom')
depends=('sane' 'gtk2' 'libpng')
makedepends=('autoconf>=2.13' 'automake>=1.6' 'findutils' 'gawk' 'gimp>=2.0')
optdepends=('xsane')
conflicts=('scangearmp-common')
install=scangearmp-mg8100series.install
source=("http://files.canon-europe.com/files/soft40247/Software/scangearmp-source-${_pkgver}.tar.gz"
        'build-fixes.patch'
	'scanfile.patch'
	'rules.patch')
sha256sums=('fab6b764409f17a674ba31e45a515353cdf027562b2daee96c316bb86d6d6340'
            'eeec0bbba93e054842bf1375502192c368cf92e86b6bcee2d114adeb14bbf8b3'
            'd1b16bab6ac1f235fb42b14fff9e78a1bd395ddda56d21a8f13aabb0c4e8e83c'
	    '55a40593e79e85edc2365440097971f7b61748a3aa3d12a8365cea093da6af23')

if [ "$CARCH" == "x86_64" ]; then  
	_libdir=libs_bin64
else
	_libdir=libs_bin32
fi

prepare() {
    ## Patches
	msg "Applying patches"
	patch -p0 < build-fixes.patch
	patch -p0 < scanfile.patch
	patch -p0 < rules.patch
}

build() {
    CPPFLAGS="${CPPFLAGS} -O2"

    ## Compile ${_model} stuff
	cd ${srcdir}/scangearmp-source-${_pkgver}/scangearmp
	./autogen.sh --prefix=/usr LDFLAGS="-L`pwd`/../com/${_libdir}" LIBS=-lm
	# Force the use of system's libtool
	rm libtool
	ln -s `which libtool` .
	make
}

package() {
	# get id of printer model	
	_cmd=$(grep ^PRINTER_DEPEND_PKG=scangearmp-${_model}- ${srcdir}/scangearmp-source-${_pkgver}/debian/scangearmp-${_model}series.postrm \
		| gawk -F- '{print $3}')
	_id=${_cmd}
	echo ${pkgdir}
	

	cd ${srcdir}/scangearmp-source-${_pkgver}/scangearmp
	make install DESTDIR="${pkgdir}" 

	# Install SANE configuration file
	install -d -m 0755 ${pkgdir}/etc/sane.d/
	install -m 0644 ${srcdir}/scangearmp-source-${_pkgver}/scangearmp/backend/canon_mfp.conf ${pkgdir}/etc/sane.d/canon_mfp.conf

	# Install ${_model} series specific libraries
	cp -P ${srcdir}/scangearmp-source-${_pkgver}/${_id}/${_libdir}/*so* ${pkgdir}/usr/lib/

	# Install common libraries
	cp -P ${srcdir}/scangearmp-source-${_pkgver}/com/${_libdir}/*so* ${pkgdir}/usr/lib/

	# Make scangearmp usable from gimp
	install -d -m 0755 ${pkgdir}/usr/lib/gimp/2.0/plug-ins/
	ln -s /usr/bin/scangearmp ${pkgdir}/usr/lib/gimp/2.0/plug-ins/

	# Install .tbl and .dat files for ${_model} series
	install -d -m 0755 ${pkgdir}/usr/lib/bjlib
	install -D -m 0644 ${srcdir}/scangearmp-source-${_pkgver}/${_id}/cnc*.tbl ${pkgdir}/usr/lib/bjlib/
	install -D -m 0644 ${srcdir}/scangearmp-source-${_pkgver}/${_id}/CNC*.DAT ${pkgdir}/usr/lib/bjlib/

	# Install udev rules
	install -D -m 0644 ${srcdir}/scangearmp-source-${_pkgver}/scangearmp/etc/80-canon_mfp.rules ${pkgdir}/etc/udev/rules.d/80-canon_mfp.rules

	# Install .ini file
	install -D -m 0644 ${srcdir}/scangearmp-source-${_pkgver}/com/ini/canon_mfp_net.ini ${pkgdir}/usr/lib/bjlib/

	# Install license file
	cd ${srcdir}/scangearmp-source-${_pkgver}
	install -d -m 0755 ${pkgdir}/usr/share/licenses/${pkgname}/
	install -m 0644 LICENSE-* ${pkgdir}/usr/share/licenses/${pkgname}/
}
