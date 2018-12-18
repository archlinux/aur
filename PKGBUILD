# Maintainer: David Herrmann <dh.herrmann@gmail.com>

_pkgorg=bus1
_pkgname=dbus-broker
pkgdesc='Linux D-Bus Message Broker'
pkgver=r1297.97428cb
pkgrel=1

pkgname=$_pkgname-git
arch=('i686' 'x86_64')
url="https://github.com/$_pkgorg/$_pkgname"
license=('Apache')
depends=('libsystemd' 'expat')
makedepends=('git' 'meson' 'systemd' 'python-docutils')
provides=("$_pkgname")
conflicts=("$_pkgname")

source=("$pkgname::git+https://github.com/$_pkgorg/$_pkgname"
        "git+https://github.com/c-util/c-dvar"
        "git+https://github.com/c-util/c-ini"
        "git+https://github.com/c-util/c-list"
        "git+https://github.com/c-util/c-rbtree"
        "git+https://github.com/c-util/c-shquote"
        "git+https://github.com/c-util/c-sundry"
        "git+https://github.com/c-util/c-utf8")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  rm -Rf build
  mkdir build
  cd $pkgname

  git submodule init
  git config --local submodule.subprojects/c-dvar.url   "$srcdir/c-dvar"
  git config --local submodule.subprojects/c-dvar.url   "$srcdir/c-ini"
  git config --local submodule.subprojects/c-list.url   "$srcdir/c-list"
  git config --local submodule.subprojects/c-rbtree.url "$srcdir/c-rbtree"
  git config --local submodule.subprojects/c-sundry.url "$srcdir/c-shquote"
  git config --local submodule.subprojects/c-sundry.url "$srcdir/c-sundry"
  git config --local submodule.subprojects/c-utf8.url   "$srcdir/c-utf8"
  git submodule update
}

build() {
  cd build
  CFLAGS="$CFLAGS -Wno-unused-parameter"
  CFLAGS="$CFLAGS -Wno-maybe-uninitialized"
  arch-meson -Ddocs=true ../$pkgname
  ninja
}

check() {
  cd build
  meson test
}

package() {
  cd build
  DESTDIR="$pkgdir" ninja install
}

# vim:set sw=2 et:
