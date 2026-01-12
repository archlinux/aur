# Maintainer: ilovemikael <itsmeguys2247 at gmail dot com>

# PKGBUILD forked from https://aur.archlinux.org/packages/libxml2-meson-git by 
# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# needs dlopen!
pkgname=libxml2-meson-git
pkgver=2.15.1.r39.g4c3f00ba
pkgrel=1
pkgdesc="The XML C parser and toolkit of Gnome - pkgbuild tweaked to build w/ meson instead of autotools"
arch=('i686' 'x86_64')
url="https://gitlab.gnome.org/GNOME/libxml2/-/wikis/home"
license=('custom')
depends=('glibc' 'icu' 'sh' 'xz' 'zlib')
makedepends=('git' 'meson' 'python')
provides=("libxml2=$pkgver" 'libxml2.so')
conflicts=('libxml2')
source=("git+https://gitlab.gnome.org/GNOME/libxml2.git")
sha256sums=('SKIP')

pkgver() {
  cd "libxml2"

  _tag=$(git tag -l --sort -v:refname | sed '/rc[0-9]*/d' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  arch-meson libxml2 build -Dicu=enabled -Dzlib=enabled -Dreadline=enabled -Dpython=enabled -Dmodules=enabled 
  ninja -C build
}

check() {
  meson test -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  install -Dm644 "libxml2/Copyright" -t "$pkgdir/usr/share/licenses/libxml2"
}
