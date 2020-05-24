pkgdesc="ROS - qt_gui provides the infrastructure for an integrated graphical user interface based on Qt."
url='https://wiki.ros.org/qt_gui'

pkgname='ros-noetic-qt-gui'
pkgver='0.3.16'
arch=('any')
pkgrel=0
license=('BSD')

ros_makedepends=(
	ros-noetic-catkin
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
	python-pyqt5
	qt5-base
)

ros_depends=(
	ros-noetic-python-qt-binding
)

depends=(
	${ros_depends[@]}
	python-rospkg
	tango-icon-theme
)

_dir="qt_gui_core-${pkgver}/qt_gui"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-visualization/qt_gui_core/archive/${pkgver}.tar.gz")
sha256sums=('efa5ecf7ec22de606b3c0e039f43aacc2f2d79d74d7e17ecceecf2cafd22d128')

build() {
	# Use ROS environment variables.
	source /usr/share/ros-build-tools/clear-ros-env.sh
	[ -f /opt/ros/noetic/setup.bash ] && source /opt/ros/noetic/setup.bash

	# Create the build directory.
	[ -d ${srcdir}/build ] || mkdir ${srcdir}/build
	cd ${srcdir}/build

	# Build the project.
	cmake ${srcdir}/${_dir} \
		-DCATKIN_BUILD_BINARY_PACKAGE=ON \
		-DCMAKE_INSTALL_PREFIX=/opt/ros/noetic \
		-DPYTHON_EXECUTABLE=/usr/bin/python \
		-DSETUPTOOLS_DEB_LAYOUT=OFF
	make
}

package() {
	cd "${srcdir}/build"
	make DESTDIR="${pkgdir}/" install
}
