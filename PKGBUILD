# Maintainer: tmms

pkgname='casadi-git'
pkgver=3.6.6.r0.g279e0b8
pkgrel=2
pkgdesc="Symbolic framework for automatic differentiation and numeric optimization"
arch=('i686' 'x86_64')
url="https://github.com/casadi/casadi"
license=('LGPL-3.0-only')
depends=('python' 'lapack' 'swig' 'python-numpy' 'coin-or-ipopt' 'coin-or-qpoases' 'osqp' 'tinyxml2')
optdepends=('fatrop' 'dsdp' 'proxsuite'  'python-scipy' 'python-matplotlib' 'ipython')
makedepends=('git' 'cmake' 'python-setuptools')
url="https://github.com/casadi/casadi"
conflicts=("casadi" "python-casadi-bin")
provides=("casadi")

source=("git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g')"
}

build() {
	cmake -B "build-$pkgver" -S "${pkgname%-git}" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DWITH_PYTHON=ON \
		-DWITH_PYTHON3=ON \
		-DENABLE_EXPORT_ALL=ON \
		-DWITH_OPENMP=ON \
		-DWITH_THREAD=ON \
		-DWITH_SUNDIALS=OFF \
		-DWITH_OSQP=ON \
		-DWITH_QPOASES=ON \
		-DWITH_LAPACK=ON \
		-DWITH_IPOPT=ON \
		-DWITH_TINYXML=ON \
		-DWITH_BUILD_TINYXML=OFF \
		-Wno-dev
		cmake --build "build-$pkgver" -- -j $(($(nproc)-1))
}

package() {
	DESTDIR="$pkgdir/" cmake --install "build-$pkgver"
	install -Dm644 "${pkgname%-git}/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
