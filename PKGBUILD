# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - qt_gui_cpp provides the foundation for C++-bindings for qt_gui and creates bindings for every generator available."
url='http://ros.org/wiki/qt_gui_cpp'

pkgname='ros-melodic-qt-gui-cpp'
pkgver='0.3.11'
arch=('any')
pkgrel=3
license=('BSD')

ros_makedepends=(
	ros-melodic-python-qt-binding
	ros-melodic-cmake-modules
	ros-melodic-catkin
	ros-melodic-pluginlib
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
	tinyxml
	qt5-base
	pkg-config
)

ros_depends=(
	ros-melodic-qt-gui
	ros-melodic-pluginlib
)

depends=(
	${ros_depends[@]}
	tinyxml
)

_dir="qt_gui_core-${pkgver}/qt_gui_cpp"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-visualization/qt_gui_core/archive/${pkgver}.tar.gz")
sha256sums=('708873d6b5a2e4543435e8a1a2349de8eb41937aaf78b9dbcbe08b4a1dc12da2')

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

	make || {
	# Replace $$[QT_INSTALL_LIBS] with hardcoded /usr/lib/ for proper linking
	# Relevant issue:
	#  https://github.com/ros-melodic-arch/ros-melodic-qt-gui-cpp/issues/4
	sed -i 's/$$\[QT_INSTALL_LIBS\]/\/usr\/lib/' ${srcdir}/build/sip/qt_gui_cpp_sip/Makefile
	make
	}
}

package() {
	cd "${srcdir}/build"
	make DESTDIR="${pkgdir}/" install
}
