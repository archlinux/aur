# Maintainer: Matt Quintanilla <matt @ matt quintanilla .xyz>
pkgname='winboat-git'
_pkgname='winboat'
pkgver=r93.0be4918
_pkgver='0.6.3'
pkgrel=1
pkgdesc='Run Windows apps on Linux with seamless integration'
arch=(x86_64)
url='https://github.com/TibixDev/winboat'
license=('MIT')
provides=(${_pkgname})
conflicts=(${_pkgname})
depends=('qt6-base' 'qt6-multimedia')
makedepends=('npm' 'go' 'git')
options=("!strip" "!debug")
source=("git+https://github.com/tibixdev/winboat.git")

sha256sums=('SKIP')


pkgver() {
  cd "winboat"
  #git describe --tags | sed 's/-/+/g'
   printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}
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
