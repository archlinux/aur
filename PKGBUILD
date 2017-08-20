# Maintainer: David Herrmann <dh.herrmann@gmail.com>
# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=dbus-broker
pkgver=3
pkgrel=1

pkgdesc='Linux D-Bus Message Broker'
arch=('i686' 'x86_64')
url='https://github.com/bus1/dbus-broker'
license=('Apache')
depends=('libsystemd' 'expat' 'glib2')
makedepends=('git' 'meson' 'systemd' 'python-docutils')

_commit=27ca14d0e43891d2d094a6ab3317e0e8e957fc31  # tags/v3
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

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/^v//;s/-/+/g'
}

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
  meson ../$pkgname --prefix=/usr --buildtype=release -Db_lto=true
  ninja
  make -C ../$pkgname BUILDDIR="$PWD" docs
}

check() {
  cd build
  mesontest
}

package() {
  cd build
  DESTDIR="$pkgdir" ninja install
  install -Dt "$pkgdir/usr/share/man/man1" -m644 docs/*.1
}

# vim:set sw=2 et:
