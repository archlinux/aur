# Maintainer: Luís Ferreira <luis@aurorafoss.org>
# Contributor: Gonçalo Pereira <goncalo_pereira@outlook.pt>
# Contributor: Oskar Roesler <oskar@oskar-roesler.de>

pkgname='ros-catkin'
pkgdesc="Low-level build system macros and infrastructure for ROS."
url='http://www.ros.org/wiki/catkin'
pkgver='0.7.18'
arch=('any')
pkgrel=3
license=('BSD')

makedepends=(
	'cmake'
	'python-catkin'
	'python-empy'
	'python'
)

checkdepends=(
	'python-mock'
)

depends=(
	'python-nose'
	'gtest'
	'python-catkin'
	'python-empy'
	'gmock'
	'python'
	'ros-build-tools'
)

_dir="catkin-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros/catkin/archive/${pkgver}.tar.gz")
sha256sums=('b6a7428944911a011b0c3b0e465f2db04d219ce5f72cf3e2f76194dd055f1f49')

build() {
	# Use ROS environment variables.
	source /usr/share/ros-build-tools/clear-ros-env.sh
	[ -f /opt/ros/melodic/setup.bash ] && source /opt/ros/melodic/setup.bash

	# Create the build directory.
	[ -d ${srcdir}/build ] || mkdir ${srcdir}/build
	cd ${srcdir}/build

	# Fix Python2/Python3 conflicts.
	/usr/share/ros-build-tools/fix-python-scripts.sh -v 3 ${srcdir}/${_dir}

	# Build the project.
	cmake ${srcdir}/${_dir} \
		-DCMAKE_BUILD_TYPE=Release \
		-DCATKIN_BUILD_BINARY_PACKAGE=OFF \
		-DCMAKE_INSTALL_PREFIX=/usr/share/${pkgname} \
		-DPYTHON_EXECUTABLE=/usr/bin/python3 \
		-DPYTHON_INCLUDE_DIR=/usr/include/python3.7m \
		-DPYTHON_LIBRARY=/usr/lib/libpython3.7m.so \
		-DPYTHON_BASENAME=.cpython-37m \
		-DSETUPTOOLS_DEB_LAYOUT=OFF
	make
}

check() {
	cd ${srcdir}/${_dir}
	nosetests test/unit_tests test/local_tests
}

package() {
	cd "${srcdir}/build"
	make DESTDIR="${pkgdir}" install

	mv -f "${pkgdir}/usr/share/${pkgname}/etc" "${pkgdir}/etc"
	mv -f "${pkgdir}/usr/share/${pkgname}/bin" "${pkgdir}/usr/bin"
	mv -f "${pkgdir}/usr/share/${pkgname}/lib" "${pkgdir}/usr/lib"
	(cd "${pkgdir}/usr/share/${pkgname}/share" && tar c .) | (cd "${pkgdir}/usr/share" && tar xf -)
	rm -rf "${pkgdir}/usr/share/${pkgname}/share"

	install -Dm644 "${srcdir}/${_dir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
