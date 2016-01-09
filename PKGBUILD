# Maintainer: PitBall

pkgname=lib32-openjpeg
pkgver=1.5.2
pkgrel=1
pkgdesc="An open source JPEG 2000 codec (32bit)"
arch=(x86_64)
license=('BSD')
url="http://www.openjpeg.org"
depends=('lib32-zlib' 'openjpeg')
makedepends=('lib32-libtiff' 'lib32-lcms2' 'lib32-libpng' 'gcc-multilib')
optdepends=('lib32-lcms2: j2k_to_image and image_to_j2k programs'
            'lib32-libpng: j2k_to_image and image_to_j2k programs')
source=(http://downloads.sourceforge.net/openjpeg.mirror/${pkgname}-${pkgver}.tar.gz)
sha1sums=('496e99ff1d37b73bbce6a066dd9bd3576ebca0a2')


build() {
  cd ${pkgname//lib32-}-${pkgver}
  export CC="gcc -m32"
  autoreconf -fi
  # make sure we use system libs
  rm -rf thirdparty
  ./configure --prefix=/usr libdir=/usr/lib32 \
   --enable-shared --disable-static --disable-silent-rules
  make
}

package() {
  cd ${pkgname//lib32-}-${pkgver}
  make DESTDIR="${pkgdir}" install
  rm -rf "$pkgdir"/usr/{include,share,bin}
  install -m755 -d "${pkgdir}/usr/share/licenses/lib32-openjpeg"
  ln -s "..openjpeg/LICENSE" "${pkgdir}/usr/share/licenses/lib32-openjpeg/LICENSE"
}
