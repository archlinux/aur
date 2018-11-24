# Maintainer: Chris Lane <aur at chrislane dot com>
pkgname=quassel-client-lighter-git
pkgver=0.14.pre.r110.g7c0eb011
pkgrel=1
pkgdesc="Qt-based distributed IRC client (client only) - minimal dependencies"
url='https://quassel-irc.org'
license=('GPL')
arch=('i686' 'x86_64' 'arm' 'aarch64')
depends=('qt5-base')
makedepends=('git' 'cmake' 'extra-cmake-modules' 'ninja' 'qt5-base' 'boost')
optdepends=('sonnet: spell checking support'
            'hicolor-icon-theme: hicolor theme hierarchy support'
            'libdbusmenu-qt5: dbus context menu for icon tray support')
provides=('quassel-client')
conflicts=('quassel-client')
source=("$pkgname"::"git+https://github.com/quassel/quassel.git")
md5sums=('SKIP')

_builddir="build"
_cmakecache="CMakeCache.txt"

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

_prepare_build() {
    cd $srcdir/$pkgname
    mkdir -p "$_builddir"
    cd "$_builddir"
}

_build() {
    ninja

    DESTDIR="$pkgdir" ninja install
}

package() {
    _prepare_build

    cmake -G Ninja                    \
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

    _build
}
