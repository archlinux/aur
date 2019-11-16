# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - This stack provides Python bindings for Qt."
url='https://wiki.ros.org/python_qt_binding'

pkgname='ros-melodic-python-qt-binding'
pkgver='0.3.6'
arch=('any')
pkgrel=2
license=('BSD')

ros_makedepends=(
	ros-melodic-rosbuild
	ros-melodic-catkin
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
	python-pyqt5
	qt5-base
)

ros_depends=(
)

depends=(
	${ros_depends[@]}
	python-pyqt5
)

_dir="python_qt_binding-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-visualization/python_qt_binding/archive/${pkgver}.tar.gz"
        "69-shiboken-cmake.patch"::"https://github.com/ros-visualization/python_qt_binding/commit/274b1c775daa97ac040d01779d7bd89f5d4ee771.diff")
sha256sums=('b56b8b35f72b8543aab7903eb4e9d456991994a06032a08ba72ba627c6652e12'
            '0aff7f07a1cdb9b09bbf792c4d79e431c8f4a5ccdd2d5a34168dd0a81ad4beb7')

prepare() {
	cd ${srcdir}/${_dir}
	patch -p1 < "../69-shiboken-cmake.patch"
}

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
		-DCATKIN_BUILD_BINARY_PACKAGE=ON \
		-DCMAKE_INSTALL_PREFIX=/opt/ros/melodic \
		-DPYTHON_EXECUTABLE=/usr/bin/python3 \
		-DPYTHON_INCLUDE_DIR=/usr/include/python3.7m \
		-DPYTHON_LIBRARY=/usr/lib/libpython3.7m.so \
		-DPYTHON_BASENAME=.cpython-37m \
		-DSETUPTOOLS_DEB_LAYOUT=OFF
	make
}

package() {
	cd "${srcdir}/build"
	make DESTDIR="${pkgdir}/" install
}
