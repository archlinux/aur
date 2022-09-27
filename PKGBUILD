# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Steven Honeyman <stevenhoneyman at gmail com>

pkgname=udis86
pkgver=1.7.2
pkgrel=3
pkgdesc="Minimalistic disassembler library"
arch=('x86_64')
url='https://github.com/vmt/udis86'
license=('BSD')
depends=('glibc')
makedepends=('python' 'python-sphinx')
provides=('libudis86.so=0-64')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "latest.patch::$url/compare/v$pkgver...56ff6c8.diff"
        "fix-python3-build.patch::$url/pull/133.diff")
sha256sums=('43567f7e12168943c5b5ffb3d3f5b7a33cb36328f8938a993458f3ded0ba5779'
            '1cd434338aa8356614fc6d72823604ad59e35a3a88dea7b0e27787a632254e01'
            '09ff274943c2f117da504e888d116c86adb752e9c96bc8ef3dffa3d55372a16f')

prepare() {
	cd "$pkgname-$pkgver"
	patch -p1 < "$srcdir/latest.patch"
	patch -p1 < "$srcdir/fix-python3-build.patch"
	./autogen.sh
}

build() {
	cd "$pkgname-$pkgver"
	./configure \
		--prefix=/usr \
		--with-python=/usr/bin/python \
		--enable-shared
	make
	sphinx-build -b man docs/manual docs/_build/man
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
	install -Dm644 docs/_build/man/udis86.1 -t "$pkgdir/usr/share/man/man1/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
