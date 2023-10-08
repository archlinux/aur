# Maintainer: John Troxler <firstname dot lastname at gmail dot com>
# Co-Maintainer: Martin Rys <https://rys.pw/contact>

pkgname=loot
pkgver=0.22.0
_pkglibver=0.22.1
pkgrel=1
pkgdesc="A load order optimisation tool for the Elder Scrolls (Morrowind and later) and Fallout (3 and later) games."
arch=('x86_64')
url="https://loot.github.io"
license=('GPL3')
depends=('boost-libs' 'libssh2' 'alsa-lib' 'nss' 'pango' 'atk' 'libxdamage' 'libxcomposite' 'libxcursor' 'libxrandr' 'libxss' 'libxtst' 'qt6-base')
makedepends=('git' 'cmake' 'rust' 'cbindgen' 'boost' 'onetbb')
source=("$pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/$pkgver.tar.gz"
        "lib$pkgname-$_pkglibver.tar.gz::https://github.com/$pkgname/lib$pkgname/archive/$_pkglibver.tar.gz"
        'LOOT.desktop'
)
sha256sums=('742666e11cffdfa523b95bd1e3c7bad3392e4f105d660eebf8f791bb81d21c5e'
            '43a2dac9463b8cc532787e6177fb056bdae73b14a611f743724191d0120f8aa9'
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
