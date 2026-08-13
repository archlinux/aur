pkgname=arch-install-manager-git
_pkgname=arch-install-manager
pkgver=0.0.1.r29.g529b5a9
pkgrel=1
pkgdesc="A Linux Mint inspired GTK4-based install and update manager for Arch Linux (latest git)"
arch=('x86_64')
url="https://github.com/destbg/arch-install-manager"
license=('MIT')
depends=('gtk4' 'vte4' 'gtksourceview5' 'polkit' 'systemd' 'pacman' 'pacman-contrib' 'curl' 'git' 'base-devel')
provides=('arch-install-manager')
conflicts=('arch-install-manager')
makedepends=('cargo' 'git')
optdepends=('flatpak: Flatpak package support'
            'meld: visual diff editor for pacnew files'
            'timeshift: pre-update system snapshots'
            'snapper: pre-update Btrfs snapshots'
            'aur-scanner: scan AUR packages for security issues'
            'rate-mirrors: refresh and rank the pacman mirror list')
source=("$pkgname::git+https://github.com/destbg/arch-install-manager.git#commit=529b5a9a16928f2d282db627d7d8ac3230782fd5")
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

	for bin in daim daim-gui daim-helper daim-tray daim-check; do
		install -Dm755 "target/release/$bin" "$pkgdir/usr/bin/$bin"
	done

	install -Dm644 "com.destbg.arch-install-manager.desktop" \
		"$pkgdir/usr/share/applications/com.destbg.arch-install-manager.desktop"

	install -Dm644 "com.destbg.arch-install-manager.policy" \
		"$pkgdir/usr/share/polkit-1/actions/com.destbg.arch-install-manager.policy"

	install -Dm644 "res/sysusers/daim-build.conf" \
		"$pkgdir/usr/lib/sysusers.d/daim-build.conf"

	install -Dm644 "res/systemd/daim-check.service" \
		"$pkgdir/usr/lib/systemd/user/daim-check.service"
	install -Dm644 "res/systemd/daim-check.timer" \
		"$pkgdir/usr/lib/systemd/user/daim-check.timer"
	install -Dm644 "res/systemd/daim-tray.service" \
		"$pkgdir/usr/lib/systemd/user/daim-tray.service"

	for size in 48x48 256x256 512x512; do
		if [ -f "icons/$size/apps/arch-install-manager.png" ]; then
			install -Dm644 "icons/$size/apps/arch-install-manager.png" \
				"$pkgdir/usr/share/icons/hicolor/$size/apps/arch-install-manager.png"
		fi
	done

	for sym in arch-install-manager-arch-symbolic arch-install-manager-flatpak-symbolic; do
		if [ -f "icons/symbolic/apps/$sym.svg" ]; then
			install -Dm644 "icons/symbolic/apps/$sym.svg" \
				"$pkgdir/usr/share/icons/hicolor/symbolic/apps/$sym.svg"
		fi
	done

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
