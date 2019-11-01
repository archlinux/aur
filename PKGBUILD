# Maintainer: davedatum <ask at davedatum dot com>

pkgname=topsi-project-manager-git
_pkgname=topsi-project-manager
pkgver=0.1.r0.g1c9d0d4
pkgrel=1
pkgdesc="A Desktop Kanban board app"
arch=("x86_64")
url="https://github.com/Physiix/topsi-project-manager"
license=("AGPL3")
depends=("electron4")
makedepends=("git" "npm")
provides=("$pkgname")
conflicts=("$pkgname")
install=$_pkgname.install
source=("$_pkgname::git+$url.git#tag=v0.1"
		"$_pkgname.sh"
		"$_pkgname.desktop"
		"$_pkgname.install")
md5sums=('SKIP'
         '5534a05a4906962ed5f49ecc21b6f805'
         '5e08442fe5120f87b93c138a2205d0b7'
         '3b1ed88f92128675ecd30eb2ad96a931')

prepare() {
	sed -i -e '/"scripts"/a "linux": "node .electron-vue/build.js && electron-builder --linux",' "$srcdir/$_pkgname/package.json"
}

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$_pkgname"
	npm install && npm run linux
}

package() {
	install -Dm755 "$srcdir/$_pkgname/build/linux-unpacked/resources/app.asar" "$pkgdir/opt/$_pkgname/app.asar"
	install -Dm644 "$srcdir/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
	install -Dm644 "$srcdir/$_pkgname.sh" "$pkgdir/usr/bin/$_pkgname"

	install -Dm644 "$srcdir/$_pkgname/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"


  	for _size in "1024x1024" "512x512" "256x256" "128x128" "64x64" "48x48" "32x32" "24x24" "16x16"
  	do
    	install -Dm755 "$srcdir/$_pkgname/build/icons/png/$_size.png" \
    		"$pkgdir/usr/share/icons/hicolor/$_size/apps/$_pkgname.png"
  	done

}