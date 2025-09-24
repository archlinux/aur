# Maintainer: Ottatop <ottatop1227@gmail.com>
# Contributor: Yuuki Rika <yvvki@duck.com>

pkgname=pinnacle-comp-git
_pkgname=pinnacle
pkgver=0.1.0.r1547.1b165ca
pkgrel=1
pkgdesc="A Wayland compositor inspired by AwesomeWM (git version)"
arch=(x86_64)
url="https://github.com/pinnacle-comp/${_pkgname}"
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
provides=(pinnacle-comp)
conflicts=(pinnacle-comp)
source=("git+$url.git")
sha256sums=("SKIP")

pkgver() {
	cd "$_pkgname"
	export RUSTUP_TOOLCHAIN=stable
	echo "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2).r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)" | tr '-' '_'
}

prepare() {
	cd "$_pkgname"
	export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$_pkgname"
	export RUSTUP_TOOLCHAIN=stable
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
	cd "$_pkgname"
	install -Dm755 target/release/${_pkgname} -t "$pkgdir/usr/bin/"
    install -Dm755 resources/${_pkgname}-session -t "$pkgdir/usr/bin/"
    install -Dm644 resources/${_pkgname}.desktop -t "$pkgdir/usr/share/wayland-sessions/"
    install -Dm644 resources/${_pkgname}-portals.conf -t "$pkgdir/usr/share/xdg-desktop-portal/"
    install -Dm644 resources/${_pkgname}{.service,-shutdown.target} -t "$pkgdir/usr/lib/systemd/user/"

    install -Dm644 completions/$_pkgname -t "$pkgdir/usr/share/bash-completion/completions/"
    install -Dm644 completions/$_pkgname.fish -t "$pkgdir/usr/share/fish/vendor_completions.d/"
    install -Dm644 completions/_$_pkgname -t "$pkgdir/usr/share/zsh/site-functions/"
    install -Dm644 completions/$_pkgname.elv -t "$pkgdir/usr/share/elvish/lib/"

    cd "$srcdir/$_pkgname/api/protobuf"
    for proto in $(find . -type f -name *.proto); do
        install -Dm644 $proto "$pkgdir/usr/share/$_pkgname/protobuf/${proto#\./}"
    done

    cd "$srcdir/$_pkgname/snowcap/api/protobuf"
    for proto in $(find . -type f -name *.proto); do
        install -Dm644 $proto "$pkgdir/usr/share/$_pkgname/snowcap/protobuf/${proto#\./}"
    done

    cd "$srcdir/$_pkgname/api/lua"
    luarocks --lua-version 5.4 --tree "$pkgdir/usr/" install --deps-mode none --no-manifest *.rock
}
