# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=ots
pkgver=8.0.0
pkgrel=2
pkgdesc='OpenType fonts sanitiser. Supports TTF, WOFF, WOFF2 and other formats'
arch=(x86_64 i686)
url=https://github.com/khaledhosny/ots
license=(custom)
depends=(freetype2 libfreetype.so)
makedepends=(meson ninja)
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz"
        no-tests.patch)
sha512sums=('efe6f67e27856657e93ea6c678da83d4e5fd600d48408a2981933855cc4ee38f118b308a896000285a3c2fc123a64e414a9f05cf73db72401567b0bb916d3cad'
            'f061a37a8e940ca55489f308f3850a3a8a7e8ab04d7af600bef6645ae49586406eb3dd213f136236e8eec7c0384748a7f5ec8852e000ca45f99699dd974d21bb')

prepare () {
	cd "$pkgname-$pkgver"
	patch -p0 < "$srcdir/no-tests.patch"
}

build() {
	cd "$pkgname-$pkgver"
	arch-meson build -Dgraphite=true
	ninja -C build
}

package() {
	cd "$pkgname-$pkgver"
	DESTDIR="$pkgdir" ninja -C build install
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
