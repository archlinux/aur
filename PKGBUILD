# Maintainer: aeris <aeris+aur@imirhil.fr>
pkgname=termoso
pkgver=0.12.1
pkgrel=1
gitversion="$pkgver"
pkgdesc="Free, open-source, zero-knowledge SSH/SFTP client & sync server."
arch=(x86_64)
url="https://termoso.dev/"
license=(AGPL-3)
depends=(cairo dbus gdk-pixbuf2 glib2 glibc gtk3 libgcc libsoup3 systemd-libs webkit2gtk-4.1)
makedepends=(nodejs npm cargo)
source=(
	"termoso::git+https://github.com/termoso/termoso.git/#tag=v$gitversion"
	"tauri-transparent-glitch.patch"
	"icon.patch"
)
sha256sums=('fd7ba9dfc47bd3a45128a2948d4e816d5665dc4d10941ea03b9ed46a3f16a1fc'
            '2324a2b6cb280356d6f0ec24e084153a65998f401a94a01742779ac1e7bd2e96'
            'a23643c6d140ac1b8b23957bbd8e32216a52b62a89345a5de96ff5a839cd0ddc')

prepare() {
	cd "$srcdir/$pkgname"
	patch -p1 < "$srcdir/tauri-transparent-glitch.patch"
	patch -p1 < "$srcdir/icon.patch"

	export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target host-tuple

	cd "$srcdir/$pkgname/apps/desktop"
	npm ci
}

build() {
	export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
	cd "$srcdir/$pkgname/apps/desktop"
	npm run -- tauri build --no-bundle
}

package() {
	cd "$srcdir/$pkgname/"
	install -Dm 755 apps/desktop/src-tauri/target/release/termoso-desktop -t "$pkgdir/usr/bin/"
	install -Dm 644 packaging/flatpak/dev.termoso.Termoso.desktop -t "$pkgdir/usr/share/applications/"
	install -Dm 644 LICENSE "$pkgdir/usr/share/licences/$pkgname/LICENSE"

	for res in 32 64 128; do
		res="${res}x${res}"
		install -Dm 644 "apps/desktop/src-tauri/icons/$res.png" "$pkgdir/usr/share/icons/hicolor/$res/apps/$pkgname.png"
		# install -Dm 644 "apps/desktop/src-tauri/icons/$res@2x.png" "$pkgdir/usr/share/icons/hicolor/$res@2/apps/$pkgname.png"
	done

}
