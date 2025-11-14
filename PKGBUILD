pkgname=arch-update-manager
pkgver=1.2.0
pkgrel=1
pkgdesc="A Linux Mint inspired GTK4-based update manager for Arch Linux"
arch=('x86_64')
url="https://github.com/destbg/arch-update-manager"
license=('MIT')
depends=('gtk4' 'vte4' 'polkit' 'pacman' 'timeshift')
provides=('arch-update-manager')
conflicts=('arch-update-manager')
makedepends=('cargo' 'git')
optdepends=('paru: AUR helper support'
            'yay: AUR helper support')
source=("git+$url.git#tag=${pkgver}")
sha256sums=('ba554a45275dcb8977380bdfd797025792812bd37c3f7e211c02fe970c394bfe')

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
