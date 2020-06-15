# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
# Contributor: Tom Vincent <http://tlvince.com/contact/>
_projectname='electron'
_pkgname="${_projectname}8"
pkgname="$_pkgname-bin"
pkgver='8.3.2'
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
sha256sums_x86_64=('36825524811ec82c466bb46e422ff7851ebaf93233d43ffff4f2ad6b196d7a19'
                   '2b314d9f7a793b60a6d4207ac0b27a4900c5ddcd230d483313e4d38237292abe')
sha256sums_i686=('267bca89c82f84b44011892f6d083dd354065a48fa2c6938487d53a7044fa16a'
                 'c821c2ba909e3fe3cc0e867b363c984d215c1a5a37bf1ddea938e07493e41488')
sha256sums_armv7h=('ded9c0e36e6e82fa19934128cf10ac6643e10297da8045836ce3f3855d0d15c1'
                   'ff83bca7a2b61640518903cfdd03f6843361d275edf4657e88f9500047f1d357')
sha256sums_aarch64=('ef161eaa705b83ad59c0f71027db3991306f0c7bfe7ec331eede5119a41b7901'
                    '3d97a029780ee68a89f17ccec8aff2a0d4487baca1fb7209f01e248ed41c7dea')

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
