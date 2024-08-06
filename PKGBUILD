# Maintainer: tmms

pkgname='fatrop-git'
pkgver=0.0.3.r0.g0e05fec
pkgrel=1
pkgdesc="Fatrop is a constrained nonlinear optimal control problem solver that is fast and achieves a high numerical robustness"
arch=('i686' 'x86_64')
url="https://github.com/meco-group/fatrop"
license=('LGPL-3.0-only')
depends=('blasfeo')
optdepends=('casadi' 'pybind11')
makedepends=('git' 'cmake')
provides=("fatrop")

source=("git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	printf "%s" "$(git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}

build() {
	cmake -B "build-$pkgver" -S "${pkgname%-git}" \
			-DCMAKE_INSTALL_PREFIX=/usr \
			-DBUILD_WITH_BLASFEO=OFF \
			-DBLASFEO_INSTALL_DIR=/usr/ \
			-Wno-dev
			cmake --build "build-$pkgver" -- -j $(($(nproc)-1))
}

package() {
	DESTDIR="$pkgdir/" cmake --install "build-$pkgver"
	install -Dm644 "${pkgname%-git}/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
