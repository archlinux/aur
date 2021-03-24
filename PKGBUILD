# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# based on aur electron8-bin: Tom Vincent <http://tlvince.com/contact/>

_projectname=electron
_major=10
_pkgname="${_projectname}${_major}"
_pkgver=10.4.2
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
sha256sums_x86_64=('0096e70de7d8a28d55b1531b1db8148cc5e464458249c6a99a3ed3cf0c4d7cba'
                   '3d613b413f01c8af1600be42c82941761452407e1160125eca60feec0d7dd0c0')
sha256sums_i686=('c7d608baf80764170c0b7bf7b66c0660a5c36874e2e688a053370e9bff269b37'
                 '297083ca9b21554ea1f729ed17c0c8b13aaea24e77194f9c1b340489fcfc0fa6')
sha256sums_armv7h=('9a67846404f524a13833ab4a4c5e4fb0418c4816532a01dfb35e06972f22f5f4'
                   '3d93ec220824cce5d99b3a7511604b89c63935bd1130fc64ce08b8436e34c096')
sha256sums_aarch64=('18135bad021ddd6c531f9439b975cea42757523ce3e3a39d1debcf9ed60f2fcf'
                    '0060e37eada91bac51945ae325ab04309438609089d31ab3f8bbfda73cc26166')

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
