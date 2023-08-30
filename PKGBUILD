# Maintainer: Petr Spacek <arch@petr.spackovi.net>
pkgname='ubpm-git'
pkgver=1.8.0.r6.f0deede
pkgrel=2
pkgdesc="Universal Blood Pressure Manager"
arch=(x86_64)
url="https://codeberg.org/LazyT/ubpm"
license=('GPL3')
makedepends=('git' 'qt6-base' 'qt6-charts' 'qt6-connectivity' 'qt6-serialport' 'qt6-tools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('debug')
source=('git+https://codeberg.org/LazyT/ubpm.git' 'install-to-opt.patch')
sha256sums=('SKIP' '3162370edbc613a54bb25a89ac6f51d2ab68aa1bb927453257e385390e750de5')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --tags --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	# hack to workaround https://codeberg.org/LazyT/ubpm/issues/45
	patch --directory="${srcdir}//${pkgname%-git}" --forward --strip=1 --input="${srcdir}/install-to-opt.patch"
}

build() {
	cd "$srcdir/${pkgname%-git}/sources"
	qmake6
	make
}

package() {
	cd "$srcdir/${pkgname%-git}/sources"
	make INSTALL_ROOT="$pkgdir/" install
	mkdir -p "$pkgdir/usr/bin"
	ln -s -v "/opt/ubpm/usr/bin/ubpm" "$pkgdir/usr/bin/ubpm"
}
