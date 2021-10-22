# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

_electron=electron14
pkgname=deezer-enhanced
pkgver=0.1.0
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
sha512sums=('03a099bfc0fe9f0404be864b18fd137d957b3a2ef8fa92312fed11ac142b07a5acfdfa19a269d36c42ae6b33e7b1b1f991026ae31e1f24929d7e5a61a49a2579'
            '11275cdfdd6d6224fb4eeadb231edd762317b0c47e99f8858a9eeaa61726a01fb3ae5ae852e15e1b9e7a4dfe08b0bc4466c1d9b659941f87f1508b9dc4fca16a'
            '02deef321066e1b2decce7d35d483a8e88df52d032ddfef9a6b28f8a5fd006d1316dff54f70d8f6b53499e51fc4b4f3d231482b70cdbf6bfc3c57dbfedfe4f22')

build() {
	cd "$pkgname-$pkgver"

	yarn --ignore-scripts --production
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
