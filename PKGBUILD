pkgname=arch-update-manager-git
_pkgname=arch-update-manager
pkgver=3.3.0.r2.g1330546
pkgrel=1
pkgdesc="A Linux Mint inspired GTK4-based update manager for Arch Linux (latest git)"
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
source=("$pkgname::git+https://github.com/destbg/arch-update-manager.git#commit=13305462ff357b4a0d507c06510f61d62ab901a9")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

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

	install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
	install -Dm755 "target/release/$_pkgname-tray" "$pkgdir/usr/bin/$_pkgname-tray"
	install -Dm755 "target/release/$_pkgname-check" "$pkgdir/usr/bin/$_pkgname-check"

	install -Dm644 "$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"

	install -Dm644 "com.destbg.$_pkgname.policy" "$pkgdir/usr/share/polkit-1/actions/com.destbg.$_pkgname.policy"

	install -Dm644 "res/systemd/$_pkgname-check.service" \
		"$pkgdir/usr/lib/systemd/user/$_pkgname-check.service"
	install -Dm644 "res/systemd/$_pkgname-check.timer" \
		"$pkgdir/usr/lib/systemd/user/$_pkgname-check.timer"
	install -Dm644 "res/systemd/$_pkgname-tray.service" \
		"$pkgdir/usr/lib/systemd/user/$_pkgname-tray.service"

	for size in 48x48 256x256 512x512; do
		if [ -f "icons/$size/apps/$_pkgname.png" ]; then
			install -Dm644 "icons/$size/apps/$_pkgname.png" \
				"$pkgdir/usr/share/icons/hicolor/$size/apps/$_pkgname.png"
		fi
	done

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
