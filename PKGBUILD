# Maintainer: David Herrmann <dh.herrmann@gmail.com>
# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=dbus-broker
pkgver=1rc1
pkgrel=1

pkgdesc='Linux D-Bus Message Broker'
arch=('i686' 'x86_64')
url='https://github.com/bus1/dbus-broker'
license=('Apache')
depends=('libsystemd' 'expat' 'glib2')
makedepends=('git' 'meson' 'systemd')

_commit=c167477902e6a6e32aff5e818b21783006699834 # v1rc1
source=("git+https://github.com/bus1/dbus-broker#commit=$_commit"
        "git+https://github.com/c-util/c-rbtree"
        "git+https://github.com/c-util/c-sundry"
        "git+https://github.com/c-util/c-list"
        "git+https://github.com/c-util/c-dvar")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
  rm -Rf build
  mkdir build
  cd $pkgname

  git submodule init
  git config --local submodule.subprojects/c-rbtree.url "$srcdir/c-rbtree"
  git config --local submodule.subprojects/c-sundry.url "$srcdir/c-sundry"
  git config --local submodule.subprojects/c-list.url   "$srcdir/c-list"
  git config --local submodule.subprojects/c-dvar.url   "$srcdir/c-dvar"
  git submodule update
}

build() {
  cd build
  meson --prefix=/usr --buildtype=release ../$pkgname
  ninja
}

check() {
  cd build
  mesontest
}

package() {
  cd build
  DESTDIR="$pkgdir" ninja install
}

# vim:set sw=2 et:
