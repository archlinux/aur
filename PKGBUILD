pkgname=lcm-git
pkgver=20261030.r1602.8361043
pkgrel=1
pkgdesc="Lightweight Communications and Marshalling"
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
makedepends=(cmake java-environment)
source=($pkgname::git+https://github.com/lcm-proj/lcm.git)

sha512sums=(SKIP)

pkgver() {
	cd "$srcdir/$pkgname"

  printf "%s.r%s.%s" \
    "$(git show -s --format=%ci master | sed 's/\ .*//g;s/-//g')" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$pkgname"
	mkdir -p built
	cd built
	cmake -DLCM_ENABLE_JAVA=On -DCMAKE_INSTALL_PREFIX=/usr ..
	make
}

check() {
	cd "$srcdir/$pkgname/built"
	CTEST_OUTPUT_ON_FAILURE=1 make -k test
}

package() {
	cd "$srcdir/$pkgname/built"
	make DESTDIR="$pkgdir/" install
}
