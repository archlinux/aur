# Maintainer: willemw <willemw12@gmail.com>

pkgname=diodon-git
pkgver=1.9.0.r0.g396cd4d
pkgrel=1
pkgdesc="GTK+ clipboard manager"
arch=('x86_64')
url="https://launchpad.net/diodon"
license=('GPL2')
depends=('gobject-introspection' 'libappindicator-gtk3' 'libpeas' 'xorg-server-xvfb' 'zeitgeist')
makedepends=('cmake' 'git' 'meson' 'vala')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=($pkgname::git+https://github.com/diodon-dev/diodon.git)
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $pkgname
  # Comment out the following lines to enable the build tests
  rm -rf tests/*
  touch tests/meson.build
}

build() {
  cd $pkgname
  meson --prefix /usr --buildtype=plain . builddir    # -Ddisable-indicator-plugin=true
  ninja -C builddir
}

check() {
  cd $pkgname
  ninja -C builddir test
}

package() {
  cd $pkgname
  DESTDIR="$pkgdir" ninja -C builddir install
}

