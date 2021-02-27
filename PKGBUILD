# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# based on aur electron8-bin: Tom Vincent <http://tlvince.com/contact/>

_projectname=electron
_major=11
_pkgname="${_projectname}${_major}"
_pkgver=11.3.0
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
sha256sums_x86_64=('989fb33af0245b304c276616cddbc12a98d5344aac0211b0a6e6455e4fb9d7ac'
                   '136794f9ecc1c6ea38fe9b85682e8fcc8c4afd559f5cd6b4059339b017279917')
sha256sums_i686=('52872386e20a8701806cc7f2c01fb4e538eeccc07f8ede81660ba6ef18994f01'
                 '48ab133cab380c564529ea605d4521404b9bd07d80dad6346e1756a0952081cd')
sha256sums_armv7h=('6cfbe4a98ddb0de3d396e039b35cd6db197ce5fd260ae9ee78edf9474ac194f2'
                   '5774c2995c6dcf911ece00a94ace0f37d55132da91b1fd242c69e047872ef137')
sha256sums_aarch64=('f1ac9bca0869e677b750ea94d6d2935666203c34687f55b65e0637557347e42a'
                    'fad31c6fba7aba54db19a2aaedb03b514c51dd58bf301afab5265126833feb15')

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
