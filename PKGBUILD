# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>
# Maintainer: duzda <duzda@disroot.org>

_electron=electron
pkgname=deezer-enhanced
pkgver=1.0.0
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
sha512sums=('6e170a966c2df3df7477f1b3fd887783b54980faa2ab419b0e644902194128fd7cea2d39dd3e45bff178e58827c76d2f422a78719d142300e410dc33ed5bd401'
            'e359569fbd9767a7276cb754010d8bf4dcd35fd958bbc3c50baa042bceebc132a10e302810821e77d730873efa5511bccbcf89d18f146a29e1e94a5a96a1ba0f'
			'85d840ce42be46fadc24652f9fcafd11e2ef2fbaf5ce1f831bc10570d70839582000f4c0394362d6464534f18ed1b0705de574eaf30db3da419906546c18ee62')

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

	install -Dm755 "$srcdir/$pkgname.js" "$pkgdir/usr/bin/$pkgname"
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
