# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# based on aur electron8-bin: Tom Vincent <http://tlvince.com/contact/>

_projectname=electron
_major=12
_pkgname="${_projectname}${_major}"
_pkgver=12.0.0-beta.30
pkgname="$_pkgname-bin"
pkgver="${_pkgver/-/.}"
pkgrel=1
pkgdesc="Build cross platform desktop apps with web technologies - version ${_major} - binary version"
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
_releaseurl="https://github.com/$_projectname/$_projectname/releases/download/v$_pkgver"
source_x86_64=(
	"$pkgname-chromedriver-$_pkgver-$pkgrel-x86_64.zip::$_releaseurl/chromedriver-v$_pkgver-linux-x64.zip"
	"$pkgname-$_pkgver-$pkgrel-x86_64.zip::$_releaseurl/$_projectname-v$_pkgver-linux-x64.zip"
)
source_i686=(
	"$pkgname-chromedriver-$_pkgver-$pkgrel-i686.zip::$_releaseurl/chromedriver-v$_pkgver-linux-ia32.zip"
	"$pkgname-$_pkgver-$pkgrel-i686.zip::$_releaseurl/$_projectname-v$_pkgver-linux-ia32.zip"
)
source_armv7h=(
	"$pkgname-chromedriver-$_pkgver-$pkgrel-armv7h.zip::$_releaseurl/chromedriver-v$_pkgver-linux-armv7l.zip"
	"$pkgname-$_pkgver-$pkgrel-armv7h.zip::$_releaseurl/$_projectname-v$_pkgver-linux-armv7l.zip"
)
source_aarch64=(
	"$pkgname-chromedriver-$_pkgver-$pkgrel-aarch64.zip::$_releaseurl/chromedriver-v$_pkgver-linux-arm64.zip"
	"$pkgname-$_pkgver-$pkgrel-aarch64.zip::$_releaseurl/$_projectname-v$_pkgver-linux-arm64.zip"
)
sha256sums_x86_64=('afe3f4ad102eff3dacb440d8f62344e792584f098b98676f9bee10564df404c6'
                   'e68aa10fe499cfd0362bf6280ef119fff16d80bfd507fd75e5ff2a834e9013fe')
sha256sums_i686=('fd0827636963c1b4c79a0ea2e73623f9c68c737f1a8f2e939a75459802a3437c'
                 '38ef55750c3d1594eff5eae55e2f86b0208abcc8b0fc0b8037b7013a16d6e214')
sha256sums_armv7h=('ad1749b0b0e3a05e6913668f212133acf4f7d68d592be60ee06bc06086a9c30b'
                   'c864a27d8e4916be6ea915f5c4e8cf259daf714332766ecc98908db5640338ae')
sha256sums_aarch64=('afa17a4853579f2f92979c91de3119f3ea1574951a8b9d32d6fb9b78bffd5b14'
                    'fc5812f7f23e042929688ce100f10e9944ce5c51be0a4e77371bd080a9fa199d')

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
