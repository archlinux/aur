# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

# pstoedit compiled without ImageMagick dependency

_srcname="pstoedit"
pkgname=pstoedit-nomagick
pkgver=3.70
pkgrel=2
pkgdesc="Translates PS/PDF graphics to other vector formats (no ImageMagick dependency)"
arch=('i686' 'x86_64')
url="http://www.pstoedit.net/"
license=('GPL2')
depends=('gd' 'ming' 'libzip' 'plotutils' 'ghostscript')
provides=('pstoedit' 'libpstoedit.so')
conflicts=('pstoedit')
source=("https://sourceforge.net/projects/pstoedit/files/pstoedit/${pkgver}/${_srcname}-${pkgver}.tar.gz"
        "http://www.openmamba.org/pub/openmamba/milestone2/patches/autotrace-0.31.1-pstoedit.patch")
sha256sums=('06b86113f7847cbcfd4e0623921a8763143bbcaef9f9098e6def650d1ff8138c'
            '74989406876269222a5287a3f737a4627a084a0758398c92c220f118d56ef474')

prepare() {
	cd "${_srcname}-${pkgver}"
	rm --force pstoedit-config
	sed -i "s,+        echo 3.42.0,+        echo 3.70.0,g" "${srcdir}/autotrace-0.31.1-pstoedit.patch"
	patch -Np1 -i "../autotrace-0.31.1-pstoedit.patch"
}

build() {
	cd "${_srcname}-${pkgver}"
        ./configure \
                --prefix=/usr \
                --enable-static=no \
                --enable-shared=yes \
                --without-emf \
                --without-magick \
                --with-libplot \
                --with-swf \
                --with-pptx
	make
}

package() {
	cd "${_srcname}-${pkgver}"
	make DESTDIR="$pkgdir/" install
	install -D -m755 pstoedit-config "${pkgdir}"/usr/bin/pstoedit-config
}
