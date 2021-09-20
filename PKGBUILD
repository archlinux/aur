# Maintainer: Antoine Viallon <antoine@lesviallon.fr>

_pkgname=hipify-clang
pkgname=${_pkgname}-git
pkgdesc="Clang-based tool for translating CUDA sources into HIP sources"
pkgver=r1415.a53fe40
pkgrel=1
arch=(x86_64)

_gitname=HIPIFY
source=(git+https://github.com/ROCm-Developer-Tools/${_gitname})
md5sums=('SKIP')
depends=(ncurses zlib rocm-dev)
makedepends=(git)
url="https://github.com/ROCm-Developer-Tools/HIPIFY"
license=(Custom)

pkgver() {
  cd "${_gitname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
	mkdir -p "${_gitname}/build"
	cd "${_gitname}/build"

	cmake -DCMAKE_INSTALL_PREFIX=/opt/rocm/hip/ -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH=/opt/rocm/ ..
}


build() {
	cd "${_gitname}/build"

	export MAKEFLAGS=${MAKEFLAGS:-j}
	cmake --build .
}

package() {
	cd "${_gitname}"
    builddir="${srcdir}/${_gitname}/build"

	cmake --build build --target install  -- DESTDIR=${pkgdir}

	install -Dm755 "${builddir}/hipify-clang" "${pkgdir}/opt/rocm/bin/hipify-clang"
	# --prefix=${pkgdir}/opt/rocm/hip
}
