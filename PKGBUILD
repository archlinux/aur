# Maintainer: kotontrion <kotontrion@tutanota.de>

pkgname=libastal-io-git
_pkgname=io
pkgver=r785.4e455bb
pkgrel=1
provides=(astal-io libastal-io libastal-io.so=0-64)
pkgdesc="IO library for libastal"
arch=(x86_64)
license=(LGPL-2.1-only)
url="https://github.com/Aylur/astal"
depends=(
  glib2
  glibc
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
            'f7210f38c29528fbe6e8dd7a162956e4d94e26fcb5b769fbbade26abd9d0e1eb')

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
  cd astal/lib/astal/$_pkgname
  arch-meson build
  meson compile -C build
}

package() {
  cd astal/lib/astal/$_pkgname
  meson install -C build --destdir "$pkgdir"
}

