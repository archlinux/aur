# Maintainer: Matt Quintanilla <matt @ matt quintanilla .xyz>
pkgname='winboat-git'
_pkgname='winboat'
pkgver=r94.8c04abb
pkgrel=2
pkgdesc='Run Windows apps on Linux with seamless integration'
arch=(x86_64)
url='https://github.com/TibixDev/winboat'
license=('MIT')
provides=(${_pkgname})
conflicts=(${_pkgname})
depends=('docker' 'docker-compose' 'freerdp' 'gtk3' 'alsa-lib' 'nss')
makedepends=('zip' 'npm' 'go')
makedepends=('npm' 'go' 'git')
options=("!strip" "!debug")
source=("git+https://github.com/tibixdev/winboat.git")

sha256sums=('SKIP')


pkgver() {
  cd "winboat"
  #git describe --tags | sed 's/-/+/g'
   printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
 }
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
