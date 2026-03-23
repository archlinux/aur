# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=anime-games-launcher
pkgver=2.0.0
pkgrel=1
pkgdesc="Universal linux launcher for anime games"
arch=('x86_64')
url="https://github.com/an-anime-team/anime-games-launcher"
license=('GPL-3.0-only')
depends=('gtk4' 'libadwaita' 'glibc' 'hicolor-icon-theme' 'glib2'
	 'pango' 'cairo' 'libstdc++' 'libgcc' 'wayland' 'git'
	 'unzip' '7zip')
makedepends=('cargo')
optdepends=(
	 'mangohud: FPS Overlay'
	 'gamescope: Micro-Compositor'
	 'gamemode: CPU Scaling Control')
source=("$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9d50894a351b56be0e7eaaa2f1d76466edd2fa718d494276649145eb739e8f61')
options=(!lto)

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	# Keeping this here as it may be valuable in the future
	#echo "lua-src = \"555.0.0\"" >> crates/agl-runtime/Cargo.toml
	#sed -i "s/encoding_rs = \"0.8\"/encoding_rs = \"0.8\"\nlua-src = \"550.0.0\"/g;s/\"luau-jit\"/\"luau\",\n\"vendored\"/g" crates/agl-runtime/Cargo.toml
	#sed -i "s/\"luau-jit\"/\"luau-jit\",\n\"vendored\"/g" crates/agl-runtime/Cargo.toml
    	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	# ToDo: Right now, there are issues with LTO and mlua. I disabled LTO for now,
	# but ideally, I would like to use system LLD with everything
	# export RUSTFLAGS+=" -C linker-plugin-lto -C linker=clang -C link-arg=-fuse-ld=lld -C linker-features=-lld"
	# export CC=clang
	# export CXX=clang++
	cd "$srcdir/$pkgname-$pkgver"
    	export RUSTUP_TOOLCHAIN=stable
    	export CARGO_TARGET_DIR=target
	#export RUSTFLAGS+=" -C linker-features=-lld -C link-args=-fuse-ld=lld -C lto=off"
	export RUSTFLAGS+=" -C linker-features=-lld"
	cargo build --frozen --release --all-features
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm755 "target/release/anirun" "$pkgdir/usr/bin/anirun"
	install -Dm644 "crates/$pkgname/assets/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm644 "crates/$pkgname/assets/images/icon.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/moe.launcher.$pkgname.png"
	install -dm755 "$pkgdir/usr/share/pixmaps"
	ln -s "/usr/share/icons/hicolor/512x512/apps/moe.launcher.$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
	sed -i "s/Exec=AppRun/Exec=$pkgname/g" "$pkgdir/usr/share/applications/$pkgname.desktop"
	sed -i "s/Icon=icon/Icon=$pkgname/g" "$pkgdir/usr/share/applications/$pkgname.desktop"
	echo "StartupWMClass=moe.launcher.$pkgname" >> "$pkgdir/usr/share/applications/$pkgname.desktop"
}
