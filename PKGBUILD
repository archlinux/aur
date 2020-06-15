# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# based on aur electron8-bin: Tom Vincent <http://tlvince.com/contact/>

_projectname='electron'
_major='9'
_pkgname="${_projectname}${_major}"
pkgname="$_pkgname-bin"
pkgver='9.0.4'
pkgrel='1'
pkgdesc='Build cross platform desktop apps with web technologies - version ${_major} - binary version'
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
	"$pkgname-chromedriver-$pkgver-$pkgrel-x86_64.zip::$_releaseurl/chromedriver-v$pkgver-linux-x64.zip"
	"$pkgname-$pkgver-$pkgrel-x86_64.zip::$_releaseurl/$_projectname-v$pkgver-linux-x64.zip"
)
source_i686=(
	"$pkgname-chromedriver-$pkgver-$pkgrel-i686.zip::$_releaseurl/chromedriver-v$pkgver-linux-ia32.zip"
	"$pkgname-$pkgver-$pkgrel-i686.zip::$_releaseurl/$_projectname-v$pkgver-linux-ia32.zip"
)
source_armv7h=(
	"$pkgname-chromedriver-$pkgver-$pkgrel-armv7h.zip::$_releaseurl/chromedriver-v$pkgver-linux-armv7l.zip"
	"$pkgname-$pkgver-$pkgrel-armv7h.zip::$_releaseurl/$_projectname-v$pkgver-linux-armv7l.zip"
)
source_aarch64=(
	"$pkgname-chromedriver-$pkgver-$pkgrel-aarch64.zip::$_releaseurl/chromedriver-v$pkgver-linux-arm64.zip"
	"$pkgname-$pkgver-$pkgrel-aarch64.zip::$_releaseurl/$_projectname-v$pkgver-linux-arm64.zip"
)
sha256sums_x86_64=('e57e3caa48b5fa68bb85cfa72be53ec55f88557220b0a2d5a642a281b576f955'
                   '8fc71e73f060065d21f0e23f1af553769bce943d5c81abf1a3ec66b0501ac40b')
sha256sums_i686=('c0ca77e3deb9b3063bb5e1aa2424f27236e2dfbdcb8ac3591f2c96e0c8f77459'
                 '6bf8c571894aea9c160ffe387757b9bdc48a4021bad8e1492bfc8bc1a11309ff')
sha256sums_armv7h=('8f0e4f5c27955b45a03dca7f5a1cbf111e06c19f82803cfadd95a67f1d625ae6'
                   'a1554df2c2c962bcd99d8823e61de6368ec16095d6472cc0ab1f3ec06b6e5342')
sha256sums_aarch64=('b39ec31269c1f031e0a47b7c5e0742a378996c9a6fc26d9fd225e49aaef98971'
                    'e7ba491a01b64d824c6fa412be60612e39cf0937b3040b48e67974046f0bd97c')

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
