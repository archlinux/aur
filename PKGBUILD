# Maintainer: Dan Johansen <strit@strits.dk>
# Contributor: Marcus Britanicus

pkgbase=libarchive-qt
pkgname=('libarchive-qt' 'libarchive-qt-qt6')
pkgver=2.0.8
pkgrel=3
pkgdesc="A Qt based archiving solution with libarchive backend"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/marcusbritanicus/$pkgbase"
license=('LGPL-3.0-or-later')
depends=(
        'libarchive'
        'zlib'
        'bzip2'
        'xz'
)
makedepends=(
            'meson'
            'ninja'
            'qt5-base'
            'qt6-base'
)
source=("https://gitlab.com/marcusbritanicus/$pkgbase/-/archive/v$pkgver/$pkgbase-v$pkgver.tar.gz")
sha256sums=('81ef33fa0ee3eb40ea3e556dcb0c220564fd763a6d5a986248ad55e246af07a8')

build() {
  cd "${pkgbase}-v${pkgver}"
  echo "Building QT5 version..."
  meson .build --prefix=/usr --buildtype=release
  ninja -C .build

  echo "Building QT6 version..."
  meson .build-qt6 --prefix=/usr -Duse_qt_version=qt6 --buildtype=release
  ninja -C .build-qt6
}

package_libarchive-qt() {
  depends+=('qt5-base')
  cd "${pkgbase}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}

package_libarchive-qt-qt6() {
  depends+=('qt6-base')
  cd "${pkgbase}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build-qt6 install
}
