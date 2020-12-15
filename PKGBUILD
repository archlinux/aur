# Maintainer: Chris Lane <aur at chrislane dot com>
pkgname=quassel-client-lighter-git
pkgver=0.14.pre.r257.gf13f99af
pkgrel=1
pkgdesc="Qt-based distributed IRC client (client only) - minimal dependencies"
url='https://quassel-irc.org'
license=('GPL')
arch=('i686' 'x86_64' 'arm' 'aarch64')
depends=('qt5-base')
makedepends=('git' 'extra-cmake-modules' 'ninja' 'boost')
optdepends=('sonnet: spell checking support'
            'hicolor-icon-theme: hicolor theme hierarchy support'
            'libdbusmenu-qt5: dbus context menu for icon tray support'
            'qt5-tools: translations support'
            'qt5-multimedia: audio notification support'
            'snorenotify: snorenotify notification framework support')
provides=('quassel-client')
conflicts=('quassel-client')
source=("git+https://github.com/quassel/quassel")
md5sums=('SKIP')

pkgver() {
  cd quassel
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -G Ninja                \
    -B build                    \
    -S quassel                  \
    -DCMAKE_BUILD_TYPE=None     \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib  \
    -DWANT_QTCLIENT=ON          \
    -DHAVE_SSL=ON               \
    -DWANT_MONO=OFF             \
    -DWANT_CORE=OFF             \
    -DWITH_KDE=OFF              \
    -DWITH_WEBKIT=OFF           \
    -Wno-dev

  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja install -C build
}

# vim:set ts=2 sw=2 et:
