# Maintainer: Neil Simpson <neilsimp1@gmail.com>

pkgname=bubblebuddy-git
_pkgname=bubblebuddy
pkgver=0.3.0
pkgrel=1
pkgdesc="Bubble Hockey program intended for Raspberry Pi"
arch=("any")
url="https://gitlab.com/neilsimp1/bubblebuddy"
license=("GPL3")
depends=("electron")
makedepends=("git" "nodejs" "npm")
source=("git+https://gitlab.com/neilsimp1/bubblebuddy.git"
	"bubblebuddy.desktop"
	"bubblebuddy.sh")
sha256sums=("SKIP"
	"489548c045d2149a8ebb87d424909c005c0174e3bd91af8aa3ba22e16bd13292"
	"cc675f85f1e8f72f1376864f439b07d124a7a40d5bc2ce9c5a03e3430c82b59e")


case $(uname -m) in
	i686)
		_electronbuilderarch='ia32'
	;;
	armv7h)
		_electronbuilderarch='armv7l'
	;;
	aarch64)
		_electronbuilderarch='arm64'
	;;
	*)
		_electronbuilderarch='x64'
	;;
esac

build() {
	cd "$srcdir/$_pkgname"

	npm install --cache "${srcdir}/npm-cache"
	npm run build
}

package() {
	local _outpath='linux'
	if [ "$_electronbuilderarch" != 'x64' ]; then
		_outpath="$_outpath-$_electronbuilderarch"
	fi
	_outpath="$_outpath-unpacked"

	cd "$srcdir"
	install -Dm 644 bubblebuddy.desktop "$pkgdir"/usr/share/applications/bubblebuddy.desktop
	install -Dm 755 bubblebuddy.sh "$pkgdir"/usr/bin/bubblebuddy

	cd "$srcdir/$_pkgname"
	install -Dm 644 COPYING -t "$pkgdir"/usr/share/licenses/$_pkgname
	install -Dm 644 icon.png "$pkgdir"/usr/share/icons/bubblebuddy.png

	cd "$srcdir/$_pkgname/dist_electron"
	mkdir "$pkgdir"/usr/share/$_pkgname
	cp -R "$_outpath"/* "$pkgdir"/usr/share/$_pkgname
}
