# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: lorim <lorimz@gmail.com>

pkgname=lib32-libtiff4
pkgver=3.9.7
pkgrel=3
pkgdesc='Library for manipulation of TIFF images'
arch=(x86_64)
url=http://www.simplesystems.org/libtiff/
license=(custom)
depends=(
  lib32-gcc-libs
  lib32-glibc
  lib32-libjpeg-turbo
  lib32-zlib
)
makedepends=(git)
source=(git+https://gitlab.com/libtiff/libtiff.git#tag=Release-v${pkgver//./-})
sha256sums=(SKIP)

prepare() {
  cd libtiff

  ./autogen.sh
}

build() {
  cd libtiff

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH=/usr/lib32/pkgconfig

  ./configure \
    --prefix='/usr' \
    --libdir='/usr/lib32'
  make
}

package() {
  make DESTDIR="${pkgdir}" -C libtiff install
  rm -rf "${pkgdir}"/usr/{bin,include,lib32/libtiff{,xx}.{a,so,so.3},share}
  # Rename 3.9.7 to 4.3.7, 3.6.x was the first release with the unintentional ABI change
  mv "${pkgdir}"/usr/lib32/libtiff.so.{3.9.7,4.3.7}
  mv "${pkgdir}"/usr/lib32/libtiffxx.so.{3.9.7,4.3.7}
  ln -s libtiff.so.4.3.7 "${pkgdir}"/usr/lib32/libtiff.so.4
  ln -s libtiffxx.so.4.3.7 "${pkgdir}"/usr/lib32/libtiffxx.so.4
  install -dm 755 "${pkgdir}"/usr/share/licenses
  ln -s libtiff4 "${pkgdir}"/usr/share/licenses/lib32-libtiff4
}

# vim: ts=2 sw=2 et:
