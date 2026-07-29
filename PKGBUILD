# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: shimi <shimi.chen@gmail.com>
# Contributor: Dmytro Meleshko <dmytro.meleshko@gmail.com>
pkgname=imagewriter
_pkgver=1.10.1432200249.1d253d9-2.27
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
sha256sums=('81af0f56fafeddde487ed2cdcc4d0685b4d26ae2ab407f1828e9af5be4b73fa7')

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
