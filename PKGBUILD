# Maintainer: David Álvarez <davidalro at disroot dot org>
# This PKGBUILD was based on vite-git, by aviallon

pkgname=vite
pkgdesc="Trace explorer. Visualize execution traces in Pajé or OTF format, for debugging and profiling."
pkgver=1.4
pkgrel=1
url="https://solverstack.gitlabpages.inria.fr/vite/"
license=(custom)
source=(
	https://gitlab.inria.fr/solverstack/vite/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.bz2
	LICENSE::http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt
	vite.desktop.in
)
sha1sums=('75803a7ea237dfc961100d42410a3865f0eb9f99'
          'dbd6cd4e7899507a33be1f8bcc67a87e7cf61f8c'
          '7ead22ad4f2cf618a217a3dfbdf9312a5d288aa3')
arch=(x86_64)
depends=(qt5-base qt5-charts)

prepare() {
		cmake -B build \
			-DCMAKE_BUILD_TYPE=None \
			-DCMAKE_INSTALL_PREFIX=/usr \
			-DBUILD_SHARED_LIBS=ON \
			-DVITE_ENABLE_OTF2=OFF \
			-DCMAKE_POLICY_VERSION_MINIMUM=3.7 \
			-Wno-dev \
			-S "${pkgname}-v${pkgver}"
}

build() {
	sed -E "s/@PACKAGE_VERSION@/${pkgver}/ ; s/@PACKAGE_NAME@/${pkgname}/" "${srcdir}/vite.desktop.in" > "${srcdir}/vite.desktop"

	cmake --build build
}

package() {
	make -C build "DESTDIR=${pkgdir}" install

	install -v -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -v -Dm755 "${srcdir}/vite.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

	install -v -Dm644 "${srcdir}/${pkgname}-v${pkgver}/logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}

