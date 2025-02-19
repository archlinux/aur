# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Nicola Squartini <tensor5@gmail.com> (electron-launcher.sh script)
# Contributor: Matthew McGinn <mamcgi@gmail.com>
_projectname='electron'
_pkgname="${_projectname}7"
pkgname="$_pkgname-bin"
pkgver='7.3.3'
pkgrel='6'
pkgdesc='Build cross platform desktop apps with web technologies - version 7 - binary version'
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url="https://${_projectname}js.org"
license=('MIT')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
depends=('c-ares' 'ffmpeg' 'gtk3' 'http-parser' 'libevent' 'libnghttp2' 'libxslt' 'libxss' 'minizip' 'nss' 're2' 'snappy')
optdepends=(
	'kde-cli-tools: file deletion support (kioclient5)'
	'libappindicator-gtk3: StatusNotifierItem support'
	'trash-cli: file deletion support (trash-put)'
	"xdg-utils: open URLs with desktop's default (xdg-email, xdg-open)"
)
_releaseurl="https://github.com/$_projectname/$_projectname/releases/download/v$pkgver"
source_x86_64=(
	"$pkgname-chromedriver-$pkgver-x86_64.zip::$_releaseurl/chromedriver-v$pkgver-linux-x64.zip"
	"$pkgname-$pkgver-x86_64.zip::$_releaseurl/$_projectname-v$pkgver-linux-x64.zip"
)
source_i686=(
	"$pkgname-chromedriver-$pkgver-i686.zip::$_releaseurl/chromedriver-v$pkgver-linux-ia32.zip"
	"$pkgname-$pkgver-i686.zip::$_releaseurl/$_projectname-v$pkgver-linux-ia32.zip"
)
source_pentium4=(
	"$pkgname-chromedriver-$pkgver-pentium4.zip::$_releaseurl/chromedriver-v$pkgver-linux-ia32.zip"
	"$pkgname-$pkgver-pentium4.zip::$_releaseurl/$_projectname-v$pkgver-linux-ia32.zip"
)
source_armv7h=(
	"$pkgname-chromedriver-$pkgver-armv7h.zip::$_releaseurl/chromedriver-v$pkgver-linux-armv7l.zip"
	"$pkgname-$pkgver-armv7h.zip::$_releaseurl/$_projectname-v$pkgver-linux-armv7l.zip"
)
source_aarch64=(
	"$pkgname-chromedriver-$pkgver-aarch64.zip::$_releaseurl/chromedriver-v$pkgver-linux-arm64.zip"
	"$pkgname-$pkgver-aarch64.zip::$_releaseurl/$_projectname-v$pkgver-linux-arm64.zip"
)
source=('electron-launcher.sh')
b2sums=('49d2beda3260b6a09b7365a119524bd9b0c03b89e95be608a89f728d72e3694892d3ad0d02db85c09ce2f4ccb458ea207fab27f84a2e7e15a2fd4f720d991dac')
b2sums_x86_64=('ae3456511fa22c2be05581ab0311fcb87899bc518a370d55d75591c6c750f82a34d337db4d93b653113f3106bb68af73807b2bcc8f9c7c7b2db9acb45e5ef084'
               'd963bd81a8cc91d966e61280cafc98ede89154185847279abc4bf44bd34c0cf63d5287f60f5635de8ecb49985aa21b3997ca41d0677f50a8f0de925fdd8c979b')
b2sums_i686=('8f77e38363914c4e4909b0dc55db8d8f91b8ccf93385a7128edce5b8f5c5e97f644a02673055de0183a95f73ed1ff1e6808c6df789c2cf6d2ec1a6a02b44798b'
             '17cb355e7ec3e44627588a18a50aeb72032f5caf5d60f13707c858ced2dade1eb5105a0603b731b5d01d5f27baef608c29ff23d4183ab53ea8c57cf565ab7098')
b2sums_pentium4=('8f77e38363914c4e4909b0dc55db8d8f91b8ccf93385a7128edce5b8f5c5e97f644a02673055de0183a95f73ed1ff1e6808c6df789c2cf6d2ec1a6a02b44798b'
                 '17cb355e7ec3e44627588a18a50aeb72032f5caf5d60f13707c858ced2dade1eb5105a0603b731b5d01d5f27baef608c29ff23d4183ab53ea8c57cf565ab7098')
b2sums_armv7h=('60371cecdedf6911de4ddd1777af941487ca597db164c81165a49559943ae2ac7aefc20e7174207d245d878ff34cdb18154929bf955558b488794b33d95e4eb9'
               'e690a6bd4de43064d3f22ee5b54f2fbc30a3bc83335319f7ff8f83c18113d30ceee9e1244dfe7bcf1be15afd727ce1b800d8fc0baa1d43df6ee8eb6db17c37bb')
b2sums_aarch64=('c8691c39f5d89e82937c7eb3cc17befb3148733acd25acb790a53d6309fa1c0245d66f9f04d68f000657f4098007cc676dd93a94fba33e1e90e551886fa98b26'
                '74f2477a2e172962a3d1366024ae58022eb84650a4918268afa43b1b4fc40ddc72391d1a618e3a01975a00fd2b8a3366f387db9968686295f525ec81326416ab')

prepare() {
	sed -i -e "s/@ELECTRON@/$_pkgname/g" "$srcdir/electron-launcher.sh"
}

check() {
	_checkoutput="$("$srcdir/$_projectname" --version)"
	printf '%s\n' "$_checkoutput"
	printf '%s\n' "$_checkoutput" | grep -q "v$pkgver"
}

package() {
	cd "$srcdir/"
	install -dm755 "$pkgdir/usr/lib/$_pkgname/"
	find . -mindepth 1 -maxdepth 1 -type f ! -name '*.zip' ! -name 'LICENSE*' -exec cp -r --no-preserve=ownership --preserve=mode -t "$pkgdir/usr/lib/$_pkgname/." {} +

	for _folder in 'locales' 'resources' 'swiftshader'; do
		cp -r --no-preserve=ownership --preserve=mode "$_folder/" "$pkgdir/usr/lib/$_pkgname/$_folder/"
	done

	chmod u+s "$pkgdir/usr/lib/$_pkgname/chrome-sandbox"

	install -Dm755 'electron-launcher.sh' "$pkgdir/usr/bin/$_pkgname"

	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/MIT"
	install -Dm644 'LICENSES.chromium.html' "$pkgdir/usr/share/licenses/$pkgname/LICENSES.chromium.html"
}
