pkgdesc="ROS - qt_gui provides the infrastructure for an integrated graphical user interface based on Qt."
url='https://wiki.ros.org/qt_gui'

pkgname='ros-melodic-qt-gui'
pkgver='0.4.2'
arch=('any')
pkgrel=2
license=('BSD')

ros_makedepends=(
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
	ros-melodic-python-qt-binding
)

depends=(
	${ros_depends[@]}
	python-rospkg
	tango-icon-theme
)

_dir="qt_gui_core-${pkgver}/qt_gui"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-visualization/qt_gui_core/archive/${pkgver}.tar.gz")
sha256sums=('fbc5a7b0a4da43f80e9216845aec2e247fac0a63512053c03a9f89024d026aad')

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
		-DSETUPTOOLS_DEB_LAYOUT=OFF
	make
}

package() {
	cd "${srcdir}/build"
	make DESTDIR="${pkgdir}/" install
}
