# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: lorim <lorimz@gmail.com>

pkgname=libtiff4
pkgver=3.9.7
pkgrel=3
pkgdesc='Library for manipulation of TIFF images'
arch=(x86_64)
url=http://www.simplesystems.org/libtiff/
license=(custom)
depends=(
  libjpeg-turbo
  zlib
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

  ./configure \
    --prefix='/usr'
  make
}

package() {
  make DESTDIR="${pkgdir}" -C libtiff install
  rm -rf "${pkgdir}"/usr/{bin,include,lib/libtiff{,xx}.{a,so,so.3},share}
  # Rename 3.9.7 to 4.3.7, 3.6.x was the first release with the unintentional ABI change
  mv "${pkgdir}"/usr/lib/libtiff.so.{3.9.7,4.3.7}
  mv "${pkgdir}"/usr/lib/libtiffxx.so.{3.9.7,4.3.7}
  ln -s libtiff.so.4.3.7 "${pkgdir}"/usr/lib/libtiff.so.4
  ln -s libtiffxx.so.4.3.7 "${pkgdir}"/usr/lib/libtiffxx.so.4
  install -Dm 644 libtiff/COPYRIGHT -t "${pkgdir}"/usr/share/licenses/libtiff4/
}

# vim: ts=2 sw=2 et:
