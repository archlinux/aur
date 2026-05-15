# Maintainer: duck <luis.tomas.nogueira@gmail.com>
pkgname=duckwm-git
pkgver=0.0.0.r36.ge2ae1ef
pkgrel=1
pkgdesc="A graph-based tiling window manager with Lua configuration"
arch=('x86_64')
url="https://github.com/DuckTapeMan35/duckwm"
license=('GPL-3.0-or-later')
depends=('libx11')
makedepends=('zig>=0.16.0' 'git')
optdepends=(
    'lua-language-server: LuaLS completion for config editing'
    'xterm: default terminal emulator in fallback config'
)
provides=('duckwm')
conflicts=('duckwm')
backup=('etc/duckwm/config.lua')
install=duckwm.install
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "%s.r%s.g%s" \
        "$(git describe --tags --abbrev=0 2>/dev/null || echo "0.0.0")" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"
    zig build -Doptimize=ReleaseFast
    zig build meta
}

package() {
    cd "$pkgname"
    install -Dm755 zig-out/bin/duckwm \
        "$pkgdir/usr/bin/duckwm"
    install -Dm644 config/default.lua \
        "$pkgdir/etc/duckwm/config.lua"
    install -Dm644 dist/duckwm.desktop \
        "$pkgdir/usr/share/xsessions/duckwm.desktop"
    install -Dm644 dist/duckwm.desktop \
        "$pkgdir/usr/share/applications/duckwm.desktop"
    install -Dm644 meta/wm.lua \
        "$pkgdir/usr/share/duckwm/meta/wm.lua"
    install -Dm644 API.md \
        "$pkgdir/usr/share/doc/duckwm/API.md"
    install -Dm644 API.norg \
        "$pkgdir/usr/share/doc/duckwm/API.norg"
    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/duckwm/LICENSE"
}
