# Maintainer: Antoine Viallon <antoine@lesviallon.fr>

_pkgname=vite
pkgname=vite-git
pkgdesc="Trace explorer. Visualize execution traces in Pajé or OTF format, for debugging and profiling."
pkgver=r1166.442cf13
pkgrel=1
url="https://solverstack.gitlabpages.inria.fr/vite/"
license=(custom)
source=(
	git+https://gitlab.inria.fr/solverstack/${_pkgname}.git
	LICENSE::http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt
)
sha1sums=('SKIP'
          'dbd6cd4e7899507a33be1f8bcc67a87e7cf61f8c')
arch=(x86_64 x86_64_v3)
makedepends=(glm qt5-tools qt5-base git)
depends=(glew qt5-svg qt5-charts)

pkgver() {
  cd "${_pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
	cmake -E env LDFLAGS="${LDFLAGS}" \
		cmake -B build \
			-DCMAKE_BUILD_TYPE=None \
			-DCMAKE_INSTALL_PREFIX=/usr \
			-DGLM_INC=/usr/include \
			-Wno-dev \
			-S "${_pkgname}"
}

build() {
	cmake --build build
}

package() {
	make -C build "DESTDIR=${pkgdir}" install

	install -v -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

