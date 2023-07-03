# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>
# Maintainer: duzda <duzda@disroot.org>

_electron=electron
pkgname=deezer-enhanced
pkgver=0.3.3
pkgrel=1
pkgdesc='An unofficial application for Deezer with enhanced features'
arch=(any)
url=https://github.com/duzda/deezer-enhanced
license=(MIT)
depends=("$_electron")
makedepends=(yarn)
source=("$url/archive/v$pkgver.tar.gz"
        "$pkgname.js"
				"$pkgname.desktop")
sha512sums=('ff1821c93eb4e307c7eef8bd8ad77aa9a2c7537d7329f19cf887fdd9e2a6cc09b5dc7b576c9ff4f693a3e66e5b2c0df842477a8b67c8ecf3276f40cdc10656ea'
            'e359569fbd9767a7276cb754010d8bf4dcd35fd958bbc3c50baa042bceebc132a10e302810821e77d730873efa5511bccbcf89d18f146a29e1e94a5a96a1ba0f'
            '02deef321066e1b2decce7d35d483a8e88df52d032ddfef9a6b28f8a5fd006d1316dff54f70d8f6b53499e51fc4b4f3d231482b70cdbf6bfc3c57dbfedfe4f22')

build() {
	cd "$pkgname-$pkgver"

	yarn --ignore-scripts --production && yarn minify-webcss
	sed -i "s~@ELECTRON@~$_electron~" "$srcdir/$pkgname.js"
}

package() {
	cd "$pkgname-$pkgver"

	_appdir="/usr/lib/$pkgname"
	install -d "$pkgdir$_appdir"
	cp -r * "$pkgdir$_appdir"

	install -Dm644 build/icon.png "$pkgdir/usr/share/pixmaps/$pkgname.png"

	install -Dm755 "$srcdir/$pkgname.js" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "$srcdir/$pkgname.desktop" -t "$pkgdir/usr/share/applications"

	install -d "$pkgdir/usr/share/licenses/$pkgname"
	ln -s "$(realpath -m --relative-to=/usr/share/licenses/$pkgname $_appdir/LICENSE)" "$pkgdir/usr/share/licenses/$pkgname"

	rm -r "$pkgdir$_appdir/build"
	find "$pkgdir$_appdir" \
		-name "package.json" \
			-exec sed -e "s|${srcdir}/${pkgname}|${appdir}|" \
				-i {} \; \
		-or -name ".*" -prune -exec rm -r '{}' \; \
		-or -name "bin" -prune -exec rm -r '{}' \; \
		-or -name "example" -prune -exec rm -r '{}' \; \
		-or -name "examples" -prune -exec rm -r '{}' \; \
		-or -name "man" -prune -exec rm -r '{}' \; \
		-or -name "scripts" -prune -exec rm -r '{}' \; \
		-or -name "test" -prune -exec rm -r '{}' \;
}
