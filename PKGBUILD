# Maintainer: Matthew T Hoare <matthew.t.hoare dot gmail at com>

pkgname=tungsten-renderer-git
_pkgname=tungsten
pkgver=r963.deaf069
pkgrel=1
pkgdesc='High performance physically based renderer'
arch=('x86_64')
url="https://github.com/tunabrain/${_pkgname}"
license=('GPL')
makedepends=('gcc<8.1.0-1' 'cmake' 'git')
conflicts=('tungsten-renderer')
provides=('tungsten-renderer')
source=("${_pkgname}::git+https://github.com/tunabrain/tungsten#branch=master")
sha512sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
 	cd "${_pkgname}"
	sed -i '/cmake/ s/$/ -DCMAKE_INSTALL_PREFIX=\/usr/' setup_builds.sh
}

build() {
	cd "${_pkgname}"
	./setup_builds.sh
	cd build/release
	make
}

package() {
	cd "${_pkgname}/build/release"
	make DESTDIR="${pkgdir}" install
}
