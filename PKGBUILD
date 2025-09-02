# Maintainer: Matt Quintanilla <matt @ matt quintanilla .xyz>
_pkgname="winboat"

pkgname='winboat-bin'
pkgver='0.6.10'
_pkgver='0.6.10'
pkgrel='1'
pkgdesc='Run Windows apps on Linux with seamless integration'
arch=(x86_64)
url='https://github.com/TibixDev/winboat'
license=('MIT')
depends=('docker' 'docker-compose' 'freerdp' 'gtk3' 'alsa-lib' 'nss')
makedepends=('zip' 'npm' 'go')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=("!strip" "!debug")
source=(
	"$_pkgname.png::https://raw.githubusercontent.com/tibixdev/winboat/refs/heads/main/icons/icon.png"
	"LICENSE::$url/blob/main/LICENSE"
	"$_pkgname-linux-unpacked.zip::$url/archive/v$pkgver/$pkgver.zip")

sha256sums=('3f733f11d7cc81c51c654901458add642978be5e5c6f1fdd12f45a3ae22b9dcd'
            '0221fd24f1e44106c26a3c8e0def158dda5b15885fceeaedd5a26bf53dd9818b'
            '46d2c3bb5bb6533f23b5732f64f45cc17cc17c23abdf31ea34bf923f24f49df8')
build() {
	cd "$srcdir/$_pkgname-$pkgver"
	npm i --cache "${srcdir}/npm-cache" 
	npm run build:linux-gs
}
package() {
	cd "$srcdir/$_pkgname-$pkgver"
	cd dist/linux-unpacked	
	install -d "$pkgdir/opt/$_pkgname"

	cp -a * $pkgdir/opt/$_pkgname

	# Icon
	cd ../..
	install -D icons/icon.png "$pkgdir/usr/share/icons/$_pkgname.png"

	# Licences
	install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
	install -Dm0644 /dev/stdin $pkgdir/usr/share/applications/$_pkgname.desktop <<EOF
[Desktop Entry]
Name=winboat
Exec=/opt/$_pkgname/$_pkgname
Icon=$_pkgname
Terminal=false
Type=Application
Comment=Run Windows apps on Linux with seamless integration
EOF
}
