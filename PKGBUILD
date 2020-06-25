# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
# Contributor: Tom Vincent <http://tlvince.com/contact/>
_projectname='electron'
_pkgname="${_projectname}8"
pkgname="$_pkgname-bin"
pkgver='8.3.4'
pkgrel='1'
epoch='1'
pkgdesc='Build cross platform desktop apps with web technologies - version 8 - binary version'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://${_projectname}js.org/"
license=('MIT')
provides=("$_pkgname")
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
	"$pkgname-chromedriver-$epoch:$pkgver-$pkgrel-x86_64.zip::$_releaseurl/chromedriver-v$pkgver-linux-x64.zip"
	"$pkgname-$epoch:$pkgver-$pkgrel-x86_64.zip::$_releaseurl/$_projectname-v$pkgver-linux-x64.zip"
)
source_i686=(
	"$pkgname-chromedriver-$epoch:$pkgver-$pkgrel-i686.zip::$_releaseurl/chromedriver-v$pkgver-linux-ia32.zip"
	"$pkgname-$epoch:$pkgver-$pkgrel-i686.zip::$_releaseurl/$_projectname-v$pkgver-linux-ia32.zip"
)
source_armv7h=(
	"$pkgname-chromedriver-$epoch:$pkgver-$pkgrel-armv7h.zip::$_releaseurl/chromedriver-v$pkgver-linux-armv7l.zip"
	"$pkgname-$epoch:$pkgver-$pkgrel-armv7h.zip::$_releaseurl/$_projectname-v$pkgver-linux-armv7l.zip"
)
source_aarch64=(
	"$pkgname-chromedriver-$epoch:$pkgver-$pkgrel-aarch64.zip::$_releaseurl/chromedriver-v$pkgver-linux-arm64.zip"
	"$pkgname-$epoch:$pkgver-$pkgrel-aarch64.zip::$_releaseurl/$_projectname-v$pkgver-linux-arm64.zip"
)
sha256sums_x86_64=('4b201f343568af973ea0730a392cdabbd364ca67917de3e83d18436ffa6e990f'
                   '2bc5cbeca1dec57cc6aabd044600ee55b44e115e3ba0ec30323a7f44b133a874')
sha256sums_i686=('f95a6b06e6bb3b98ecbee63dcd776cb3846224a10edf8de81d305796d784a7d5'
                 '9db5fce8c2bc8fbf56fbf37a4016912a2ec5138e1bd12d7027fb8938a0e1b43e')
sha256sums_armv7h=('c236eab2559eb1f15cd242f79a3291c205da2009e0e30d6460e564c5a1c65d24'
                   'ab5daf91dfde8f523302c37c474913d470045ac13e120be72611bb02ffe07f51')
sha256sums_aarch64=('fbb9f6728161c655991344ac1caae80664cc38feb15932cab57a9fe5c66b7f8f'
                    '828d5f17ffcb00b38941408362715d116d24ab5895c8d3a16683556b7832cd32')

package() {
	cd "$srcdir/"
	install -dm755 "$pkgdir/usr/lib/$_pkgname/"
	find . -mindepth 1 -maxdepth 1 -type f ! -name "*.zip" ! -name "LICENSE*" -exec cp -r --no-preserve=ownership --preserve=mode -t "$pkgdir/usr/lib/$_pkgname/." {} +

	for _folder in 'locales' 'resources' 'swiftshader'; do
		cp -r --no-preserve=ownership --preserve=mode "$_folder/" "$pkgdir/usr/lib/$_pkgname/$_folder/"
	done

	chmod u+s "$pkgdir/usr/lib/$_pkgname/chrome-sandbox"

	install -dm755 "$pkgdir/usr/bin"
	ln -nfs "/usr/lib/$_pkgname/$_projectname" "$pkgdir/usr/bin/$_pkgname"

	for _license in 'LICENSE' 'LICENSES.chromium.html'; do
		install -Dm644 "$_license" "$pkgdir/usr/share/licenses/$pkgname/$_license"
	done
}
