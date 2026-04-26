# Maintainer: Ottatop <ottatop1227@gmail.com>

pkgname=pinnacle-comp
_pkgname=pinnacle
pkgver=0.2.3
pkgrel=5
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
sha256sums=('9b41576f0e3d4379b2c7845e2361ec29ab21510d11d8425bf825c43a3035b93a'
            '3dd765665ce6cf8381611396375f4fb6ab44a50e6caf626a8cdc92e435e03a40')
b2sums=('b8e75ebc1b3ef96bdb5faf1a4a407ba0481b012783bd416f44b647a50b2ad336b26bc75828f9123b1e29cfa07d3b946618b2347b922bd17c13f6a2c3d51db590'
        '1284e046fdf85233e9dc17345278ef26603f0fcc8f210e873f8ddc3eaeb45bd5ab8680149d366fabc85b09787bba4f2fb25e90ab40170dda05e4512a3c067c83')

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
    export VERGEN_GIT_COMMIT_MESSAGE="release: v0.2.3"
    export VERGEN_GIT_SHA="b33d2fe"
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
