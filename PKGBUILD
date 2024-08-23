# Maintainer: zoorat <zoorat [at] protonmail [dot] com>

# Most of the code has been taken from
# https://aur.archlinux.org/packages/zen-browser-bin

pkgname=zen-browser-optimized-bin
_pkgname=zen-browser-optimized
_realpkgver=1.0.0-a.28
pkgver=1.0.0.a.28
pkgrel=1

pkgdesc="Experience tranquillity while browsing the web without people tracking you! (optimized/specific binary)"
arch=('x86_64' 'i686')
url="https://www.zen-browser.app/"
license=(MPL-2.0)

depends=(
	gtk3
	libxt
	mime-types
	dbus-glib
	nss
	ttf-font
	ffmpeg
	fontconfig
	libpulse
)
optdepends=(
	'networkmanager: Location detection via available WiFi networks'
	'libnotify: Notification integration'
	'pulseaudio: Audio support'
	'speech-dispatcher: Text-to-Speech'
	'hunspell-en_US: Spell checking, American English'
	'xdg-desktop-portal: Screensharing with Wayland'
)
options=(!strip)
changelog="changelog.md"

source=("https://github.com/zen-browser/desktop/releases/download/$_realpkgver/zen.linux-specific.tar.bz2"
	"$_pkgname.sh"
	"$_pkgname.desktop"
	"policies.json"
	"https://raw.githubusercontent.com/zen-browser/desktop/main/LICENSE"
)
b2sums=('4335c5c21934155a4d072948fb2da6f0d1590a9c9146c7bc26b729230100c9dd98cdd02daf25042c0040fec92d7fce5a1f25a43a3fad95256c0d06bbaea2534a'
	'6f30f2b0325dc975f64b1cc35d175946a0978f856f52993c32bfb0d86bf90d94069764aafc78d767d10d2775d3cae277499e6a67b85d29c39c1e366d60cee72f'
	'0d2772efc8ab9b5db1df6ba6ba748a0bed4e9161850ed723077d40a0af62cea7bdaaa6def2e5a08662c6a4ba6ef31930d464a1c97084f3a45adff232d58a3bc7'
	'22da0ff6348186a5b05ec68cf7b262a0a061bd1de7777fa8b6fcf092f75453ea0d88d8e05a0e741803aa6c3f723a7801cefc697ac4a10e9c0ed28ec99ab89299'
	'019f24b4a5c65da2757108a3774d9bf5e995ae280b754e204578330c98622cd2f0f8cdb685d770f6c241cbfd0dd5dcda69b052349c5be40562dd31e263ecb276')

pkgver() {
	echo "$_realpkgver" | tr '-' '.'
}

package() {
	# Install
	install -v -m755 -d "$pkgdir"/opt/$pkgname
	cp -v -r zen/* "$pkgdir"/opt/$pkgname/

	# Launchers
	install -v -d "$pkgdir"/usr/bin
	install -v -m755 $_pkgname.sh "$pkgdir"/usr/bin/$_pkgname

	# Desktops
	install -v -d "$pkgdir"/usr/share/applications
	sed -i "s/Version=0.0/Version=$pkgver/" $_pkgname.desktop
	install -v -m644 $_pkgname.desktop "$pkgdir"/usr/share/applications/$_pkgname.desktop

	# Icons
	for i in 16 32 48 64 128; do
		install -v -d "$pkgdir"/usr/share/icons/hicolor/"$i"x"$i"/apps/
		ln -v -s /opt/$pkgname/browser/chrome/icons/default/default$i.png "$pkgdir"/usr/share/icons/hicolor/"$i"x"$i"/apps/$_pkgname.png
	done
	install -v -d "$pkgdir"/usr/share/pixmaps/
	ln -v -s /opt/$pkgname/browser/chrome/icons/default/default128.png "$pkgdir"/usr/share/pixmaps/$_pkgname.png

	# Use system-provided dictionaries
	ln -v -Ts /usr/share/hunspell "$pkgdir"/opt/$pkgname/dictionaries
	# ln -v -Ts /usr/share/hyphen "$pkgdir"/opt/$pkgname/hyphenation

	# Use system certificates
	ln -v -sf /usr/lib/libnssckbi.so "$pkgdir"/opt/$pkgname/libnssckbi.so

	# Disable update checks (managed by pacman)
	install -v -d "$pkgdir"/opt/$pkgname/distribution
	install -v -m644 "$srcdir"/policies.json "$pkgdir"/opt/$pkgname/distribution/

	# Install LICENSE file
	install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
