# Maintainer: Timmy Yao <timmy.yao+aur@gmail.com>
pkgname=authy
pkgver=1.8.0
pkgrel=1
pkgdesc="Two-Factor Authentication from your PC. Converted from Windows electron version"
arch=("x86_64")
url="https://authy.com/"
license=('ISC')
depends=('electron')
makedepends=('npm' 'p7zip' 'asar')
source=("https://s3.amazonaws.com/authy-electron-repository-production/authy/stable/${pkgver}/win32/x64/Authy%20Desktop%20Setup%20${pkgver}.exe"
        "authy.desktop")
md5sums=('2612c816ae5ea59ecfbbaef02e26830b'
         '6e27d1fc03a2ba89c0b6670d4f38b08b')

build() {
	cd "$srcdir"
	7z x "Authy%20Desktop%20Setup%20${pkgver}.exe" -o"$pkgname-$pkgver" -y
	
	cd "$pkgname-$pkgver"
	7z x "authy-electron-$pkgver-full.nupkg" -y

	mkdir app.asar
	asar e lib/net45/resources/app.asar app.asar
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	install -Dm644  -t "${pkgdir}"/usr/lib/"${pkgname}" \
		lib/net45/resources/app.asar \
		app.asar/img/logos/icon128.png
	install -Dm644 "$srcdir"/authy.desktop -t "$pkgdir"/usr/share/applications
}

