# Maintainer:  Vincent Grande <shoobe420@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: lorim <lorimz@gmail.com>

pkgname=libtiff4-git
pkgver=3.9.7
pkgrel=1
pkgdesc='Library for manipulation of TIFF images'
arch=(x86_64)
url=http://www.simplesystems.org/libtiff/
license=(custom)
depends=(
  gcc-libs
  libjpeg-turbo
  zlib
)
makedepends=(git)
provides=(libtiff4)
conflicts=(libtiff4)
source=(
  git+https://gitlab.com/libtiff/libtiff.git#branch=branch-3.9
  libtiff4-soname.patch
)
sha256sums=(
  SKIP
  SKIP
)

pkgver() {
  cd libtiff
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd libtiff

  # Rename 3.9.7 to 4.3.7, 3.6.x was the first release with the unintentional ABI change
  patch -Np1 -i ../libtiff4-soname.patch

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
  rm -rf "${pkgdir}"/usr/{bin,include,lib/libtiff{,xx}.{a,so},share}
  install -Dm 644 libtiff/COPYRIGHT -t "${pkgdir}"/usr/share/licenses/libtiff4/
}

# vim: ts=2 sw=2 et:
