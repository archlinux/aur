# Maintainer: William Gathoye <william + aur at gathoye dot be>
# Contributor: Michal Malek <michalm@fastmail.fm>
# Contributor: Sharif Olorin <sio@tesser.org>

pkgname=orthanc
pkgver=1.5.8
pkgrel=1
pkgdesc='Open-source, lightweight DICOM server.'
arch=('x86_64' 'i686')
url='http://orthanc-server.com/'
license=('GPL3')

depends=(
    'boost-libs' 'curl' 'dcmtk' 'jsoncpp' 'libjpeg-turbo' 'lua' 'pugixml' 'sqlite'
)
makedepends=(
    'boost' 'cmake' 'doxygen' 'gtest' 'make' 'python' 'unzip'
)
source=(
    "https://www.orthanc-server.com/downloads/get.php?path=/orthanc/Orthanc-${pkgver}.tar.gz"
)
sha512sums=(
    '9610526cff59e2061e16728d7ce78a80dd8803371ac80be561349476bac011ad2200b1e144df13b4e94174a90591ed8a1a0c258c98122f934ce4e70b320568e5'
)

build() {
	cmake \
		-DALLOW_DOWNLOADS=ON \
        -DUSE_SYSTEM_CIVETWEB=OFF \
        -DBoost_NO_BOOST_CMAKE=ON \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-H"${srcdir}"/Orthanc-"${pkgver}" \
		-B"${srcdir}"/build

	cmake --build "${srcdir}"/build
	cmake --build "${srcdir}"/build --target doc
}

check() {
	cd "${srcdir}"/build
	./UnitTests
}

package() {
	cmake --build "${srcdir}"/build --target install -- DESTDIR="${pkgdir}"
	mkdir -p ${pkgdir}/usr/bin
	mv "${pkgdir}"/usr/sbin/* ${pkgdir}/usr/bin
	rmdir "${pkgdir}"/usr/sbin
}
