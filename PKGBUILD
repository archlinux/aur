# Maintainer: tmms

pkgname='acados-git'
pkgver=0.3.5.r7.gf0f474c
pkgrel=1
pkgdesc="Fast and embedded solvers for nonlinear optimal control"
arch=('i686' 'x86_64')
url="https://github.com/acados/acados"
license=('BSD-2-Clause')
depends=()
optdepends=('casadi' 'coin-or-qpoases' 'osqp')
makedepends=('git' 'cmake')
provides=('acados')

source=("git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}

prepare() {
	if [ ! -e ./${pkgname%-git} ]
	then
		git clone ${url}.git -b master ${pkgname%-git}
	fi

	cd ${pkgname%-git}
	git pull origin master
	git submodule update --init external/blasfeo
	git submodule update --init external/hpipm
}

build() {
	cmake -B "build-$pkgver" -S "${pkgname%-git}" \
		-DACADOS_INSTALL_DIR=/usr \
		-DACADOS_WITH_OSQP=OFF \
		-DACADOS_WITH_QPOASES=OFF \
		-DCMAKE_C_FLAGS="-D_POSIX_C_SOURCE=200112L" \
		-DCMAKE_BUILD_TYPE="Release"
	cmake --build "build-$pkgver" -- -j $(($(nproc)-1))
}

package() {
	DESTDIR="$pkgdir/" cmake --install "build-$pkgver"
	install -Dm644 "${pkgname%-git}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
