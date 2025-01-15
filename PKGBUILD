# Maintainer: Dan Johansen <strit@strits.dk>

_pkgname=keyring
pkgbase=dfl-keyring
pkgname=(
        'dfl-keyring'
        'dfl-keyring-qt6'
)
pkgver=0.2.0
pkgrel=2
pkgdesc="A simple and easy to use implementation of Keyring"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/desktop-frameworks/$_pkgname"
license=('GPL-3.0-only')
makedepends=(
            'meson'
            'ninja'
            'qt5-base'
            'qt6-base'
)
source=("$url/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
sha256sums=('c872b84724c13ea056fb8a54d95da170f7fe0d0bea525947feb24009c21e69ed')

build() {
  cd "${_pkgname}-v${pkgver}"
  echo "Building QT5 version..."
  meson .build --prefix=/usr --buildtype=release
  ninja -C .build
  
  echo "Building QT6 version..."
  meson .build-qt6 --prefix=/usr -Duse_qt_version=qt6 --buildtype=release
  ninja -C .build-qt6
}

package_dfl-keyring() {
  depends=('qt5-base')
  optdepends=('gnome-keyring: For Gnome integration'
              'kwallet5: For Plasma integration')
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}

package_dfl-keyring-qt6() {
  depends=('qt6-base')
  optdepends=('gnome-keyring: For Gnome integration'
              'kwallet: For Plasma integration')
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build-qt6 install
}
