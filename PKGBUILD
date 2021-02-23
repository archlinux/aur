# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
_name=openvslam
pkgname=${_name}-git
pkgver=r474.9eb280a
pkgrel=1
pkgdesc="A Versatile Visual SLAM Framework"
arch=('x86_64')
url="https://github.com/xdspacelab/openvslam"
license=('BSD2')
depends=(
	'dbow2-openvslam-git'
	'eigen'
	'g2o'
	'intel-tbb'
	'metis'
	'openblas'
	'opencv'
	'openmp'
	'pangolin'
	'suitesparse'
	'yaml-cpp'
)
makedepends=(
	'cmake'
	'git'
)
provides=('openvslam')
source=(
	"${pkgname}-${pkgver}::git+https://github.com/xdspacelab/openvslam.git"
	"patch.diff"
)
sha256sums=('SKIP'
            '181eb52ad721b4770263474b7c90c7f0a24cc81977a2f6b48f936b2d0559a43e')

pkgver() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	# Fix build on gcc 10
	git apply "${srcdir}/patch.diff"

	[ ! -d build ] || rm -rf build
	mkdir build && cd build
	cmake .. \
		-DCMAKE_BUILD_TYPE:STRING='Release' \
		-DCMAKE_INSTALL_PREFIX:PATH='/usr' \
		-DCMAKE_CXX_FLAGS:STRING='-w' \
		-DUSE_PANGOLIN_VIEWER:BOOL=ON \
		-DINSTALL_PANGOLIN_VIEWER:BOOL=ON
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}/build"
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}/build"
	make DESTDIR="$pkgdir/" install

	cd "${srcdir}/${pkgname}-${pkgver}"
	install -D -m644 \
		"LICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

