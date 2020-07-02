# Maintainer: willemw <willemw12@gmail.com>

pkgname=diodon-git
pkgver=1.10.0.r0.g3dde466
pkgrel=1
pkgdesc="GTK+ clipboard manager"
arch=('x86_64')
url="https://launchpad.net/diodon"
license=('GPL2')
depends=('gobject-introspection' 'libappindicator-gtk3' 'libpeas' 'xorg-server-xvfb' 'zeitgeist')
makedepends=('cmake' 'git' 'meson' 'vala')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+https://github.com/diodon-dev/diodon.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $pkgname

  # Patch version check
  sed -i "s/appindicator_dep = dependency.*ayatana-appindicator3-0.1', version: .*/appindicator_dep = dependency('appindicator3-0.1', version: '>=0.3.0')/" meson.build
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

