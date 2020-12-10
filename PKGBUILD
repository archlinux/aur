# Maintainer: Chris Lane <aur at chrislane dot com>
pkgname=quassel-core-lighter-git
pkgver=0.14.pre.r255.gb0035602
pkgrel=1
pkgdesc="Qt-based distributed IRC client (core only) - minimal dependencies"
url='https://quassel-irc.org'
license=('GPL')
arch=('i686' 'x86_64' 'arm' 'aarch64')
depends=('qt5-base')
makedepends=('git' 'extra-cmake-modules' 'ninja' 'boost')
optdepends=('qca: encryption support'
            'libldap: LDAP support')
provides=('quassel-core')
conflicts=('quassel-core')
source=("$pkgname-$pkgver"::"git+https://github.com/quassel/quassel")
md5sums=('SKIP')

_builddir="$pkgname-$pkgver/build"

pkgver() {
  cd "$srcdir/$pkgname-$pkgver"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -G Ninja                \
    -B "$_builddir"             \
    -S "$pkgname-$pkgver"     \
    -DCMAKE_BUILD_TYPE=None     \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib  \
    -DWANT_CORE=ON              \
    -DHAVE_SSL=ON               \
    -DWANT_MONO=OFF             \
    -DWANT_QTCLIENT=OFF         \
    -DWITH_KDE=OFF              \
    -DWITH_BUNDLED_ICONS=OFF    \
    -DWITH_WEBENGINE=OFF        \
    -Wno-dev                    \

  ninja -C "$_builddir"
}

package() {
  cd "$_builddir"

  DESTDIR="$pkgdir" ninja install
}

# vim:set ts=2 sw=2 et:
