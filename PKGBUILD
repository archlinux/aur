# Maintainer: memchr <memchr@proton.me>

pkgname=gnome-workbench
pkgver=44.2
pkgrel=1
pkgdesc="Code playground for GNOME"
url="https://github.com/sonnyp/Workbench"
arch=(x86_64)
license=(GPL)
depends=(
  "libadwaita>=1.4.0"
  bash
  dconf
  gcc-libs
  gjs
  glib2
  glibc
  graphene
  gtk4
  gtksourceview5
  hicolor-icon-theme
)
makedepends=(
  git
)
source=(
  "git+$url.git"
  "git+https://github.com/sonnyp/troll"
  "fix_build.patch"
  "fix_rust_deps.patch"
)
b2sums=(
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
)

prepare() {
  cd Workbench
  git submodule init
  git config submodule.troll.url "$srcdir/troll"
  git -c protocol.file.allow=always submodule update

  for patch in ../*.patch; do
    git apply -v "$patch"
  done
}

build() {
  arch-meson Workbench build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  cd "${pkgdir:-/dev/null}"
  rm -rf usr/share/re.sonny.Workbench/libworkbench/libworkbench-0.so.0.p/
  rm -rf usr/share/re.sonny.Workbench/Previewer/*.p/
}
