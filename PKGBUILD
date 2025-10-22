pkgname=arch-update-manager
pkgver=1.0.0
pkgrel=2
epoch=
pkgdesc="A Linux Mint inspired GTK4-based update manager for Arch Linux"
arch=('x86_64')
url="https://github.com/destbg/arch-update-manager"
license=('MIT')
groups=()
depends=('gtk4' 'vte4' 'polkit' 'pacman' 'timeshift')
makedepends=('cargo' 'git')
checkdepends=()
optdepends=('paru: AUR helper support'
            'yay: AUR helper support')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname::git+$url.git")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

prepare() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

check() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
    cargo check --frozen --all-features
}

package() {
	cd "$pkgname"
	
	install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
	
	install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	
	install -Dm644 "com.destbg.$pkgname.policy" "$pkgdir/usr/share/polkit-1/actions/com.destbg.$pkgname.policy"
	
	for size in 48x48 256x256 512x512; do
		if [ -f "icons/$size/apps/$pkgname.png" ]; then
			install -Dm644 "icons/$size/apps/$pkgname.png" \
				"$pkgdir/usr/share/icons/hicolor/$size/apps/$pkgname.png"
		fi
	done
	
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
