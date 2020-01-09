pkgdesc="ROS - rqt_image_view provides a GUI plugin for displaying images using image_transport."
url='https://wiki.ros.org/rqt_image_view'

pkgname='ros-melodic-rqt-image-view'
pkgver='0.4.13'
arch=('any')
pkgrel=3
license=('BSD')

ros_makedepends=(
	ros-melodic-rqt-gui-cpp
	ros-melodic-geometry-msgs
	ros-melodic-catkin
	ros-melodic-cv-bridge
	ros-melodic-rqt-gui
	ros-melodic-sensor-msgs
	ros-melodic-image-transport
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
	qt5-base
)

ros_depends=(
	ros-melodic-rqt-gui-cpp
	ros-melodic-geometry-msgs
	ros-melodic-cv-bridge
	ros-melodic-rqt-gui
	ros-melodic-sensor-msgs
	ros-melodic-image-transport
)

depends=(
	${ros_depends[@]}
)

_dir="rqt_image_view-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-visualization/rqt_image_view/archive/${pkgver}.tar.gz"
        "include_QSet.patch")
sha256sums=('e24e26dc98404966cc827a4e576a3c7465d82076095d1831eb9da49d3a97c4d5'
            'c6a8079a952d8ee9560d190e27f124f53c0e78b4d80ec46bbe06ae36f1de85b7')

prepare() {
	cd ${srcdir}/${_dir}
	patch --forward --strip=1 --input="${srcdir}/include_QSet.patch"
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
		-DSETUPTOOLS_DEB_LAYOUT=OFF
	make
}

package() {
	cd "${srcdir}/build"
	make DESTDIR="${pkgdir}/" install
}
