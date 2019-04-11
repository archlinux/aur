# Maintainer: David Herrmann <dh.herrmann@gmail.com>

_pkgorg=bus1
_pkgname=dbus-broker
pkgdesc='Linux D-Bus Message Broker'
pkgver=r1358.ced4d83
pkgrel=1

pkgname=$_pkgname-git
arch=('x86_64')
url="https://github.com/$_pkgorg/$_pkgname"
license=('Apache')
depends=('audit' 'expat' 'systemd-libs')
makedepends=('git' 'meson' 'systemd' 'python-docutils')
provides=("$_pkgname")
conflicts=("$_pkgname")

source=("$pkgname::git+https://github.com/$_pkgorg/$_pkgname"
        git+https://github.com/c-util/c-{dvar,ini,list,rbtree,shquote,stdaux,utf8})
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

  local sm
  for sm in c-{dvar,ini,list,rbtree,shquote,stdaux,utf8}; do
    git config --local submodule.subprojects/$sm.url "$srcdir/$sm"
  done

  git submodule update
}

build() {
  cd build
  CFLAGS="$CFLAGS -Wno-unused-parameter"
  CFLAGS="$CFLAGS -Wno-maybe-uninitialized"
  arch-meson -Ddocs=true -Daudit=true "." "../$pkgname"
  ninja
}

check() {
  cd build
  meson test
}

package() {
  cd build
  DESTDIR="$pkgdir" meson install
}

# vim:set sw=2 et:
