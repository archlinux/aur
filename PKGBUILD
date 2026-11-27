# Maintainer: Nythera Dev <https://github.com/Nythera-Dev>
_pkgname=nythera-lib
pkgname=${_pkgname}-git
pkgver=0.1.0.r17.gbc201312d9aa
pkgrel=2
pkgdesc='Shared infrastructure for Nythera Shell and Files'
arch=(x86_64)
url='https://github.com/Nythera-Dev/NytheraLib'
license=(MIT Apache-2.0)
depends=(cairo curl fontconfig freetype2 glib2 glibc harfbuzz libgcc libglvnd libjxl
         librsvg libstdc++ libwebp libxkbcommon md4c nlohmann-json pango
         tomlplusplus wayland zlib)
makedepends=(cmake git meson ninja pkgconf stb 'toml11>=4.4' 'toml11<5' wayland-protocols)
provides=("${_pkgname}=${pkgver%%.r*}" libnythera_lib.so)
conflicts=("$_pkgname")
options=(!debug)
source=("${_pkgname}::git+${url}.git#branch=testing")
sha256sums=(SKIP)

pkgver() {
  cd "$srcdir/$_pkgname"
  printf '%s.r%s.g%s' "$(cat VERSION)" "$(git rev-list --count HEAD)" "$(git rev-parse --short=12 HEAD)"
}

build() {
  arch-meson "$srcdir/$_pkgname" "$srcdir/build" -Dtests=disabled -Dnative_optimizations=false
  meson compile -C "$srcdir/build"
}

package() {
  meson install -C "$srcdir/build" --no-rebuild --destdir "$pkgdir"
}
