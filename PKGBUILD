# Maintainer: Ottatop <ottatop1227@gmail.com>

pkgname=pinnacle-comp
_pkgname=pinnacle
pkgver=0.2.4
pkgrel=1
pkgdesc="A Wayland compositor inspired by AwesomeWM"
arch=(x86_64 aarch64)
url="https://github.com/pinnacle-comp/$_pkgname"
license=("GPL-3.0-or-later")
provides=(wayland-compositor)
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
    lua54
    lua54-cqueues
    lua54-http
    lua54-protobuf
    lua54-posix
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
sha256sums=('39d460165460631082d5871b46407c32439655e0a3be91f971651dcc41cb809d'
            '1d165d4d9cbc848105ba9e3c9fc87eecc9cb5769e636e72e73c67a8d59c576eb')
b2sums=('e55b155bcaa633cf6fba846fa4335e114afde10270047d32fb1ab056963191a0ee17ede051e8dfa46c451f7f0ee2cb7d148cc4a7e667eff700e057b0d1e7afaa'
        '926c6c1d775406c27641221fab7f484fdec2e68451ba8bfd1e73c9217e0833cf6e8520be1aabd894888b94e16921288675e406b44dfd1cae30637d302596f698')

prepare() {
	cd "$_pkgname-$pkgver"

	export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$_pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable

    # Git info (should probably automate if possible)
    export VERGEN_GIT_BRANCH=v0.2
    export VERGEN_GIT_COMMIT_MESSAGE="release: v0.2.4"
    export VERGEN_GIT_SHA="c41cae1"
    export VERGEN_GIT_DIRTY="false"

	cargo build --frozen --release

    mkdir -p completions
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
