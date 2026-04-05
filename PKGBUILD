# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: shimi <shimi.chen@gmail.com>
# Contributor: Dmytro Meleshko <dmytro.meleshko@gmail.com>
pkgname=imagewriter
_pkgver=1.10.1432200249.1d253d9-2.24
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A graphical utility for writing raw disk images & hybrid isos to USB keys"
arch=('x86_64')
url="https://github.com/openSUSE/imagewriter"
license=('GPL-2.0-only')
depends=(
  'hicolor-icon-theme'
  'qt5-base'
  'udisks2'
)
source=("https://download.opensuse.org/tumbleweed/repo/src-oss/src/$pkgname-${_pkgver}.src.rpm")
sha256sums=('8c99c3a91d4516a675a2c7eaf96a1fc54b7af8b0c2d779113b44820d8f490d9b')

prepare() {
  bsdtar xvf "$pkgname-${_pkgver%-*}.tar.xz"

  cd "$pkgname-${_pkgver%-*}"
  patch -Np1 -i ../0001-remove-include-sys-sysctl.h.patch

  # Replace calls to deprecated toAscii method with calls to toLatin1
  find . -type f -exec sed -i 's/toAscii/toLatin1/g' {} \;
}

build() {
  cd "$pkgname-${_pkgver%-*}"
  qmake-qt5 \
    QMAKE_CFLAGS="${CFLAGS} -DKIOSKHACK" \
    QMAKE_CXXFLAGS="${CXXFLAGS} -DKIOSKHACK" \
    QMAKE_LFLAGS="${LDFLAGS}" \
    PREFIX="$pkgdir/usr" \
    DEFINES=USEUDISKS2 \
    "$pkgname.pro"
  make
}

package() {
  cd "$pkgname-${_pkgver%-*}"
  make DESTDIR="$pkgdir" install
}
