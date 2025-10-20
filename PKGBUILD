# Maintainer: Ottatop <ottatop1227@gmail.com>

pkgname=pinnacle-comp
_pkgname=pinnacle
pkgver=0.1.0
_pkgver=0.1.0
pkgrel=3
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
    "$_pkgname-$_pkgver.tar.gz::https://github.com/pinnacle-comp/pinnacle/archive/v$_pkgver.tar.gz"
    "https://github.com/pinnacle-comp/pinnacle/releases/download/v$_pkgver/pinnacle-api-$_pkgver-1.all.rock"
    "libdisplay_info_0_3.patch"
)
sha256sums=('9002dd4caa8ab8d7831a8e66f449e535a8bfef6b04eeac9afd98ca1e4b5a3fb4'
            '3924f915bd6abfeb714414ae09953e20f86b194aeb08323fdb070262dd93c067'
            'a09b0c177c461e0a6c454fef92e7c07b52d08036c3b5f68db05c07cb05a6405d')
b2sums=('6b90ae1b0c80a916dce078b0961523b8d07f2b383913f1939a992ff884ca9ff7be60cc185a98a8e2e6c0bee10976e5149703cbfcd5057b8ee1e7484e964c0814'
        '629aa5c714e461cd15e6692eca96ed656cd65d3121516eb0f088d383f411d152c49524bf931859163fab772d58e22704cbba148cfa6a464ec2d95f276115bae2'
        'c3ec0840046729d58787ea44bfe2dd176cfbe37499197ebd9ef1b937592aa8ae16f3acb222fff4b5e2598723670641d62fac7f7d5574d2439acccbeb0f52c14c')

prepare() {
	cd "$_pkgname-$_pkgver"

    # Fix build for libdisplay-info 0.3
    patch -Np1 -i ../libdisplay_info_0_3.patch

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

    cd "$srcdir"
    luarocks --lua-version 5.4 --tree "$pkgdir/usr/" install --deps-mode none --no-manifest ./*.rock
}
