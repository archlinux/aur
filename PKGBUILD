# Maintainer: nezu <nezu@nezu.cc>
pkgname=teamwork-desktop
pkgver=1.2.0
pkgrel=1
pkgdesc="Teamwork for Desktop - Launch Teamwork directly from your desktop."
arch=('any')
url="https://integrations.teamwork.com/integrations/teamwork-projects-desktop/"
license=('unknown')
depends=(electron11)
makedepends=(asar)
source=(
	# latest release can be found here: https://tw-open.s3.amazonaws.com/projects/electron/releases/latest.yml
	"$pkgname-$pkgver.7z::https://tw-open.s3.amazonaws.com/projects/electron/releases/teamwork-projects-desktop-$pkgver-x64.nsis.7z"
	"fix-titlebar.patch"
	"remove-auto-update.patch"
	"teamwork-desktop.desktop"
	"teamwork-desktop.sh")
sha256sums=('d32e9ab6c8c19840e157cb8960486e3c51b78003dd5bf906d27aa9611888ca42'
            '1a79b996a5913f3cd7957014631e8e71bd7b4bcadd51dfca729a2d9fdcfd9020'
            '748f3b80ed9e08f17cba56716b382bc9296a96579fd65c9eeabc23bba21c834d'
            'abd0bf317ac70d5aa51516508cdcf09875496b8bfde643af52df98f0e58d0b93'
            '875d757f8cf3a0c28342932e76ab151be55fef7985443a9750b782cac51563a8')

prepare() {
	cd resources
	asar extract app.asar app
	patch --directory="app" --forward --strip=1 --input="${srcdir}/fix-titlebar.patch"
	patch --directory="app" --forward --strip=1 --input="${srcdir}/remove-auto-update.patch"
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
