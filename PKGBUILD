# Maintainer: Antoine Viallon <antoine@lesviallon.fr>

pkgname=eztrace2-git
_pkgname=eztrace
pkgdesc="Tool that automatically generates OTF2 execution traces from HPC programs"
pkgver=r1987.8a7647b0
pkgrel=3
url="https://gitlab.com/${_pkgname}/${_pkgname}/-/tree/eztrace-2.0"
license=(Custom:CeCILL-B)
source=(
    "git+https://gitlab.com/${_pkgname}/${_pkgname}#branch=eztrace-2.0"
)
arch=(x86_64 x86_64_v3)
makedepends=(git opari2)
sha1sums=('SKIP')

depends=(openmpi bash otf2)

pkgver () {
    cd "${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    find "${_pkgname}" -type f -name "CMakeLists.txt" -exec sed -i -- 's!DESTINATION cmake!DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake!g' "{}" \;

    cmake -E env LDFLAGS="${LDFLAGS}" \
	CXXFLAGS="${CXXFLAGS}" \
	CFLAGS="${CFLAGS} -DPACKAGE=eztrace -DPACKAGE_VERSION=1" \
	CPPFLAGS="${CPPFLAGS}" \
		cmake -B build \
			-DCMAKE_BUILD_TYPE=None \
			-DCMAKE_INSTALL_PREFIX=/usr \
			-DBUILD_SHARED_LIBS=ON \
			-DEZTRACE_ENABLE_POSIXIO=ON \
			-DEZTRACE_ENABLE_PTHREAD=ON \
			-DEZTRACE_ENABLE_MEMORY=ON \
			-DEZTRACE_ENABLE_OPENMP=ON \
			-DEZTRACE_ENABLE_MPI=ON \
			-Wno-dev \
			-S "${_pkgname}"
}


build() {
    cmake --build build
}

package() {
    make -C build "DESTDIR=${pkgdir}" install

    install -v -Dm644 "${srcdir}/${_pkgname}/COPYRIGHT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
