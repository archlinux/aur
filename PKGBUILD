# Maintainer: davedatum <ask at davedatum dot com>

pkgname=mini-diary-git
_pkgname=mini-diary
pkgver=v2.4.1.r16.g90bf72e
pkgrel=1
pkgdesc="Simple and secure journal app"
arch=("x86_64")
url="https://github.com/samuelmeuli/mini-diary"
license=("MIT")
depends=("electron")
makedepends=("git" "npm" "imagemagick")
provides=("$pkgname")
conflicts=("$pkgname")
install=$_pkgname.install
source=("$_pkgname::git+$url.git"
		"$_pkgname.sh"
		"$_pkgname.desktop"
		"$_pkgname.install")
md5sums=("SKIP"
         "58bbcfb0f107d1e6dc6af01ccbbde552"
         "7efca87d5c782c6b4334e381e5c67b3e"
         "292b53906f31d9bc445961e8a33092b1")

pkgver() {
  	cd "$_pkgname"
  	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	sed -i -e 's,.*"build:app":.*,"build:app": "electron-builder --linux",' "$srcdir/$_pkgname/package.json"
	sed -i -e '/"build:app": "electron-builder --linux"/ s/$/,/' "$srcdir/$_pkgname/package.json"
	sed -i '27idevTools: false' "$srcdir/$_pkgname/src/main/main.ts"
}

build() {
	cd "$srcdir/$_pkgname"
	npm install && npm run build
}

package() {
	install -Dm755 "$srcdir/$_pkgname/dist/linux-unpacked/resources/app.asar" "$pkgdir/opt/$_pkgname/app.asar"
	install -Dm644 "$srcdir/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
	install -Dm644 "$srcdir/$_pkgname.sh" "$pkgdir/usr/bin/$_pkgname"

	install -Dm644 "$srcdir/$_pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"

  	for _size in "192x192" "128x128" "96x96" "64x64" "48x48" "32x32" "24x24" "22x22" "20x20" "16x16" "8x8"
  	do
    	install -dm755 "$pkgdir/usr/share/icons/hicolor/$_size/apps"
    	convert "$srcdir/$_pkgname/website/img/app-icon.png" \
    	-resize "$_size" "$pkgdir/usr/share/icons/hicolor/$_size/apps/$_pkgname.png"
  	done
}