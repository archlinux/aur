# Maintainer: duck <luis.tomas.nogueira@gmail.com>
pkgname=duckwm-git
_pkgname=duckwm
pkgver=0.0.0.r75.gcfdb332
pkgrel=1
pkgdesc="A graph-based tiling window manager with Lua configuration (X11)"
arch=('x86_64')
url="https://github.com/DuckTapeMan35/duckwm"
license=('GPL-3.0-or-later')
depends=('libx11' 'libxft' 'libxcursor' 'libxrandr' 'fontconfig')
makedepends=('zig>=0.16.0' 'git')
optdepends=(
  'xorg-xinit: start it with startx'
  'xterm: a terminal for the fallback config (or kitty, alacritty, wezterm)'
  'lua-language-server: completion and docs while editing the config'
)
provides=('duckwm')
conflicts=('duckwm')
backup=('etc/duckwm/config.lua')
install=duckwm.install
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "%s.r%s.g%s" \
    "$(git describe --tags --abbrev=0 2>/dev/null || echo "0.0.0")" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"
  # Dependencies are fetched here, into the build directory, so build()
  # doesn't need the network or the builder's own Zig cache.
  export ZIG_GLOBAL_CACHE_DIR="$srcdir/zig-global-cache"
  zig build --fetch
}

build() {
  cd "$_pkgname"
  export ZIG_GLOBAL_CACHE_DIR="$srcdir/zig-global-cache"
  # ReleaseSafe keeps Zig's safety checks: a bug stops duckwm with a
  # message instead of corrupting its state. baseline: runs on any x86_64.
  zig build --summary none -Doptimize=ReleaseSafe -Dcpu=baseline -Dplatform=x11 \
    --prefix "$srcdir/out"
  zig build meta
}

package() {
  # duckwm, quack and the protocol definition, as zig build installed them.
  cp -a "$srcdir/out/." "$pkgdir/usr/"

  cd "$_pkgname"
  install -Dm644 config/default.lua "$pkgdir/etc/duckwm/config.lua"
  install -Dm644 dist/duckwm.desktop "$pkgdir/usr/share/xsessions/duckwm.desktop"
  install -Dm644 meta/wm.lua "$pkgdir/usr/share/duckwm/meta/wm.lua"
  install -Dm644 dist/luarc.json "$pkgdir/usr/share/duckwm/luarc.json"
  install -Dm644 -t "$pkgdir/usr/share/doc/duckwm" \
    README.md guide.md guide.norg API.md API.norg
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
