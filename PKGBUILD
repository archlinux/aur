# Maintainer: nezu <nezu@nezu.cc>
pkgname=teamwork-desktop
pkgver=1.3.1
pkgrel=1
pkgdesc="Teamwork for Desktop - Launch Teamwork directly from your desktop."
arch=('any')
url="https://integrations.teamwork.com/integrations/teamwork-projects-desktop/"
license=('unknown')
depends=(electron26)
makedepends=(asar)
source=(
	# latest release can be found here: https://tw-open.s3.amazonaws.com/projects/electron/releases/latest.yml
	"$pkgname-$pkgver.7z::https://tw-open.s3.amazonaws.com/projects/electron/releases/teamwork-projects-desktop-$pkgver-x64.nsis.7z"
	"fix-titlebar.patch"
	"remove-auto-update.patch"
	"teamwork-desktop.desktop"
	"teamwork-desktop.sh")
sha256sums=('ce0ea182dd402c30df568c2e92c2cff2d3e1f29133577d53ce2b61a9b18c0d2b'
            'e0c69e7a9d26d4afe1389a0348e34d84affa6783b0f64b4a6c9752041e8d0595'
            '57071e5305fe9b973b8d48e90e827a9323f3f0b5b15f3ba5ecb4e57e03b1cc8f'
            'abd0bf317ac70d5aa51516508cdcf09875496b8bfde643af52df98f0e58d0b93'
            '241c4bdb71974742a4204f0d1cd0c58b007cb459961e278dbd77f3e4ea0c54f5')

prepare() {
	cd resources
	asar extract app.asar app
	patch --directory="app" --forward --strip=1 --input="${srcdir}/remove-auto-update.patch"
	patch --directory="app" --forward --strip=1 --input="${srcdir}/fix-titlebar.patch"
}

build() {
	cd resources
	asar pack app patched-app.asar
}

package() {
	install -Dm644 resources/patched-app.asar "$pkgdir/usr/lib/$pkgname/resources/app.asar"
	install -Dm755 "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "$pkgname.desktop" -t "$pkgdir/usr/share/applications/"
	install -Dm644 resources/app/src/renderer/images/logo.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
}
