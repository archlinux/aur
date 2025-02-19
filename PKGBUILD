# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Nicola Squartini <tensor5@gmail.com>
_projectname='electron'
_pkgname="${_projectname}6"
pkgname="$_pkgname-bin"
pkgver='6.1.12'
pkgrel='6'
pkgdesc='Build cross platform desktop apps with web technologies - version 6 - binary version'
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url="https://${_projectname}js.org"
license=('MIT')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
depends=('c-ares' 'ffmpeg' 'gtk3' 'http-parser' 'libevent' 'libnghttp2' 'libxslt' 'libxss' 'minizip' 'nss' 're2' 'snappy')
optdepends=(
	'kde-cli-tools: file deletion support (kioclient5)'
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
b2sums_x86_64=('75b19d07b2ecda3511d326dd6fc70c35168a35d3da093300b6e86a622e3c20065c3a4a1e4f6eb18867740e1555ee34e02aafe16b1fb217610128b0664d5b7c8e'
               '12f65a00f1c259e53f410be64f8ff83089aa5a0451575386f8407124131ef53d4a347971b9fbdcb149954555b6b2091fd47d0c2b56dd83e796275593ac848cad')
b2sums_i686=('acd481b689a7793551b2fffafbf2ab74ba716d3c54adf89fce037f968b958e4e347d1e550e479a9542256b7fb04b0959305438a1bd9cb50aee767d0f45b2651a'
             '67c459cbb73b570276d995a40fa3f3faf749c43a114106a810d9247f290c0affbb9f626c104406fcfe2b24aa5bc66866a0b7f1c0b72806ea86f2b0a7cc9dbde9')
b2sums_pentium4=('acd481b689a7793551b2fffafbf2ab74ba716d3c54adf89fce037f968b958e4e347d1e550e479a9542256b7fb04b0959305438a1bd9cb50aee767d0f45b2651a'
                 '67c459cbb73b570276d995a40fa3f3faf749c43a114106a810d9247f290c0affbb9f626c104406fcfe2b24aa5bc66866a0b7f1c0b72806ea86f2b0a7cc9dbde9')
b2sums_armv7h=('d728899c42ca4ad858ae9d489f2e8b0df7bb9bc4e2ca7363782779f09c825d3ed216b7ea4b73ae7905c516d49e8856a7af09912cfb53ca96df48363c67914e79'
               '5f867b0cb2fb7b46a2ee37461893fd334e652b8847934519ecfd0be30302d421ed49f14f2adb3fd03f19a2a3824b98125283c66982f2f19dc33e2f78c02c1250')
b2sums_aarch64=('272d15bb4244d9a1696b5524f6e5ac8e0e31077a736fd93962521fca8f589c130ea7dff3d160d3cc7406e123cdd449db156280feca95a928996f24558b5e494f'
                '16f9c08faa1d3bc171b05e46a59dafa97e2367b1b95b40f3037007ea4481a75db7f3ee28167bf426f4080643bf4047a6e9019e55c7708e623d9535fdcf84c6d9')

prepare() {
	sed -i -e "s/@ELECTRON@/$_pkgname/g" "$srcdir/electron-launcher.sh"
}

# Unable to test functionality, as this version of Electron requires an active X11 session to call --version and does not work with Xvfb

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
