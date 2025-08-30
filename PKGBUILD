# Maintainer: Matt Quintanilla <matt @ matt quintanilla .xyz>
pkgname='winboat-git'
_pkgname='winboat'
pkgver='0.6.3'
_pkgver='0.6.3'
pkgrel='1'
pkgdesc='Run Windows apps on Linux with seamless integration'
arch=(x86_64)
url='https://github.com/TibixDev/winboat'
license=('MIT')
provides=(${_pkgname})
conflicts=(${_pkgname})
depends=('qt6-base' 'qt6-multimedia')
makedepends=('npm' 'go' 'git')
options=("!strip" "!debug")
source=(
	"$pkgname.png::https://raw.githubusercontent.com/tibixdev/winboat/refs/heads/main/icons/icon.png"
	"LICENSE::$url/blob/main/LICENSE"
	"git+https://github.com/tibixdev/winboat.git")

sha256sums=('3f733f11d7cc81c51c654901458add642978be5e5c6f1fdd12f45a3ae22b9dcd'
            '7579d3d52fa1cd4df438a0a86e5a60e72030ae612f85866001e2f07a6de62efa'
            'SKIP')
package() {
	cd "$srcdir/$_pkgname"
	npm i --cache "${srcdir}/npm-cache" 
	npm run build:linux-gs
	cd dist/linux-unpacked
	pwd	
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
