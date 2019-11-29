pkgdesc="ROS - depthimage_to_laserscan"
url='https://wiki.ros.org/depthimage_to_laserscan'

pkgname='ros-melodic-depthimage-to-laserscan'
pkgver='1.0.8'
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(
    ros-melodic-catkin
    ros-melodic-roscpp
    ros-melodic-sensor-msgs
    ros-melodic-nodelet
    ros-melodic-image-transport
    ros-melodic-image-geometry
    ros-melodic-dynamic-reconfigure
)

makedepends=(
	'cmake'
	'ros-build-tools'
    'gtest'
	${ros_makedepends[@]}
)

ros_depends=(
    ros-melodic-roscpp
    ros-melodic-sensor-msgs
    ros-melodic-nodelet
    ros-melodic-image-transport
    ros-melodic-image-geometry
    ros-melodic-dynamic-reconfigure
)

depends=(
    'eigen'
	${ros_depends[@]}
)

_dir="depthimage_to_laserscan-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-perception/depthimage_to_laserscan/archive/${pkgver}.tar.gz")
sha256sums=('00c5e46c74a7dec99fa3bf75a60f36f9fc2da72aaaff6bc6bebea7c17927fe8e')

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
