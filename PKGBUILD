# Maintainer: Chris Lane <aur at chrislane dot com>
pkgname=quassel-core-lighter-git
pkgver=0.14.pre.r130.g01d67be2
pkgrel=1
pkgdesc="Qt-based distributed IRC client (core only) - minimal dependencies"
url='https://quassel-irc.org'
license=('GPL')
arch=('i686' 'x86_64' 'arm' 'aarch64')
depends=('qt5-script')
makedepends=('git' 'extra-cmake-modules' 'ninja' 'boost')
optdepends=('qca: encryption support'
            'libldap: LDAP support'
            'qt5-tools: translations support')
provides=('quassel-core')
conflicts=('quassel-core')
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

  cmake -G Ninja                  \
    -DWANT_MONO=OFF             \
    -DWANT_CORE=ON              \
    -DWANT_QTCLIENT=OFF         \
    -DHAVE_SSL=ON               \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib  \
    -DUSE_QT5=ON                \
    "$srcdir/$pkgname"

  ninja
}

package() {
  cd "$pkgname/$_builddir"

  DESTDIR="$pkgdir" ninja install
}

# vim:set ts=2 sw=2 et:
