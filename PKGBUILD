# Maintainer: Antoine Viallon <antoine@lesviallon.fr>

_pkgname=vite
pkgname=vite-git
pkgdesc="Trace explorer. Visualize execution traces in Pajé or OTF format, for debugging and profiling."
pkgver=r1166.442cf13
pkgrel=1
url="https://solverstack.gitlabpages.inria.fr/vite/"
license=(custom)
source=(git+https://gitlab.inria.fr/solverstack/${_pkgname}.git)
sha1sums=(SKIP)
arch=(x86_64 x86_64_v3)
makedepends=(glm qt5-charts qt5-svg qt5-tools qt5-base glew git)

pkgver() {
  cd "${_pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
	mkdir -p "${srcdir}/${_pkgname}/build"
	cd "${srcdir}/${_pkgname}/build"

	cmake \
			-DCMAKE_BUILD_TYPE=Release \
			-DCMAKE_INSTALL_PREFIX=/usr \
			-DGLM_INC=/usr/include \
			..
}

build() {
	cd "${srcdir}/${_pkgname}/build"

	cmake --build .
}

package() {
	cd "${srcdir}/${_pkgname}/build"

	make "DESTDIR=${pkgdir}" install
}

