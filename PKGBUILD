# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Nicola Squartini <tensor5@gmail.com> (electron-launcher.sh script)
# Contributor: Matthew McGinn <mamcgi@gmail.com>
_projectname='electron'
_pkgname="${_projectname}3"
pkgname="$_pkgname-bin"
pkgver='3.1.13'
pkgrel='8'
pkgdesc='Build cross platform desktop apps with web technologies - version 3 - binary version'
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url="https://${_projectname}js.org"
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname")
depends=('c-ares' 'ffmpeg' 'gtk3' 'http-parser' 'libevent' 'libxslt' 'libxss' 'minizip' 'nss' 'snappy')
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
b2sums_x86_64=('16ac896491885135e8433ce6f22030c851ad205d948a5322f7c8811b74c597dc474a4e3874c83618ce55260f206949df41af606753b4bae04ab34fa04f835761'
               '6d60fbb276f01356d69c3a8baa62d21fcd60ac1b361c54301b23544765de202a46a0a18ffa66287df55fe2f95a231cc60c6e01066613bd92d67f30169272df02')
b2sums_i686=('c0fe04bb5e72b54b7d8399daf3980f92df9ea8087edbab6d81b6cec26d1bf18cb7ead5b620b310e50993d1855e926aea816528a543655ec71e4a8084230a9786'
             '02cb16083e4fb990bd7ea040dbb7dff170736fb7c1e9fd423591c925670cae461724d6c6837928405140e0b5208aa57ab3436e1c478b4847d7dc0a4ab9fd027d')
b2sums_pentium4=('c0fe04bb5e72b54b7d8399daf3980f92df9ea8087edbab6d81b6cec26d1bf18cb7ead5b620b310e50993d1855e926aea816528a543655ec71e4a8084230a9786'
                 '02cb16083e4fb990bd7ea040dbb7dff170736fb7c1e9fd423591c925670cae461724d6c6837928405140e0b5208aa57ab3436e1c478b4847d7dc0a4ab9fd027d')
b2sums_armv7h=('b57462fabfe14049784e1b0dc0293c0860595c3311aacd079ce7fea703ff13195571ad2fa1d67c7aec703e030092608fd87c6701e7984e2e71650438ef4cbbc5'
               '70b1ba871e4015ebdded5ab54c6111b6c6db5d4ad527a9ba7d18c49802f85ee42f7b07ce2f70a23ca722f6a254dfe92d036db1b89e7188a2aa3e054fe067be0e')
b2sums_aarch64=('893426bdac537f193ddec175c04594b7d0a89b36db1d766dea92ca4dc6d0aea410cd7eab5dbbb886da112dcb2baf56e522896a83289c128ef7685205bdead226'
                'ae270333ce2b1ecdb6c59a4685599e4919bc4b0425cf9b38d31aef1aba8773f3f1de5f44204864357aab2267581e209d37dc126eff8103a7760e214198d6056e')

prepare() {
	sed -i -e "s/@ELECTRON@/$_pkgname/g" "$srcdir/electron-launcher.sh"
}

# Unable to test functionality, as this version of Electron requires an active X11 session to call --version and does not work with Xvfb

package() {
	cd "$srcdir/"
	install -dm755 "$pkgdir/usr/lib/$_pkgname/"
	find . -mindepth 1 -maxdepth 1 -type f ! -name "*.zip" ! -name "LICENSE*" -exec cp -r --no-preserve=ownership --preserve=mode -t "$pkgdir/usr/lib/$_pkgname/." {} +

	for _folder in 'locales' 'resources'; do
		cp -r --no-preserve=ownership --preserve=mode "$_folder/" "$pkgdir/usr/lib/$_pkgname/$_folder/"
	done

	install -Dm755 'electron-launcher.sh' "$pkgdir/usr/bin/$_pkgname"

	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/MIT"
	install -Dm644 'LICENSES.chromium.html' "$pkgdir/usr/share/licenses/$pkgname/LICENSES.chromium.html"
}
