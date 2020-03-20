_pkgname=etaler
pkgname=${_pkgname}-git
pkgver=0.1.5.23.gfcc88a9
pkgrel=1
pkgdesc='A flexable HTM (Hierarchical Temporal Memory) framework with full GPU support.'
arch=('i686' 'x86_64')
url='https://github.com/etaler/Etaler'
license=('BSD')

depends=('catch2' 'xtensor' 'intel-tbb')
makedepends=('git' 'cmake')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")

source=("git+https://github.com/${_pkgname}/${_pkgname}.git")
sha512sums=('SKIP')

pkgver() {
	cd "${srcdir}"/${_pkgname}
	git describe --long --tags 2>/dev/null | sed -r 's/^v//;s/-/./g'
}

prepare() {
	cd "${srcdir}/${_pkgname}"
	git submodule update --init
	# Cannot use the --recursive flag currently, as it is trying to check out
	# git@github.com:LiangliangNan/Easy3D.git
	mkdir -p "${srcdir}"/build
}

build() {
	cd "${srcdir}"/build
	cmake -DCMAKE_INSTALL_PREFIX=/usr ../${_pkgname}
	make -j8
}

package() {
	cd "${srcdir}"/build
	make DESTDIR="${pkgdir}" install
}
