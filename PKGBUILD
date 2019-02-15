# Maintainer: Chris Lane <aur at chrislane dot com>
pkgname=quassel-client-lighter-git
pkgver=0.14.pre.r130.g01d67be2
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
source=("$pkgname"::"git+https://github.com/quassel/quassel")
md5sums=('SKIP')

_builddir="build"

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"

  rm -rf "$_builddir"
  mkdir -p "$_builddir" && cd "$_builddir"

  cmake -G Ninja                \
    -DWANT_MONO=OFF             \
    -DWANT_CORE=OFF             \
    -DWANT_QTCLIENT=ON          \
    -DHAVE_SSL=ON               \
    -DWITH_KDE=OFF              \
    -DUSE_QT5=ON                \
    -DWITH_WEBKIT=OFF           \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib  \
    "$srcdir/$pkgname"

  ninja
}

package() {
  cd "$pkgname/$_builddir"

  DESTDIR="$pkgdir" ninja install
}

# vim:set ts=2 sw=2 et:
