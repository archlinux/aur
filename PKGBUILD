# Maintainer: Ottatop <ottatop1227@gmail.com>

pkgname=pinnacle-comp
_pkgname=pinnacle
pkgver=0.2.0
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
source=(
    "$_pkgname-$pkgver.tar.gz::https://github.com/pinnacle-comp/pinnacle/archive/v$pkgver.tar.gz"
    "https://github.com/pinnacle-comp/pinnacle/releases/download/v$pkgver/pinnacle-api-$pkgver-1.all.rock"
)
sha256sums=('4465d70316d06b3773515e3f0c75b198866f1f2d8cb15f856e0564a71dec5ae3'
            'fa25a88abf146ebe82c5e5c62df7ea7f2a6f2a8a446460ad98ab426a0b301287')
b2sums=('1af1f41b478ee1f404ffa1c09032500b3191f37cbcb5737c60b5be51cffd5fcc6bdc73e33ad32592eb2386b762665267369778ca8324551f73554a72eef7278a'
        '4400c4b762f58a3232917eb92ed864d04c11faf2ee57f65c7aa850d4dfec08b71e7b0dabb28a1c918dd37e289d24b6c2152a4afbe4b5de05c06bee2e3b278423')

prepare() {
	cd "$_pkgname-$pkgver"

	export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$_pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable

    # Git info (should probably automate if possible)
    export VERGEN_GIT_BRANCH=main
    export VERGEN_GIT_COMMIT_MESSAGE="release: 0.2.0"
    export VERGEN_GIT_SHA="2277dec"
    export VERGEN_GIT_DIRTY="false"

	cargo build --frozen --release

    mkdir completions
    ./target/release/$_pkgname gen-completions --shell bash > completions/$_pkgname
    ./target/release/$_pkgname gen-completions --shell fish > completions/$_pkgname.fish
    ./target/release/$_pkgname gen-completions --shell zsh > completions/_$_pkgname
    ./target/release/$_pkgname gen-completions --shell elvish > completions/$_pkgname.elv
}

package() {
	cd "$_pkgname-$pkgver"
	install -Dm755 target/release/${_pkgname} -t "$pkgdir/usr/bin/"
    install -Dm755 resources/${_pkgname}-session -t "$pkgdir/usr/bin/"
    install -Dm644 resources/${_pkgname}.desktop -t "$pkgdir/usr/share/wayland-sessions/"
    install -Dm644 resources/${_pkgname}-portals.conf -t "$pkgdir/usr/share/xdg-desktop-portal/"
    install -Dm644 resources/${_pkgname}{.service,-shutdown.target} -t "$pkgdir/usr/lib/systemd/user/"

    install -Dm644 completions/$_pkgname -t "$pkgdir/usr/share/bash-completion/completions/"
    install -Dm644 completions/$_pkgname.fish -t "$pkgdir/usr/share/fish/vendor_completions.d/"
    install -Dm644 completions/_$_pkgname -t "$pkgdir/usr/share/zsh/site-functions/"
    install -Dm644 completions/$_pkgname.elv -t "$pkgdir/usr/share/elvish/lib/"

    cd "$srcdir/$_pkgname-$pkgver/api/protobuf"
    for proto in $(find . -type f -name "*.proto"); do
        install -Dm644 "$proto" "$pkgdir/usr/share/$_pkgname/protobuf/${proto#\./}"
    done

    cd "$srcdir/$_pkgname-$pkgver/snowcap/api/protobuf"
    for proto in $(find . -type f -name "*.proto"); do
        install -Dm644 "$proto" "$pkgdir/usr/share/$_pkgname/snowcap/protobuf/${proto#\./}"
    done

    cd "$srcdir"
    luarocks --lua-version 5.4 --tree "$pkgdir/usr/" install --deps-mode none --no-manifest ./*.rock
}
