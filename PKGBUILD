# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Nicola Squartini <tensor5@gmail.com> (electron-launcher.sh script)
# Contributor: Martin Kröning <m dot kroening at hotmail dot de>
# Contributor: Matthew McGinn <mamcgi@gmail.com>
_projectname='electron'
_pkgname="${_projectname}4"
pkgname="$_pkgname-bin"
pkgver='4.2.12'
pkgrel='8'
pkgdesc='Build cross platform desktop apps with web technologies - version 4 - binary version'
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
b2sums_x86_64=('28b9812b965c354ce2eea2adfb55ba3d3bc00500207260488e8b5aa0ec25ae8c9a5ad651ca12417d665d652ee83cb10afcf8b69d31a43f83ec4216d580df2608'
               '8d4f0977fa7b83dd0adb7a1c5cd46c5506a796a1e15bdcc69dc9f0299d5cf6e3e4ba6aa483e4aa85e1e56461ec02de84c060e04611344c4f9321f1e55b32da22')
b2sums_i686=('07fe91f0ed1c5d0fff2aba6ac78e9a15c3cc029ef083f796cd9c86d32de175e6331dc6e3810c04f2f215ddf55f904910fcce87a9d61a8b63f4eb61ddcff17511'
             'feeaba2c14f7da421be5ef09a34b9a157421925cb25ecb4fa1b8d9c88a2da03c6d557acae5f9b0701fb6a7a0162af0437fa843f10650d8b21b37cead8957e5e2')
b2sums_pentium4=('07fe91f0ed1c5d0fff2aba6ac78e9a15c3cc029ef083f796cd9c86d32de175e6331dc6e3810c04f2f215ddf55f904910fcce87a9d61a8b63f4eb61ddcff17511'
                 'feeaba2c14f7da421be5ef09a34b9a157421925cb25ecb4fa1b8d9c88a2da03c6d557acae5f9b0701fb6a7a0162af0437fa843f10650d8b21b37cead8957e5e2')
b2sums_armv7h=('0c4e771d350db298d81a80de53ee1cba95417ead2acfe4435f831c4c2a41dfbf0b6b23b71d8dce4dadf9509ad54ddf70e2bcc71f7ed3b190e42e302e03bae138'
               '1e7165b7b1b177d7daf2bd0d9f204854ef3ae6ae8f294c34d4fe2b72eda724eb44efafdf4bc521646007f4ced721c24b5ac37071a7c4bbb29cfc996a6f024ff1')
b2sums_aarch64=('bf7997cea7c96e1f0cfd55d6dc0d7776197ddda29b067e2fcddc6545a684257ce9987c6ad9dba4dfdc11426f29c9ea3f4f6b78a2ace741c12a6ad34c890ecc8d'
                '5f1aaf8ac99d2ed761537086d14f7015833635dfbe539a12313dda12117880337cb3302ef813fe3748a3d8cd0c06a12567b34cd5b1b71f162de2e7150c30bf4c')

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

	install -Dm755 'electron-launcher.sh' "$pkgdir/usr/bin/$_pkgname"

	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/MIT"
	install -Dm644 'LICENSES.chromium.html' "$pkgdir/usr/share/licenses/$pkgname/LICENSES.chromium.html"
}
