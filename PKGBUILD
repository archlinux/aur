# Maintainer: Ottatop <ottatop1227@gmail.com>

pkgname=pinnacle-comp
_pkgname=pinnacle
pkgver=0.1.0
_pkgver=0.1.0
pkgrel=1
pkgdesc="A Wayland compositor inspired by AwesomeWM"
arch=(x86_64)
url="https://github.com/pinnacle-comp/$_pkgname"
license=("GPL-3.0-or-later")
depends=(
    wayland
    libxkbcommon
    libinput
    mesa
    seatd
    systemd-libs
    libdisplay-info
    xorg-xwayland
    protobuf
    # Lua API
    lua
    lua-cqueues
    lua-http
    lua-protobuf
    lua-posix
)
makedepends=(cargo git luarocks)
optdepends=(
    "xdg-desktop-portal-gtk: a suggested XDG desktop portal"
    "xdg-desktop-portal-wlr: for portal-based screencasting and screenshotting"
)
# Trying not to clash with the already existing `pinnacle` package out there
provides=(pinnacle-comp)
conflicts=(pinnacle-comp)
source=("$_pkgname-$_pkgver.tar.gz::https://github.com/pinnacle-comp/pinnacle/archive/v$_pkgver.tar.gz")
sha256sums=('9002dd4caa8ab8d7831a8e66f449e535a8bfef6b04eeac9afd98ca1e4b5a3fb4')
b2sums=('6b90ae1b0c80a916dce078b0961523b8d07f2b383913f1939a992ff884ca9ff7be60cc185a98a8e2e6c0bee10976e5149703cbfcd5057b8ee1e7484e964c0814')

prepare() {
	cd "$_pkgname-$_pkgver"
	export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$_pkgname-$_pkgver"
	export RUSTUP_TOOLCHAIN=stable

    # Git info (should probably automate if possible)
    export VERGEN_GIT_BRANCH=main
    export VERGEN_GIT_COMMIT_MESSAGE="release: Fix rockspec"
    export VERGEN_GIT_SHA="a8974da"
    export VERGEN_GIT_DIRTY="false"

	cargo build --frozen --release

    mkdir completions
    ./target/release/$_pkgname gen-completions --shell bash > completions/$_pkgname
    ./target/release/$_pkgname gen-completions --shell fish > completions/$_pkgname.fish
    ./target/release/$_pkgname gen-completions --shell zsh > completions/_$_pkgname
    ./target/release/$_pkgname gen-completions --shell elvish > completions/$_pkgname.elv

    cd "api/lua"
    luarocks --lua-version 5.4 make --pack-binary-rock --deps-mode none --no-manifest pinnacle-api-dev-1.rockspec
}

package() {
	cd "$_pkgname-$_pkgver"
	install -Dm755 target/release/${_pkgname} -t "$pkgdir/usr/bin/"
    install -Dm755 resources/${_pkgname}-session -t "$pkgdir/usr/bin/"
    install -Dm644 resources/${_pkgname}.desktop -t "$pkgdir/usr/share/wayland-sessions/"
    install -Dm644 resources/${_pkgname}-portals.conf -t "$pkgdir/usr/share/xdg-desktop-portal/"
    install -Dm644 resources/${_pkgname}{.service,-shutdown.target} -t "$pkgdir/usr/lib/systemd/user/"

    install -Dm644 completions/$_pkgname -t "$pkgdir/usr/share/bash-completion/completions/"
    install -Dm644 completions/$_pkgname.fish -t "$pkgdir/usr/share/fish/vendor_completions.d/"
    install -Dm644 completions/_$_pkgname -t "$pkgdir/usr/share/zsh/site-functions/"
    install -Dm644 completions/$_pkgname.elv -t "$pkgdir/usr/share/elvish/lib/"

    cd "$srcdir/$_pkgname-$_pkgver/api/protobuf"
    for proto in $(find . -type f -name "*.proto"); do
        install -Dm644 "$proto" "$pkgdir/usr/share/$_pkgname/protobuf/${proto#\./}"
    done

    cd "$srcdir/$_pkgname-$_pkgver/snowcap/api/protobuf"
    for proto in $(find . -type f -name "*.proto"); do
        install -Dm644 "$proto" "$pkgdir/usr/share/$_pkgname/snowcap/protobuf/${proto#\./}"
    done

    cd "$srcdir/$_pkgname-$_pkgver/api/lua"
    luarocks --lua-version 5.4 --tree "$pkgdir/usr/" install --deps-mode none --no-manifest ./*.rock
}
