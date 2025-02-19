# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Nicola Squartini <tensor5@gmail.com> (electron-launcher.sh script)
# Contributor: Tom Vincent <http://tlvince.com/contact/>
_projectname='electron'
_pkgname="${_projectname}8"
pkgname="$_pkgname-bin"
pkgver='8.5.5'
pkgrel='6'
epoch='1'
pkgdesc='Build cross platform desktop apps with web technologies - version 8 - binary version'
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url="https://${_projectname}js.org"
license=('MIT')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
depends=('c-ares' 'ffmpeg' 'gtk3' 'http-parser' 'libevent' 'libxslt' 'libxss' 'minizip' 'nss' 're2' 'snappy')
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
b2sums_x86_64=('749bcc58b562943d88fb4b0af3976d6d9a8150c1a1505c11b157066b21f3f7e6b85d5f3fd8ed13f97920ee6411d83e8f5e8c757af011f5a2cdea9f097e1d8b26'
               '98b71f6a883e2953f0346df0915a6b67bcdc70537d73883158c32b091266d063f23495c5be77cc49e58423f4b9b42ffaca36cf11fee0510ed630059e874da43b')
b2sums_i686=('df7d5cc7d9085720e80378984a723403d8667d35f6b7757015d0f0bb730bbf3ce060c288d3a5e383cbae491a305d06b33b36ac9f727795dc68afc7b513fef27f'
             'b61a800523543eb1f1b350b7a46934acca47ee1fad9d60041ccca9b8892355fca999242ee49b9062912c83d8fbabda6aa4c15ae324e83f59a68faeccb3c94632')
b2sums_pentium4=('df7d5cc7d9085720e80378984a723403d8667d35f6b7757015d0f0bb730bbf3ce060c288d3a5e383cbae491a305d06b33b36ac9f727795dc68afc7b513fef27f'
                 'b61a800523543eb1f1b350b7a46934acca47ee1fad9d60041ccca9b8892355fca999242ee49b9062912c83d8fbabda6aa4c15ae324e83f59a68faeccb3c94632')
b2sums_armv7h=('fa818a58cb11af40c3b21f50c5a077220c41a612e9cb482312582466fdadf03e9b3c93f06dd56e6a45f776643071c4a70d0731d27aabe2c5372728802f1043fc'
               '04f36ad3835243e4cb52c5cba36391916eb6bcc976e46b5cb7d5811abaf54df11e971d86bd74d5a0b8f7d875de8bd735454cd1623d3059e13c847db164f16614')
b2sums_aarch64=('33d60f2fcae4be98245e0fbbeac276e69ff8dcd940a9ca77e4d2c345db1e927046b307794def2d469b0a90cdbe16bf9db2e053f20d04a335565c524ac56f1dba'
                '316f478721e82d0d44bdb4a6ac5b0fc0f7f635aba0fdc9ed2f59d10f93ad12fcfb3348b51248776fefc4c9f1fc70e226283ab677ae8796516a1e81ec14dd54d4')

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
