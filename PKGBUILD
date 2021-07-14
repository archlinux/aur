# Maintainer: willemw <willemw12@gmail.com>

pkgname=diodon-git
pkgver=1.11.0.r3.g42f0c80
pkgrel=1
pkgdesc="GTK+ clipboard manager"
arch=('x86_64')
url="https://launchpad.net/diodon"
license=('GPL2')
depends=('gobject-introspection' 'libappindicator-gtk3' 'libpeas' 'xorg-server-xvfb' 'zeitgeist')
makedepends=('git' 'meson' 'vala')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+https://github.com/diodon-dev/diodon.git")
sha256sums=('SKIP')

pkgver() {
  git -C $pkgname describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  # Patch version check
  sed -i "s/\(appindicator_dep = dependency.*\)ayatana-appindicator\(.*\)',.*/\1appindicator\2', version: '>=0.0.0')/" $pkgname/meson.build
}

build() {
  arch-meson $pkgname build
  meson compile -C build
  ninja -C build
}

check() {
  meson test -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}

