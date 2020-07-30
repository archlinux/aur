# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# based on aur electron8-bin: Tom Vincent <http://tlvince.com/contact/>

_projectname=electron
_major=10
_pkgname="${_projectname}${_major}"
_pkgver=10.0.0-beta.15
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
sha256sums_x86_64=('11872b7971767501f0df45231c00352c20c6de8c05ecbb77af74861bf105471e'
                   'a30f2f53a2ee5a0ed4f18cf3b4ce716c760817b2448d3f43abfc7f2757ca461f')
sha256sums_i686=('f72096829335217d514fdb4b09737969b80eb9afbd00353d02ff2c1739309887'
                 'a23006aaca7c05f24b8932433867f57c804fc6a5bc8f2ae4d7fa8834b6b09bdb')
sha256sums_armv7h=('b2c1b26e180ecc47fd3a09cb8ca3b9d4695dd6ffdd843220490499e16e6d9e5c'
                   '65749d45139e62535cbabdc9f838c4b5d4504e666f3dffac7d2553e6098b291d')
sha256sums_aarch64=('6dcfcc7c5516dbe36d1c6553b99fdc09fd205e802b98f5e584173e4441b19203'
                    '1c209908fb5c986e09b529557c72223e28d4b3a5c0c51de230db8d9462553d07')

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
