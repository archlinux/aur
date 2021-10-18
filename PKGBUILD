# Maintainer: Antoine Viallon <antoine@lesviallon.fr>

_pkgname=vite
pkgname=vite-git
pkgdesc="Trace explorer. Visualize execution traces in Pajé or OTF format, for debugging and profiling."
pkgver=r1166.442cf13
pkgrel=2
url="https://solverstack.gitlabpages.inria.fr/vite/"
license=(custom)
source=(
	git+https://gitlab.inria.fr/solverstack/${_pkgname}.git
	LICENSE::http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt
	vite.desktop.in
)
sha1sums=('SKIP'
          'dbd6cd4e7899507a33be1f8bcc67a87e7cf61f8c'
          '7ead22ad4f2cf618a217a3dfbdf9312a5d288aa3')
arch=(x86_64 x86_64_v3)
makedepends=(glm qt5-tools qt5-base git otf2)

depends=(glew qt5-svg qt5-charts)
# depends=(qt5-svg qt5-charts vulkan-icd-loader)

pkgver() {
  cd "${_pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
	cmake -E env LDFLAGS="${LDFLAGS}" \
	CXXFLAGS="${CXXFLAGS}" \
	CFLAGS="${CFLAGS}" \
	CPPFLAGS="${CPPFLAGS}" \
		cmake -B build \
			-DCMAKE_BUILD_TYPE=None \
			-DCMAKE_INSTALL_PREFIX=/usr \
			-DBUILD_SHARED_LIBS=ON \
			-DGLM_INC=/usr/include \
			-DVITE_ENABLE_OTF=OFF \
			-DVITE_ENABLE_OTF2=ON \
			-Wno-dev \
			-S "${_pkgname}"

# If vulkan:
#			-DUSE_VULKAN=ON \


}

build() {
	sed -E "s/@PACKAGE_VERSION@/${pkgver}/ ; s/@PACKAGE_NAME@/${pkgname}/" "${srcdir}/vite.desktop.in" > "${srcdir}/vite.desktop"

	cmake --build build
}

package() {
	make -C build "DESTDIR=${pkgdir}" install

	install -v -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -v -Dm755 "${srcdir}/vite.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

	install -v -Dm644 "${srcdir}/${_pkgname}/logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}

