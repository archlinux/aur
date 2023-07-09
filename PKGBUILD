# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Nicola Squartini <tensor5@gmail.com> (electron-launcher.sh script)
# Contributor: Matthew McGinn <mamcgi@gmail.com>
_projectname='electron'
_pkgname="${_projectname}5"
pkgname="$_pkgname-bin"
pkgver='5.0.13'
pkgrel='5'
pkgdesc='Build cross platform desktop apps with web technologies - version 5 - binary version'
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
sha512sums=('bafaff764fe602996183f0a63b9aca3885bf07086fd7c7e727608b7206a9aadf3f2fe057f5f9405fb36689b85fa106fb949b3214a63009672db76a1af643f446')
sha512sums_x86_64=('70e0da5268ca86e3ecca3c94e3a815160b24c9861f4a7dc1d1eef743450bc8ba5681a755697d828c5555b8f36ee7ab645f2e6c51fa569e78067879957becb65d'
                   '03df450fca8951eb90d634a06c01f21f6c223f1e0de2573d0c1482cdc92ff950bc4a82342fd3f7d9d6962df1e6392cbfd01e9cc64319c75ee5b62ea1eb999e5b')
sha512sums_i686=('38675ffa869a09ce4c7b04e2af4a60caf8fdf0cd33ef5dfe9a259b3d936193b872bbc8e62b8529d3b170e16ad80d2d8cc0118708791a6241ccf82d990c416e84'
                 '03262eda03636bf551a322b40b351ff308ac897258d73c1cf0d524096309343077b38984865ba4235b81b3c9e308ced25d54cf2b3a1068457eb58df1a4e8772a')
sha512sums_pentium4=('38675ffa869a09ce4c7b04e2af4a60caf8fdf0cd33ef5dfe9a259b3d936193b872bbc8e62b8529d3b170e16ad80d2d8cc0118708791a6241ccf82d990c416e84'
                     '03262eda03636bf551a322b40b351ff308ac897258d73c1cf0d524096309343077b38984865ba4235b81b3c9e308ced25d54cf2b3a1068457eb58df1a4e8772a')
sha512sums_armv7h=('eee2bbdf97587f905f7bb704bff16fac213499551597ff61f52ae0d64da02e21705507682e64d920450d6f2112673e74a3935342012ac889cde01a26eb522b00'
                   '041f73ec9683c92f632d6fb21373c406d318a53f6a59461cf8b2df17f77e40e624e824e9282e447ad92f0ffdd5fa5f6454f29d7625b31450cecd453a7c73b65d')
sha512sums_aarch64=('7bb99121b743a44e1040eb1d4b2a277825e7edbb7de02f83f9e34460b0bf24c83886048c2b95c03d1c29316017693c5bcef6639527e36dc0175c6272862350bb'
                    '2157af54e9058af24b8ac2ba953aa8f9c8e54141b4da71d00893ad071854446b9a354ac5a005bda353d200c39b74457941a6adf54ce76f4e318125757e65e6dd')

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
