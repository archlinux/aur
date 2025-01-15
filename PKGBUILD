# Maintainer: Dan Johansen <strit@strits.dk>

## Build order:
## dfl-ipc -> dfl-applications

_pkgname=applications
pkgbase=dfl-applications
pkgname=(
        'dfl-applications'
        'dfl-applications-qt6'
)
pkgver=0.2.0
pkgrel=2
pkgdesc="A class that extends QApplications"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/desktop-frameworks/$_pkgname"
license=('GPL-3.0-only')
makedepends=(
            'meson'
            'ninja'
            'qt5-base'
            'qt6-base'
            'dfl-ipc'
            'dfl-ipc-qt6'
)
source=("$url/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
sha256sums=('617fcff64e1e726f7c1c52795eb985774528a55a028a432099a8736fef705e7e')

build() {
  cd "${_pkgname}-v${pkgver}"
  echo "Building QT5 version..."
  meson .build --prefix=/usr --buildtype=release
  ninja -C .build
  
  echo "Building QT6 version..."
  meson .build-qt6 --prefix=/usr -Duse_qt_version=qt6 --buildtype=release
  ninja -C .build-qt6
}

package_dfl-applications() {
  depends=(
          'qt5-base'
          'dfl-ipc'
  )
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}

package_dfl-applications-qt6() {
  depends=(
          'qt6-base'
          'dfl-ipc-qt6'
  )
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build-qt6 install
}
