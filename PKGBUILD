# Maintainer: Alexander Schnaidt <alex.schnaidt@gmail.com>

_pkgname=pwsafe
pkgname=passwordsafe
_pkgver=0.96
pkgver="$_pkgver"BETA
pkgrel=1
pkgdesc="Simple & Secure Password Management"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/passwordsafe/"
license=('Artistic2.0')
#to build without yubikey support, remove ykpers and uncomment NO_YUBI in build()
depends=('libxtst' 'wxgtk' 'webkitgtk2' 'ykpers' 'xerces-c')
makedepends=('git' 'zip' 'libxt')
optdepends=('xvkbd: virtual-keyboard support')
conflicts=('passwordsafe-debian' 'passwordsafe-git' 'pwsafe')
source=(http://downloads.sourceforge.net/project/$pkgname/Linux-BETA/$_pkgver/$_pkgname-$pkgver-src.tgz{,.sig})

install='passwordsafe.install'
validpgpkeys=('A703C1328EABC7B201753BA3919464515CCF8BB3')  #Rony Shapiro
md5sums=('0da54dd106895e18dcff5ed370843884'
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
	
	install -Dm 644 help/helpEN.zip "$pkgdir"/usr/share/doc/passwordsafe/help/helpEN.zip
	install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
	install -Dm 644 docs/pwsafe.1 "$pkgdir"/usr/share/man/man1/pwsafe.1

	install -d 755 "$pkgdir"/usr/share/pwsafe/xml
	install -m 644 xml/* "$pkgdir"/usr/share/pwsafe/xml

	cd src/ui/wxWidgets/I18N/mos/
	for lang in *; do
		install -Dm 644 "$lang"/LC_MESSAGES/pwsafe.mo \
				"$pkgdir"/usr/share/locale/"$lang"/LC_MESSAGES/pwsafe.mo
	done
}

