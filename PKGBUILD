# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: shimi <shimi.chen@gmail.com>
# Contributor: Dmytro Meleshko <dmytro.meleshko@gmail.com>
pkgname=imagewriter
_pkgver=1.10.1432200249.1d253d9-2.25
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
sha256sums=('a09a2557df73e72f757c604a481ac52461c336681159e0e7eded8375bf109627')

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
