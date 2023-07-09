# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Nicola Squartini <tensor5@gmail.com> (electron-launcher.sh script)
# Contributor: Matthew McGinn <mamcgi@gmail.com>
_projectname='electron'
_pkgname="${_projectname}3"
pkgname="$_pkgname-bin"
pkgver='3.1.13'
pkgrel='7'
pkgdesc='Build cross platform desktop apps with web technologies - version 3 - binary version'
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url="https://${_projectname}js.org"
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname")
depends=('c-ares' 'ffmpeg' 'gtk3' 'http-parser' 'libevent' 'libxslt' 'libxss' 'minizip' 'nss' 'snappy')
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
sha512sums_x86_64=('1e5137ba3ef30b525ef01bb15698d0b07ff3eda983b7ff50d597786c25ebcb6c9d44c601ed62a46539063898b6dfa93a554ddc9332d3c4f50a2528c00a84f7c4'
                   'cef90248a12ef7649c36d52fa57b93cb19ecfaa0d3bcb93607b3d7a625073381a2eed8f4706e9acfc17c098bd7491eba3fafb935213bc9ed89b70188434f7042')
sha512sums_i686=('fa84973aaa8f87eaecd2008a8f46bac9a75a3f2697df7268c1cdc71a5768ff62e54662d37473057f9f22f33ab9cf213efc0c8503a5a1548f6bcc1c36dd5b52ce'
                 '4ea041546137fde931c1bd9a4b2d5eccda1977c06841a135c990716b342ba033b348f78f02ac3252f16b06b3413c343b6f259d7a23e17abf8ba3b94715a15071')
sha512sums_pentium4=('fa84973aaa8f87eaecd2008a8f46bac9a75a3f2697df7268c1cdc71a5768ff62e54662d37473057f9f22f33ab9cf213efc0c8503a5a1548f6bcc1c36dd5b52ce'
                     '4ea041546137fde931c1bd9a4b2d5eccda1977c06841a135c990716b342ba033b348f78f02ac3252f16b06b3413c343b6f259d7a23e17abf8ba3b94715a15071')
sha512sums_armv7h=('a0ab580e1353f45c243fc8c8ec8325e62476db6dac9b7ed86327f2f2384577df7fe887290bd1e669ae973a367820140f2f60304d8b8ecd920dc2e5c113603755'
                   'd0d3e9e14dfe6a7d2d0c4a5b9051fd9688bb6d69697efc07116883393946c65cc1f1f2dec03b3ce91aff0611ff6def76b8352173e927d8372df033e1010e0553')
sha512sums_aarch64=('73bd388d6cdde9198071b0cf016d1cfdcac9d47e0f0c962185399fbc1f0b6115f22a31e87c9eedad8a75b2b2f982a215be5e9c818e100ce01c895f4df467b8d5'
                    'c1b96713cd152747b34d97df8bb9a4352a87cae910a54ceba3eb39752a829e80b083aed8c6d6af42639a73fab86dbb7559f5d70869b54c956e1057ec6ad712ec')

prepare() {
	sed -i -e "s/%%PKGNAME%%/$_pkgname/g" -e "s/%%PROJECTNAME%%/$_projectname/g" "$srcdir/electron-launcher.sh"
}

package() {
	cd "$srcdir/"
	install -dm755 "$pkgdir/usr/lib/$_pkgname/"
	find . -mindepth 1 -maxdepth 1 -type f ! -name "*.zip" ! -name "LICENSE*" -exec cp -r --no-preserve=ownership --preserve=mode -t "$pkgdir/usr/lib/$_pkgname/." {} +

	for _folder in 'locales' 'resources'; do
		cp -r --no-preserve=ownership --preserve=mode "$_folder/" "$pkgdir/usr/lib/$_pkgname/$_folder/"
	done

	install -Dm755 'electron-launcher.sh' "$pkgdir/usr/bin/$_pkgname"

	for _license in 'LICENSE' 'LICENSES.chromium.html'; do
		install -Dm644 "$_license" "$pkgdir/usr/share/licenses/$pkgname/$_license"
	done
}
