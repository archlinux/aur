# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=ots
pkgver=8.1.1
pkgrel=1
pkgdesc='OpenType fonts sanitiser. Supports TTF, WOFF, WOFF2 and other formats'
arch=(x86_64 i686)
url=https://github.com/khaledhosny/ots
license=(custom)
depends=(freetype2 libfreetype.so)
makedepends=(meson ninja gtest)
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz"
        use-system-gtest.patch)
sha512sums=('00bb7337ccabd95ceb2d1baa96ae51fa9f6660acfdceb7d2d070000c373bb513d7544904e10ed5851073b917c496e89d33b9da1062dc3cbc7ad02b0acfb83cd2'
            'a8e06db16a17f0c2851628cc970b828a2c6df786ed553381906e80f286e2651fd56acf3253156041850a1aeedcaeaf20840db738cf96e0e1582176dbdf3300f2')

prepare () {
	cd "$pkgname-$pkgver"
	patch -p0 < "$srcdir/use-system-gtest.patch"
}

build() {
	cd "$pkgname-$pkgver"
	arch-meson build -Dgraphite=true
	ninja -C build
}

check () {
	meson test -C "$pkgname-$pkgver/build"
}

package() {
	cd "$pkgname-$pkgver"
	DESTDIR="$pkgdir" ninja -C build install
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
