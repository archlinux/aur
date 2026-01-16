# Maintainer: Ottatop <ottatop1227@gmail.com>

pkgname=pinnacle-comp
_pkgname=pinnacle
pkgver=0.2.2
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
sha256sums=('31eb0325f4e5cf1851fd9c4445d5712ddd77379159df978f720e77d2d6b17558'
            '89963617ec2a8eafe64a16786e936a311c35b3bf727a27e208c743eb9d53d651')
b2sums=('4eda3c4afe61c5a7ce4495793a3a0a29a0b532fea110f4f5175f881ffd6f7fe03620cf5e7135f2d0a6bbfaf2f16abf15a6aed74a00fc1abd7bf094f906230daf'
        'bba5ff47ee1d707aae23fa83ba19a62eca436fe53528d7de686713d8d5778772c5e8d365796905850d6059f26614c79fe87b65a23d5b55973951cb1f4b6ce826')

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
    export VERGEN_GIT_COMMIT_MESSAGE="release: v0.2.2"
    export VERGEN_GIT_SHA="8e11f00"
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
