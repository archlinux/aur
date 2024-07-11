pkgname=lcm-git
pkgver=20240627.r1424.64e149f
pkgrel=1
pkgdesc="Lightweight real-time networking library (git version of lcm)"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/lcm-proj/lcm"
license=('LGPL')
depends=('glib2')
provides=(lcm)
conflicts=(lcm)
optdepends=(
	'java-environment: support for lcm-spy and other GUI tools'
	'ttf-dejavu: support for lcm-spy and other GUI tools'
)
makedepends=(cmake)
source=($pkgname-$pkgver::git+https://github.com/lcm-proj/lcm.git)

sha512sums=(SKIP)

pkgver() {
	cd "$srcdir/$pkgname-$pkgver"

  printf "%s.r%s.%s" \
    "$(git show -s --format=%ci master | sed 's/\ .*//g;s/-//g')" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}


build() {
	cd "$srcdir/$pkgname-$pkgver"
	mkdir -p built
	cd built
	cmake -DCMAKE_INSTALL_PREFIX=/usr ..
	make
}

check() {
	cd "$srcdir/$pkgname-$pkgver/built"
	CTEST_OUTPUT_ON_FAILURE=1 make -k test
}

package() {
	cd "$srcdir/$pkgname-$pkgver/built"
	make DESTDIR="$pkgdir/" install
}
