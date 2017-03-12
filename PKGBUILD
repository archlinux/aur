# $Id$
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Rainy <rainylau(at)gmail(dot)com>
# Contributor: Lee.MaRS <leemars@gmail.com>
# Contributor: Hiroshi Yui <hiroshiyui@gmail.com>

_pkgname=ibus-chewing
pkgname=$_pkgname-git
pkgver=1.5.1.r38.gf4c192d
pkgrel=2
pkgdesc='Chinese Chewing Engine for IBus Framework'
arch=('i686' 'x86_64')
license=('GPL')
url='https://github.com/definite/ibus-chewing'
depends=('ibus' 'libchewing-git')
makedepends=('gob2' 'cmake' 'git')
checkdepends=('xorg-server-xvfb')
source=("git+https://github.com/definite/ibus-chewing.git"
        "git+https://pagure.io/cmake-fedora.git")
sha512sums=('SKIP'
            'SKIP')
provides=(ibus-chewing)
conflicts=(ibus-chewing)

pkgver() {
  cd $_pkgname
  ( set -o pipefail
    git describe --long --tag 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd $_pkgname

  git submodule init
  git config submodule.cmake-fedora.url "$srcdir/cmake-fedora"
  git submodule update
}

build() {
  cd $_pkgname
  cmake . -DCMAKE_INSTALL_PREFIX=/usr \
    -DSYSCONF_INSTALL_DIR=/usr/share \
    -DLIBEXEC_DIR=/usr/lib/ibus
  make
  make translations
}

check() {
  cd $_pkgname

  # How to run dbus-daemon in clean chroots?
  [[ -z "$DBUS_SESSION_BUS_ADDRESS" ]] && return

  GSETTINGS_SCHEMA_DIR="$srcdir/$_pkgname/bin/" xvfb-run make test
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install
}
