# Maintainer: Matt Quintanilla <matt @ matt quintanilla .xyz>
pkgname='winboat'
pkgver='0.6.8'
_pkgver='0.6.8'
pkgrel='1'
pkgdesc='Run Windows apps on Linux with seamless integration'
arch=(x86_64)
url='https://github.com/TibixDev/winboat'
license=('MIT')
depends=('docker' 'docker-compose' 'freerdp' 'gtk3' 'alsa-lib' 'nss')
makedepends=('zip' 'npm' 'go')
options=("!strip" "!debug")
source=(
	"$pkgname.png::https://raw.githubusercontent.com/tibixdev/winboat/refs/heads/main/icons/icon.png"
	"LICENSE::$url/blob/main/LICENSE"
	"$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver/$pkgver.zip")

sha256sums=('3f733f11d7cc81c51c654901458add642978be5e5c6f1fdd12f45a3ae22b9dcd'
            '7579d3d52fa1cd4df438a0a86e5a60e72030ae612f85866001e2f07a6de62efa'
            '1af2246ba2fdc12d534850340ee6375b31e20f27dae10f437dbaa8e897c742e2')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	npm i --cache "${srcdir}/npm-cache" 
	npm run build:linux-gs
}
package() {
	cd dist/linux-unpacked	
	install -d "$pkgdir/opt/$pkgname"

	cp -a * $pkgdir/opt/$pkgname

	# Icon
	cd ../..
	install -D icons/icon.png "$pkgdir/usr/share/icons/$pkgname.png"

	# Licences
	install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm0644 /dev/stdin $pkgdir/usr/share/applications/$pkgname.desktop <<EOF
[Desktop Entry]
Name=winboat
Exec=/opt/$pkgname/$pkgname
Icon=$pkgname
Terminal=false
Type=Application
Comment=Run Windows apps on Linux with seamless integration
EOF
}
