# Maintainer: Matt Quintanilla <matt @ matt quintanilla .xyz>
pkgname='winboat'
pkgver='0.6.10'
_pkgver='0.6.10'
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
            '81aef5e6123ddcbb838f915fbff5846b769b68e9ad2fc5d0f1d68370319aed2b'
            '46d2c3bb5bb6533f23b5732f64f45cc17cc17c23abdf31ea34bf923f24f49df8')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	npm i --cache "${srcdir}/npm-cache" 
	npm run build:linux-gs
}
package() {
	cd "$srcdir/$pkgname-$pkgver"
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
