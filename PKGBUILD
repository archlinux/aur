# Maintainer: Matt Quintanilla <matt @ matt quintanilla .xyz>
_pkgname="winboat"

pkgname='winboat-bin'
pkgver='0.6.3'
_pkgver='0.6.3'
pkgrel='1'
pkgdesc='Run Windows apps on Linux with seamless integration'
arch=(x86_64)
url='https://github.com/TibixDev/winboat'
license=('MIT')
depends=('qt6-base' 'qt6-multimedia')
makedepends=('npm' 'go')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=("!strip" "!debug")
source=(
	"$_pkgname.png::https://raw.githubusercontent.com/tibixdev/winboat/refs/heads/main/icons/icon.png"
	"LICENSE::$url/blob/main/LICENSE"
	"$_pkgname-$pkgver.tar.gz::$url/archive/v$pkgver/$pkgver.zip")

sha256sums=('3f733f11d7cc81c51c654901458add642978be5e5c6f1fdd12f45a3ae22b9dcd'
            '7579d3d52fa1cd4df438a0a86e5a60e72030ae612f85866001e2f07a6de62efa'
            '5821f3653aefaa1767fd5996dbb1a899579bb9640a53a66b50c145798b41522d')

#build() {
#	cd "$srcdir"

	# Convert image
#	magick "$_pkgname.ico" "$_pkgname.png"
#}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	npm i
	npm run build:linux-gs
	cd dist/linux-unpacked
	pwd
	install -d "$pkgdir/usr/bin/"

	install -Dm755 "$_pkgname-$pkgver.AppImage" "$pkgdir/usr/bin/$_pkgname"

	# Icon
	cd ..
	install -D icons/icon.png "$pkgdir/usr/share/icons/$_pkgname.png"

	# Licences
	install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
	for _file in *; do
		if [ -f "$_file" ]; then
			install -Dm644 $_file "$pkgdir/usr/share/licenses/$_pkgname/$_file"
		fi
	done

	install -Dm0644 /dev/stdin $pkgdir/usr/share/applications/$_pkgname.desktop <<EOF
[Desktop Entry]
Name=winboat
Exec=/usr/bin/$_pkgname
Icon=$_pkgname
Terminal=false
Type=Application
Comment=Run Windows apps on Linux with seamless integration
EOF
}
