# Maintainer: Chih-Hsuan Yen <yan12125@gmail.com>
# Forked from community/ibus-chewing; original contributors:
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Rainy <rainylau(at)gmail(dot)com>
# Contributor: Lee.MaRS <leemars@gmail.com>
# Contributor: Hiroshi Yui <hiroshiyui@gmail.com>

_pkgname=ibus-chewing
pkgname=$_pkgname-git
pkgver=2.0.0.rc1.r0.g900596e
pkgrel=1
pkgdesc='Chinese Chewing Engine for IBus Framework'
arch=('i686' 'x86_64')
# "GPLv2+" in https://github.com/chewing/ibus-chewing/blob/1.6.2/CMakeLists.txt#L90
license=('GPL-2.0-or-later')
url='https://github.com/chewing/ibus-chewing'
depends=('ibus' 'libchewing-git' 'gtk4' 'libadwaita')
makedepends=('cmake' 'git')
checkdepends=('dbus' 'xorg-server-xvfb')
source=("git+https://github.com/definite/ibus-chewing.git")
sha512sums=('SKIP')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")

pkgver() {
  cd $_pkgname
  ( set -o pipefail
    git describe --long --tag 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
  )
}

build() {
  cd $_pkgname

  cmake -B build -S . \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_LIBEXECDIR=/usr/lib/ibus

  make -C build
}

check() {
  cd $_pkgname/build

  # glib-compile-schemas is needed for tests
  # https://github.com/chewing/ibus-chewing/blob/v2.0.0-rc1/.github/workflows/ci.yml#L33
  glib-compile-schemas ../src/setup --targetdir "$srcdir/$_pkgname/build/bin"
  GSETTINGS_SCHEMA_DIR="$srcdir/$_pkgname/build/bin/" xvfb-run --auto-display dbus-run-session make test
}

package() {
  cd $_pkgname/build
  make DESTDIR="$pkgdir" install
}
