pkgname=arch-update-manager
pkgver=3.4.0
pkgrel=1
pkgdesc="A Linux Mint inspired GTK4-based update manager for Arch Linux"
arch=('x86_64')
url="https://github.com/destbg/arch-update-manager"
license=('MIT')
depends=('gtk4' 'vte4' 'gtksourceview5' 'polkit' 'pacman' 'pacman-contrib' 'expect' 'sudo' 'curl')
provides=('arch-update-manager')
conflicts=('arch-update-manager')
makedepends=('cargo' 'git')
optdepends=('paru: AUR helper support'
            'yay: AUR helper support'
            'shelly: AUR helper support'
            'flatpak: Flatpak package support'
            'meld: visual diff editor for pacnew files'
            'timeshift: pre-update system snapshots'
            'snapper: pre-update Btrfs snapshots'
            'aur-scanner: scan AUR packages for security issues'
            'rate-mirrors: refresh and rank the pacman mirror list')
source=("git+$url.git#tag=${pkgver}")
sha256sums=('a23e32c7856dfa0aed98398c8336c106f701e5a483bc257207883a180f7b1ab9')

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
	install -Dm755 "target/release/$pkgname-tray" "$pkgdir/usr/bin/$pkgname-tray"
	install -Dm755 "target/release/$pkgname-check" "$pkgdir/usr/bin/$pkgname-check"

	install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

	install -Dm644 "com.destbg.$pkgname.policy" "$pkgdir/usr/share/polkit-1/actions/com.destbg.$pkgname.policy"

	install -Dm644 "res/systemd/$pkgname-check.service" \
		"$pkgdir/usr/lib/systemd/user/$pkgname-check.service"
	install -Dm644 "res/systemd/$pkgname-check.timer" \
		"$pkgdir/usr/lib/systemd/user/$pkgname-check.timer"
	install -Dm644 "res/systemd/$pkgname-tray.service" \
		"$pkgdir/usr/lib/systemd/user/$pkgname-tray.service"
	
	for size in 48x48 256x256 512x512; do
		if [ -f "icons/$size/apps/$pkgname.png" ]; then
			install -Dm644 "icons/$size/apps/$pkgname.png" \
				"$pkgdir/usr/share/icons/hicolor/$size/apps/$pkgname.png"
		fi
	done
	
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
