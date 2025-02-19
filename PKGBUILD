# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Nicola Squartini <tensor5@gmail.com> (electron-launcher.sh script)
# Contributor: Matthew McGinn <mamcgi@gmail.com>
_projectname='electron'
_pkgname="${_projectname}5"
pkgname="$_pkgname-bin"
pkgver='5.0.13'
pkgrel='6'
pkgdesc='Build cross platform desktop apps with web technologies - version 5 - binary version'
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url="https://${_projectname}js.org"
license=('MIT')
provides=("$_pkgname=$pkgver")
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
b2sums=('49d2beda3260b6a09b7365a119524bd9b0c03b89e95be608a89f728d72e3694892d3ad0d02db85c09ce2f4ccb458ea207fab27f84a2e7e15a2fd4f720d991dac')
b2sums_x86_64=('ebca99e1042951e9b4695b8b6a8de94e699b0f2047884222f52505ae7dd7f64802d2b62fd3216ea6ffde09cd80fb9e6cd3b10c8777a1f4d5717a9d4907338fd2'
               'f70103dc328caffe1a114816f793b95ed701ab2fcdbd858ec2d2e4086debfc4a65dccf7cd0e169b9c26649c96bcc884fe0b89d127e77e225ab97a1d25bf695c4')
b2sums_i686=('0c58f107b2caf7519cd7f15c0ff0f003b85873b7cd3edf3f713951d30e0a9f4c9a2fe7d282e598b9b13c3a7c2547a1b8fec0b9e2d6923a9a83670bcec35ff105'
             '85e05166cb5ae96a1ef92d59b6d6285e57121820b359d24eaacfe480c0d6ec8964fb5a7fb947ac4cc1b54f63926c8abceb896de60019dd8caa6b81ab0a73af87')
b2sums_pentium4=('0c58f107b2caf7519cd7f15c0ff0f003b85873b7cd3edf3f713951d30e0a9f4c9a2fe7d282e598b9b13c3a7c2547a1b8fec0b9e2d6923a9a83670bcec35ff105'
                 '85e05166cb5ae96a1ef92d59b6d6285e57121820b359d24eaacfe480c0d6ec8964fb5a7fb947ac4cc1b54f63926c8abceb896de60019dd8caa6b81ab0a73af87')
b2sums_armv7h=('3ab6320186773c807847514b43eaa90bc6d79b7d6f75ebe8d9523d4bc17f2d3aaf482a174b62dbef0226d4e19062083017e602cca1aa326068fe3d41757ae967'
               '6a0981eb7162afd6c5dc406d9196c641079e9aa9743c717284033e967c8bb9f6796167908d893415baa3dedd1be9c13ffa22fcc4281dfa3efe9209cc78a9376d')
b2sums_aarch64=('48b518ece562b8df42d03e0941047399747512ef87ed82e600a0bb110f1ce3f3952a505327b449472afe609e81a5d50c9be7ed3cda7e870eeb6a19ea048534ec'
                '8d8c4017deaa7a2288c238a0f2ff46dbd27a04e0aa91c28a60a7b6c40ea98c9e395cc85cdc36009af50b0ef8a41354430795ffb7efe90c7460f5ab50ef3c4172')

prepare() {
	sed -i -e "s/@ELECTRON@/$_pkgname/g" "$srcdir/electron-launcher.sh"
}

# Unable to test functionality, as this version of Electron requires an active X11 session to call --version and does not work with Xvfb

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
