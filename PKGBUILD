# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=nvtop-git
pkgver=1.0.0.r7.gf4ae139
pkgrel=1
pkgdesc="A (h)top like task monitor for NVIDIA GPUs"
arch=('x86_64')
url="https://github.com/Syllo/nvtop"
license=('GPL3')
depends=('nvidia-utils' 'ncurses')
makedepends=('cmake' 'cuda')
provides=('nvtop')
conflicts=('nvtop')
source=("${pkgname}::git+https://github.com/Syllo/nvtop.git")
sha256sums=('SKIP')

pkgver() {
	cd "${pkgname}"

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${pkgname}"

	mkdir -p build

    cmake . -Wno-dev -DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release -B build
	make -C build
}

package() {
	cd "${srcdir}/${pkgname}"

    make -C build DESTDIR="$pkgdir/" install

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
