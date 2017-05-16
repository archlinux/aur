# Maintainer: Alexander Schnaidt <alex.schnaidt@gmail.com>

_pkgname=pwsafe
pkgname=passwordsafe
_pkgver=1.02
pkgver="$_pkgver"BETA
pkgrel=1
pkgdesc="Simple & Secure Password Management"
arch=('i686' 'x86_64')
url="https://pwsafe.org/"
license=('Artistic2.0')
#to build without yubikey support, remove ykpers and uncomment NO_YUBI in build()
depends=('libxtst' 'wxgtk' 'webkitgtk2' 'yubikey-personalization' 'xerces-c')
makedepends=('zip' 'libxt')
optdepends=('xvkbd: virtual-keyboard support')
conflicts=('passwordsafe-debian' 'passwordsafe-git' 'pwsafe' 'pwsafe-gui')
source=(https://github.com/pwsafe/pwsafe/archive/$pkgver.tar.gz
	https://github.com/pwsafe/pwsafe/releases/download/$pkgver/$pkgver.tar.gz.sig)
validpgpkeys=('C8876BE69A8EC6414C8C8729B131423D7F2F1BB9')  # http://pgp.mit.edu/pks/lookup?op=vindex&search=0xB131423D7F2F1BB9
sha1sums=('e2e4b31684b0eee39953cf8abbe88262932e09a8'
          'SKIP')

prepare() {
	cd "$_pkgname-$pkgver"
}

build() {
	cd "$_pkgname-$pkgver"
#	NO_YUBI=1 \
	WX_CONFIG="/usr/bin/wx-config" \
	make release help I18N
}

package() {
	cd "$_pkgname-$pkgver"

	install -Dm 755 src/ui/wxWidgets/GCCUnicodeRelease/pwsafe \
			"$pkgdir"/usr/bin/pwsafe
	install -Dm 644 install/desktop/fedora-pwsafe.desktop \
			"$pkgdir"/usr/share/applications/pwsafe.desktop
	install -Dm 644 install/graphics/pwsafe.png \
			"$pkgdir"/usr/share/icons/hicolor/48x48/apps/pwsafe.png
	
	for doc in README.txt docs/ReleaseNotes.txt docs/ChangeLog.txt install/copyright; do
		install -Dm 644 "$doc" "$pkgdir"/usr/share/doc/passwordsafe/"$doc"
	done
	
	install -dm 755 "$pkgdir"/usr/share/doc/passwordsafe/help/
	install -Dm 644 help/help*.zip "$pkgdir"/usr/share/doc/passwordsafe/help/

	install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
	install -Dm 644 docs/pwsafe.1 "$pkgdir"/usr/share/man/man1/pwsafe.1

	install -dm 755 "$pkgdir"/usr/share/pwsafe/xml
	install -m 644 xml/* "$pkgdir"/usr/share/pwsafe/xml

	cd src/ui/wxWidgets/I18N/mos/
	for lang in *; do
		install -Dm 644 "$lang"/LC_MESSAGES/pwsafe.mo \
				"$pkgdir"/usr/share/locale/"$lang"/LC_MESSAGES/pwsafe.mo
	done
}

