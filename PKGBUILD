# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

_electron=electron12
_appname=Codex
pkgname=codex
pkgver=1.4.1
pkgrel=1
pkgdesc='A free note-taking software for programmers and Computer Science students'
arch=(any)
url=https://github.com/jcv8000/Codex
license=('custom')
depends=("$_electron")
makedepends=(npm)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "codex.desktop"
				"codex.js")
sha256sums=('bbfafe111a4ff64acd9bf89e1ce82af3d41dedf77fd2961c974371c330198b31'
            'f812f32951d88d068fd21b6b336894ceb1c72e9a861262907525234c16cfdc13'
            'ffd97839392f7a09d22d47c0b3b000abf1061f8d4208ee4e8b93e3f200828c17')

prepare() {
	sed -i "s~@ELECTRON@~$_electron~" "$pkgname.js"
}

build() {
	cd "$_appname-$pkgver"
	npm install --ignore-scripts --production
}

package() {
	cd "$_appname-$pkgver"

	appdir="/usr/lib/$pkgname"

	install -d "$pkgdir$appdir"
	cp -r * "$pkgdir$appdir"

	install -Dm644 img/logo512.png "$pkgdir/usr/share/pixmaps/$pkgname.png"

	install -Dm755 "$srcdir/$pkgname.js" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

	install -Dm755 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	# Clean up
	find "$pkgdir$appdir" \
		-name "package.json" \
			-exec sed -e "s~$srcdir/$pkgname-$pkgver~$appdir~" \
				-i {} \; \
		-or -name ".*" -prune -exec rm -r '{}' \; \
		-or -name "bin" -prune -exec rm -r '{}' \; \
		-or -name "example" -prune -exec rm -r '{}' \; \
		-or -name "examples" -prune -exec rm -r '{}' \; \
		-or -name "man" -prune -exec rm -r '{}' \; \
		-or -name "scripts" -prune -exec rm -r '{}' \; \
		-or -name "test" -prune -exec rm -r '{}' \;
}
