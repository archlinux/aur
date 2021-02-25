# Maintainer: Kim Scarborough <kim@scarborough.kim>
# Contributor: Andreas Baumann <mail@andreasbaumann.cc>
# Contributor: Attila Vangel <attila.vangel@gmail.com>
pkgname=thunderbird-60-bin
pkgver=60.9.1
pkgrel=3
pkgdesc="Standalone Mail/News reader - 60.x binary version"
arch=('x86_64')
url="https://www.thunderbird.net/"
license=('GPL' 'LGPL' 'MPL')
depends=('libxt' 'gtk3' 'dbus-glib')
optdepends=('hunspell: Spell checking'
            'hyphen: Hyphenation'
            'libcanberra: Sound support')
provides=("thunderbird=$pkgver")
source=("https://ftp.mozilla.org/pub/thunderbird/releases/$pkgver/linux-$arch/en-US/thunderbird-$pkgver.tar.bz2"
	"https://ftp.mozilla.org/pub/thunderbird/releases/60.9.1/linux-$arch/en-US/thunderbird-60.9.1.tar.bz2.asc"
	"thunderbird60.desktop"
	"thunderbird60.sh")
sha512sums=("109ae1a376a6e65ede652c85fda7ebd497b781717cef65d0e0462a4c3d76dcca69163b96acaf1259e347ede8826a647dea3c739c2cf38f214c2628f2b9b7fe19"
	"99eff19bf9eee70edba84c0a68d442dcbb5b988ab8c9b41723217f675c0148b9862133d6844045171d33928ced5fd280c00754fce2e7e93a551ac817dcff3878"
	"f73e5ebb5104ec3cb915e45662b25b43500d495a7be3d0a396c1016489370e97005753e481670ad17e09203eb20feb398a91df35a54e30a4acf79c75621747ef"
	"5280448b652a4567d0a84843ee5f1e8208def1dd9918dc6208a2688b76636853d1a3f0b414e668907929c3efab8140577d43a0bb3c0d66d830206292ebb958c3")
validpgpkeys=("14F26682D0916CDD81E37B6D61B7B526D98F0353")

package() {
	install -d "$pkgdir"/usr/bin
	install -d "$pkgdir"/usr/share/applications
	install -d "$pkgdir"/opt
	cp -R --preserve=timestamps thunderbird "$pkgdir"/opt/thunderbird60
	install thunderbird60.sh "$pkgdir"/usr/bin/thunderbird60
	install -m 644 thunderbird60.desktop "$pkgdir"/usr/share/applications/
	
	for i in 16 22 24 32 48 256
	do
		install -d "$pkgdir"/usr/share/icons/hicolor/${i}x${i}/apps/
		install -m 644 "$pkgdir"/opt/thunderbird60/chrome/icons/default/default${i}.png "$pkgdir"/usr/share/icons/hicolor/${i}x${i}/apps/thunderbird60.png
	done

	cat > "$pkgdir"/opt/thunderbird60/defaults/pref/vendor.js << EOF
// Use LANG environment variable to choose locale
pref("intl.locale.matchOS", true);

// Disable default mailer checking.
pref("mail.shell.checkDefaultMail", false);

// Don't disable our bundled extensions in the application directory
pref("extensions.autoDisableScopes", 11);
pref("extensions.shownSelectionUI", true);
EOF

}
