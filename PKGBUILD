# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Nicola Squartini <tensor5@gmail.com> (electron-launcher.sh script)
# Contributor: Martin Kröning <m dot kroening at hotmail dot de>
# Contributor: Matthew McGinn <mamcgi@gmail.com>
_projectname='electron'
_pkgname="${_projectname}4"
pkgname="$_pkgname-bin"
pkgver='4.2.12'
pkgrel='7'
pkgdesc='Build cross platform desktop apps with web technologies - version 4 - binary version'
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url="https://${_projectname}js.org"
license=('MIT')
provides=("$_pkgname")
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
sha512sums=('e38d31100ed4d7a435f7a1ae5eb2e7f68a58003789c1bd2708ee1b1f3ad847b9a21182295bf704f06269014c226688dd1fa99017229137cafe69f3fc61b9b72c')
sha512sums_x86_64=('acfdd5bd0c2caaf3eb54de9acba67692f35bc3e31499c602f36263831b28c612a9bbf27f0d390b71439e17d556afd46fab687f58238e50ce217e6a05682817c1'
                   '7c51f785a29338e5d1d921c4515233298119ec85838812cae520b7786102fa65e7708f22fa82cdf6c86f0076fbcaec4473016f48e8adb944617e00c4ad74cb53')
sha512sums_i686=('277f40ceb0294cfc6c7656172e7b29d948549d692e7bc55143e9955cf8dc2fb9992cf421e30d7989ee12d0eb3a65fe1f0c3be22a061b9107163129725a1b7993'
                 '903690230972e104dd848d2dbc542b4a292249ff94a72ceff928107b9e7324e84e678e2067064f8aec1939d55a5494c84190076a1821e189f1bac9441a3eece1')
sha512sums_pentium4=('277f40ceb0294cfc6c7656172e7b29d948549d692e7bc55143e9955cf8dc2fb9992cf421e30d7989ee12d0eb3a65fe1f0c3be22a061b9107163129725a1b7993'
                     '903690230972e104dd848d2dbc542b4a292249ff94a72ceff928107b9e7324e84e678e2067064f8aec1939d55a5494c84190076a1821e189f1bac9441a3eece1')
sha512sums_armv7h=('fcf28d5b3ea4f92c2334940242ec7c20b7156ed995031e82754436111a5bf6b701f30c5d015fd8ff9f266057d6d9fffd3321f1d09e7a54f8ed8d95cdb8aa7804'
                   '342ef4530ad55cea36bfe1768270b1eaf073e0a1585a4ea6cde781f7d806c7aec54b58f3c6fe860e320c51c309d8b988b3df060f7ad083a27f5d0b1443cd0d63')
sha512sums_aarch64=('d7e9ef92ce373d7c908952d06bd3f86d34ec4152595248887af03aa1723dfe7cf59f3a9a66bbbfd636491e4128c75603e250c2d233ecef2b1af173f6e3d5ff14'
                    'b1eb1157ffce6d9def5183f329b75a7240e973356215a889fa543bddc42d130eca6cd2c8c8720752ecec2aa0cff91e6c6cc300efd8c957eda2626a480448d5fa')

prepare() {
	sed -i -e "s/%%PKGNAME%%/$_pkgname/g" -e "s/%%PROJECTNAME%%/$_projectname/g" "$srcdir/electron-launcher.sh"
}

package() {
	cd "$srcdir/"
	install -dm755 "$pkgdir/usr/lib/$_pkgname/"
	find . -mindepth 1 -maxdepth 1 -type f ! -name "*.zip" ! -name "LICENSE*" -exec cp -r --no-preserve=ownership --preserve=mode -t "$pkgdir/usr/lib/$_pkgname/." {} +

	for _folder in 'locales' 'resources' 'swiftshader'; do
		cp -r --no-preserve=ownership --preserve=mode "$_folder/" "$pkgdir/usr/lib/$_pkgname/$_folder/"
	done

	install -Dm755 'electron-launcher.sh' "$pkgdir/usr/bin/$_pkgname"

	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/MIT"
	install -Dm644 'LICENSES.chromium.html' "$pkgdir/usr/share/licenses/$pkgname/LICENSES.chromium.html"
}
