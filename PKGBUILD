# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>
# Maintainer: duzda <duzda@disroot.org>

_electron=electron37
pkgname=deezer-enhanced
pkgver=1.4.1
pkgrel=1
pkgdesc='An unofficial application for Deezer with enhanced features'
arch=(any)
url=https://github.com/duzda/deezer-enhanced
license=(MIT)
depends=("$_electron")
makedepends=(npm)
options=('!debug')
source=("$url/archive/v$pkgver.tar.gz"
        "$pkgname.js"
		"$pkgname.desktop")
sha512sums=('3071e77d0ae3ad1436f5be9fff30dd6d28f5aa7ddb3d4acd19d4b89f11f496f7db8e0eca8a2e5d6a69289199962f75e096a683631227446979f442e3c6467ff2'
            'e359569fbd9767a7276cb754010d8bf4dcd35fd958bbc3c50baa042bceebc132a10e302810821e77d730873efa5511bccbcf89d18f146a29e1e94a5a96a1ba0f'
			'29a213a0c1e70861afb1ca6771b716803edc97334ac1f002ceda01db1dd11fdf22a33720c74ee1cd77ffb5e6c20dd2465269a00fabc71ae26f1f5e79398b122b')

build() {
	cd "$pkgname-$pkgver"

	npm i && npm run package
	rm -rf out
	sed -i "s~@ELECTRON@~$_electron~" "$srcdir/$pkgname.js"
}

package() {
	cd "$pkgname-$pkgver"

	_appdir="/usr/lib/$pkgname"
	install -d "$pkgdir/usr/lib/$pkgname"
	cp -r . "$pkgdir/usr/lib/$pkgname"

	install -Dm644 build/icon.png "$pkgdir/usr/share/pixmaps/$pkgname.png"

	install -Dm755 "$srcdir/$pkgname.js" "$pkgdir/usr/bin/$pkgname.js"
	install -Dm644 "$srcdir/$pkgname.desktop" -t "$pkgdir/usr/share/applications"

	install -d "$pkgdir/usr/share/licenses/$pkgname"
	ln -s "$(realpath -m --relative-to=/usr/share/licenses/$pkgname $_appdir/LICENSE)" "$pkgdir/usr/share/licenses/$pkgname"

	find "$pkgdir$_appdir" \
		-name "package.json" \
			-exec sed -e "s|${srcdir}/${pkgname}|${appdir}|" \
				-i {} \; \
		-or -name "bin" -prune -exec rm -r '{}' \; \
		-or -name "example" -prune -exec rm -r '{}' \; \
		-or -name "examples" -prune -exec rm -r '{}' \; \
		-or -name "man" -prune -exec rm -r '{}' \; \
		-or -name "scripts" -prune -exec rm -r '{}' \; \
		-or -name "test" -prune -exec rm -r '{}' \;
}
