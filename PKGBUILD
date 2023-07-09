# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Nicola Squartini <tensor5@gmail.com>
_projectname='electron'
_pkgname="${_projectname}6"
pkgname="$_pkgname-bin"
pkgver='6.1.12'
pkgrel='5'
pkgdesc='Build cross platform desktop apps with web technologies - version 6 - binary version'
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
sha512sums_x86_64=('b09e46bef6b486f32d38e5c79735f78b703db6a070142a02a5d91bd961c69272ba97ff2c3506ef45ca840b69e77cf56ba59ad7b6f1f6a5275f76adf1b6f2a851'
                   '8edd32aa2b5bcdccd62f80bf7684089be480e84c8b022f8c0f99880bac3b105065814d6c5e55468bbef922bbd18d3f0db2719a9d36516f5b76f26467edebae74')
sha512sums_i686=('5720e6a69bd486555b79abcf3540c46b0472533585c2f60ed44377527b9b2751aa1b1c912e0fde6f4448bb2b4db2927dbe10bb774b8fc24845da3da89f651db0'
                 'ef74ae559ebc1ea90d954f6ae9d5b385fcd43503fcc026da3b17ae97f3409ef6d4ed2d5b7be516e082c9edb6930f097f84f6fe11e198ded2d94ad4093221cb7f')
sha512sums_pentium4=('5720e6a69bd486555b79abcf3540c46b0472533585c2f60ed44377527b9b2751aa1b1c912e0fde6f4448bb2b4db2927dbe10bb774b8fc24845da3da89f651db0'
                     'ef74ae559ebc1ea90d954f6ae9d5b385fcd43503fcc026da3b17ae97f3409ef6d4ed2d5b7be516e082c9edb6930f097f84f6fe11e198ded2d94ad4093221cb7f')
sha512sums_armv7h=('252fe20537f370d1186c5fef7f7387d9eda7e26946456779be57cac8b00e723848cb72ee56ae2bd09b46a3a1d78b81528c72605e947fa2f9098501fa1497edd7'
                   'ae0389bf8ccb05f1618df5da82ede0ca7782fab69d0703acf3d09bfec0b2e714c009989930dea7502ae232fe97fe0311493820398108b9dfa29d43fc51eecb43')
sha512sums_aarch64=('2303cff8a2b83e0a5f7a611f478e86335bd031cc20fc0608c1b65074a5a48bca082e19f9ebb2d3296f8379f12cec83978891746381e6e2d58ccac02e50b10d1b'
                    'ba9bf00bd90715fc119996268cc0527024893e380303553d5549f7e3668694eabb5f4358808b6cadb49b879c9f8722d3eafec328c671e0fbfbb907e45c5ff266')

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

	chmod u+s "$pkgdir/usr/lib/$_pkgname/chrome-sandbox"

	install -Dm755 'electron-launcher.sh' "$pkgdir/usr/bin/$_pkgname"

	for _license in 'LICENSE' 'LICENSES.chromium.html'; do
		install -Dm644 "$_license" "$pkgdir/usr/share/licenses/$pkgname/$_license"
	done
}
