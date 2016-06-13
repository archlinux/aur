# $Id$
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Rainy <rainylau(at)gmail(dot)com>
# Contributor: Lee.MaRS <leemars@gmail.com>
# Contributor: Hiroshi Yui <hiroshiyui@gmail.com>

_pkgname=ibus-chewing
pkgname=$_pkgname-git
pkgver=1.5.0.r40.g13e45b4
_cmakefedoraver=2.6.0
pkgrel=1
pkgdesc='Chinese Chewing Engine for IBus Framework'
arch=('i686' 'x86_64')
license=('GPL')
url='http://ibus.googlecode.com'
depends=('ibus' 'libchewing-git')
makedepends=('gob2' 'cmake' 'git')
source=("git+https://github.com/definite/ibus-chewing.git"
        "git+http://git.fedorahosted.org/git/cmake-fedora.git#tag=$_cmakefedoraver")
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
  ln -s ../cmake-fedora/Modules ./
}

build() {
  cd $_pkgname
  cmake . -DCMAKE_INSTALL_PREFIX=/usr \
    -DSYSCONF_INSTALL_DIR=/usr/share \
    -DLIBEXEC_DIR=/usr/lib/ibus
  make
  make translations
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install
}
