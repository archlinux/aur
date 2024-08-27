# Maintainer: Dan Johansen <strit@strits.dk>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Librewish <librewish@gmail.com?

pkgbase=greetd-qtgreet
pkgname=('greetd-qtgreet' 'greetd-qtgreet-qt6')
_pkgname=QtGreet
pkgver=2.0.2
pkgrel=3
pkgdesc='Qt based greeter for greetd'
arch=('aarch64' 'x86_64')
url="https://gitlab.com/marcusbritanicus/$_pkgname"
license=('GPL-3.0-only')
makedepends=('meson'
            'ninja'
            'qt5-base'
            'dfl-wayqt'
            'dfl-login1'
            'dfl-applications'
            'dfl-utils'
            'qt6-base'
            'dfl-wayqt-qt6'
            'dfl-login1-qt6'
            'dfl-applications-qt6'
            'dfl-utils-qt6'
            'mpv'
            'wlroots0.17')
backup=("etc/qtgreet/config.ini"
        "etc/qtgreet/sway.cfg"
        "etc/qtgreet/users.conf"
        "etc/qtgreet/wayfire.ini")
source=("$pkgbase-$pkgver.tar.gz::$url/-/archive/v$pkgver/$_pkgname-v$pkgver.tar.gz")
sha256sums=('a9e79d4ab498b54b02f246e67781a4622049eb77f507a4120e8a12298081d453')

build() {
  cd "${_pkgname}-v${pkgver}"
  echo "Building QT5 version..."
  PKG_CONFIG_PATH=/usr/lib/wlroots0.17/pkgconfig \
  meson .build --prefix=/usr -Duse_qt_version=qt5 --buildtype=release
  ninja -C .build

  echo "Building QT6 version..."
  PKG_CONFIG_PATH=/usr/lib/wlroots0.17/pkgconfig \
  meson .build-qt6 --prefix=/usr -Duse_qt_version=qt6 --buildtype=release
  ninja -C .build-qt6
}

package_greetd-qtgreet() {
  depends=('qt5-base'
          'dfl-wayqt'
          'dfl-login1'
          'dfl-applications'
          'dfl-utils'
          'mpv'
          'wlroots0.17')
  optdepends=('wayfire')
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}

package_greetd-qtgreet-qt6() {
  depends=('qt6-base'
          'dfl-wayqt-qt6'
          'dfl-login1-qt6'
          'dfl-applications-qt6'
          'dfl-utils-qt6'
          'mpv'
          'wlroots0.17')
  optdepends=('wayfire')
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build-qt6 install
}
