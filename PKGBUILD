# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>
# Maintainer: duzda <duzda@disroot.org>

_electronversion=37
_electron=electron$_electronversion
pkgname=deezer-enhanced
pkgver=1.5.1
pkgrel=1
pkgdesc='An unofficial application for Deezer with enhanced features'
arch=(any)
url=https://github.com/duzda/deezer-enhanced
license=(MIT)
depends=("$_electron")
makedepends=(npm)
options=('!debug')
source=("$url/archive/v$pkgver.tar.gz"
	"$pkgname.sh"
	"$pkgname.desktop")
sha512sums=('843971e70d961ee024708882c1468a2063e20fb65af7364de2573bd3f0e525fa35ae78b53e7151a5f87ba8e69dcbebc7627413ecca1cdb5078e669e0e9d0962d'
	'a1a21687ca383db424566c97a3cd2439e9ca8165982845edbb151957f2015efb0e9ba427a0269b4144dab4923fb65abe1ba91b9dd1434428b9d73a63f7fadb7d'
	'1ece0a5434f13119ff834834a190b7a2de185b78370d07ba21b3019c8c3939e0e61a8ad96148fbf4e95bf401fa611dc7a0d8f5e86824fe812a4290dc7539d85a')

prepare() {
	sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%}/g
        s/@cfgdirname@/${pkgname%}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%}.sh"
}

build() {
	cd "$pkgname-$pkgver"

	npm i && npm run package
	rm -rf out
}

package() {
	cd "$pkgname-$pkgver"

	_appdir="/usr/lib/$pkgname"
	install -d "$pkgdir/usr/lib/$pkgname"
	cp -r . "$pkgdir/usr/lib/$pkgname"

	install -Dm644 build/icon.png "$pkgdir/usr/share/pixmaps/$pkgname.png"

	install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname.sh"
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
