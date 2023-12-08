# Maintainer: John Troxler <firstname dot lastname at gmail dot com>
# Co-Maintainer: Martin Rys <https://rys.pw/contact>

pkgname=loot
# https://github.com/loot/loot/releases
pkgver=0.22.3
# https://github.com/loot/libloot/releases
_pkglibver=0.22.3
pkgrel=1
pkgdesc="A load order optimisation tool for the Elder Scrolls (Morrowind and later) and Fallout (3 and later) games."
arch=('x86_64')
url="https://loot.github.io"
license=('GPL3')
depends=('boost-libs' 'libssh2' 'alsa-lib' 'nss' 'pango' 'atk' 'libxdamage' 'libxcomposite' 'libxcursor' 'libxrandr' 'libxss' 'libxtst' 'qt6-base' 'hicolor-icon-theme' 'onetbb')
makedepends=('git' 'cmake' 'rust' 'cbindgen' 'boost')
source=("$pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/$pkgver.tar.gz"
        "lib$pkgname-$_pkglibver.tar.gz::https://github.com/$pkgname/lib$pkgname/archive/$_pkglibver.tar.gz"
        'LOOT.desktop'
)
sha256sums=('1b6581cc88f2cfa70c0844f9ea562a45eb1bd033c66c6a5f9e4f828fde959ca8'
            '16fee154d3d630fba4f7f3d0f7ce07af93e18ce2827fa66279299e1b932cb5c0'
            '3dd063fdbe33dc82a4298bd5bcd3b4e7490adab4128389c153d12c6b074b27fb'
)

build() {
	# libloot
	cd "$srcdir/lib$pkgname-$_pkglibver"
	mkdir -p build
	cd build
	cmake .. -DCMAKE_SKIP_RPATH=TRUE
	make loot

	mkdir -p pkg
	cp lib$pkgname.so ./pkg/
	cp -r ../include/ ./pkg/
	tar -zcf lib$pkgname-$_pkglibver.tar.gz ./pkg/

	# loot
	cd "$srcdir/$pkgname-$pkgver"

	mkdir -p build
	cd build
	cmake .. -DLIBLOOT_URL="$srcdir/lib$pkgname-$_pkglibver/build/lib$pkgname-$_pkglibver.tar.gz" \
		-DCMAKE_BUILD_WITH_INSTALL_RPATH=TRUE -DCMAKE_INSTALL_RPATH="/opt/$pkgname"
	make LOOT
}

package() {
	_builddir="$srcdir/$pkgname-$pkgver/build"

	install -Dm755 -t "$pkgdir/opt/$pkgname" \
		"$_builddir/LOOT" \
		"$_builddir/lib$pkgname.so"

	mkdir -p "$pkgdir/usr/bin"
	ln -s "/opt/$pkgname/LOOT" "$pkgdir/usr/bin"

	# Install the icon
	install -Dm644 "${_builddir}/../resources/icons/loot.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/loot.svg"
	# Install desktop entry
	install -Dm644 "${srcdir}/LOOT.desktop" "${pkgdir}/usr/share/applications/LOOT.desktop"
}
