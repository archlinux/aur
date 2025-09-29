# Maintainer: hecate <aur hecate space>
pkgname=pandora-git
pkgver=1.0.0
pkgrel=1
pkgdesc="a parallax-scrolling wallpaper and lockscreen daemon for wayland compositors"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/pandorasfox/pandora"
license=('GPL-2.0')
depends=()
makedepends=(cargo git sed)
checkdepends=()
optdepends=(niri)
provides=(pandora)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('git+https://github.com/PandorasFox/pandora.git#branch=release')
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

prepare() {
    export RUSTUP_TOOLCHAIN=stable
	pushd "$srcdir/pandora"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
	popd
}

build() {
	export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
	pushd "$srcdir/pandora"
    cargo build --frozen --release --all-features
	popd
}

check() {
	export RUSTUP_TOOLCHAIN=stable
	pushd "$srcdir/pandora"
    cargo test --frozen --all-features
	popd
}

package() {
	install -Dm0755 -t "$pkgdir/usr/bin/" "$srcdir/pandora/target/release/pandora"
	install -Dm0755 -t "$pkgdir/usr/share/doc/pandora/" "$srcdir/pandora/sample files/pandora.service"
	sed -i -e "s|%h/.cargo|/usr|" "$pkgdir/usr/share/doc/pandora/pandora.service"
}
