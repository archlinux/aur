pkgname=robwork
pkgver=1.2.2
pkgrel=1
pkgdesc="A collection of C++ libraries for simulation and control of robot systems"
arch=('x86_64')
url='http://www.robwork.org'
license=('APACHE')
depends=('xerces-c' 'boost' 'eigen' 'flann' 'vtk' 'qhull' 'qt5-base' 'assimp' 'fcl-git'
	'libccd' 'python' 'minizip' 'zlib' 'pqp')
makedepends=('cmake' 'boost' 'eigen' 'flann' 'vtk' 'qhull' 'qt5-base' 'assimp' 'fcl-git'
	'libccd' 'python' 'minizip' 'zlib' 'xerces-c' 'pqp')
optdepends=('lua')
source=("debian-pkg.tar.gz::https://nextcloud.sdu.dk/index.php/s/C9amCp9f2e5jNw7/download"
				"0001-fix-install-dir.patch")

sha256sums=('cd90e6513abe8d87526b283e95952a0db653988e2b97b35d7cd8111cd9391d39'
	'b36296131f82489d415d34134bb09063c329ccd45243e366ba6151771543a321')

prepare() {
	cd ${srcdir}/RobWork-debian-pkg
	patch --input=${srcdir}/0001-fix-install-dir.patch -p1
}

build() {
	cd ${srcdir}/RobWork-debian-pkg

	export pkgdir
	cmake -B${srcdir}/build \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr

	cmake --build ${srcdir}/build
}

package() {
	cmake --install ${srcdir}/build --prefix ${pkgdir}/usr
	sed -iE "s+${pkgdir}++g" ${pkgdir}/usr/share/**/cmake/RobWorkTargets-release.cmake
}

