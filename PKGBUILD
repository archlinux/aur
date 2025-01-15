# Maintainer: Dan Johansen <strit@strits.dk>

_pkgname=wayqt
pkgbase=dfl-wayqt
pkgname=(
        'dfl-wayqt'
        'dfl-wayqt-qt6'
)
pkgver=0.2.0
pkgrel=3
pkgdesc="A Qt-based wrapper for various wayland protocols"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/desktop-frameworks/$_pkgname"
license=('GPL-3.0-only')
depends=(
        'wayland-protocols'
        'wayland'
)
makedepends=(
            'meson'
            'ninja'
            'qt5-base'
            'qt6-base'
            'qt5-wayland'
            'qt6-wayland'
)
source=("$url/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
sha256sums=('0636d666d5ca09448336bf3eda42a016832a20bb82e4b7dc09bf79e428b02fef')

build() {
  cd "${_pkgname}-v${pkgver}"
  echo "Building QT5 version..."
  meson .build --prefix=/usr --buildtype=release
  ninja -C .build
  
  echo "Building QT6 version..."
  meson .build-qt6 --prefix=/usr -Duse_qt_version=qt6 --buildtype=release
  ninja -C .build-qt6
}

package_dfl-wayqt() {
  depends+=(
           'qt5-base'
           'qt5-wayland'
  )
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}

package_dfl-wayqt-qt6() {
  depends+=(
           'qt6-base'
           'qt6-wayland'
  )
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build-qt6 install
}
