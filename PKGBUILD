# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
pkgname=scap-workbench-git
pkgver=1.2.1.r67.10c1929
pkgrel=2
pkgdesc='Security Content Automation Protocol GUI'
arch=('x86_64')
url='https://www.open-scap.org/tools/scap-workbench/'
license=('BSD')
depends=('asciidoc' 'openscap' 'openssh' 'qt5-base' 'qt5-xmlpatterns' 'scap-security-guide')
makedepends=('git')
provides=('scap-workbench')
conflicts=('scap-workbench')
source=('git+https://github.com/OpenSCAP/scap-workbench.git'
        "$pkgname.patch")
sha256sums=('SKIP'
            'SKIP')

prepare() {
	cd scap-workbench
	patch -p1 -i "$srcdir/$pkgname.patch"
}

pkgver() {
	cd scap-workbench
	printf "%s" "$(git describe --tags --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd scap-workbench
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
	cd scap-workbench/build
	make DESTDIR="$pkgdir/" install
}
