# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
pkgname=scap-workbench
pkgver=1.2.1
pkgrel=2
pkgdesc="Security Content Automation Protocol GUI"
arch=('x86_64')
url='https://www.open-scap.org/tools/scap-workbench/'
license=('BSD')
depends=('asciidoc' 'openscap' 'openssh' 'qt5-base' 'qt5-xmlpatterns' 'scap-security-guide')
source=("https://github.com/OpenSCAP/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.bz2"
        "$pkgname.patch")
sha256sums=('d1508461d0e841cf8b8063877904b8b4bb0dae26c6c5370e47e0255157fdb84f'
            'SKIP')

prepare() {
	cd "$pkgname-$pkgver"
	patch -p1 -i "$srcdir/$pkgname.patch"
}

build() {
	cd "$pkgname-$pkgver"
	mkdir -p build
	cd build
	cmake \
		--install-prefix=/usr \
		-DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
		-DCMAKE_CXX_FLAGS='-std=c++11 -Wno-error=c++20-compat -Wno-error=range-loop-construct -Wno-error=deprecated-declarations' \
		..
	make
}

package() {
	cd "$pkgname-$pkgver/build"
	make DESTDIR="$pkgdir/" install
}
