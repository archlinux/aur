# Maintainer: kotontrion <kotontrion@tutanota.de>

pkgname=libastal-greetd-git
_pkgname=greet
pkgver=r785.4e455bb
pkgrel=1
provides=(astal-greet libastal-greet libastal-greet.so=0-64)
pkgdesc="IPC client for greetd"
arch=(x86_64)
license=(LGPL-2.1-only)
url="https://github.com/Aylur/astal"
depends=(
  glib2
  glibc
  json-glib
)
makedepends=(
  meson
  git
  gobject-introspection
  vala
)
groups=("libastal")
source=("git+${url}.git" "skip_valadoc.patch")
sha256sums=('SKIP'
            'd48b18f36a44a3f6102fb84edb2e9d4f3b3402d33a52cef7ba89587ce960ade3')

pkgver() {
  cd astal
  #git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd astal 
    patch -Np1 -i ../skip_valadoc.patch
}


build() {
  cd astal/lib/$_pkgname
  arch-meson build
  meson compile -C build
}

package() {
  cd astal/lib/$_pkgname
  meson install -C build --destdir "$pkgdir"
}

