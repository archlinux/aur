pkgdesc="ROS - laser_proc"
url='https://wiki.ros.org/laser_proc'

pkgname='ros-melodic-laser-proc'
pkgver='0.1.5'
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(
    ros-melodic-catkin
    ros-melodic-roscpp
    ros-melodic-rosconsole
    ros-melodic-sensor-msgs
    ros-melodic-pluginlib
    ros-melodic-nodelet
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
)

ros_depends=(
    ros-melodic-roscpp
    ros-melodic-rosconsole
    ros-melodic-sensor-msgs
    ros-melodic-pluginlib
    ros-melodic-nodelet
)

depends=(
	${ros_depends[@]}
)

_dir="laser_proc-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-perception/laser_proc/archive/${pkgver}.tar.gz")
sha256sums=('8e55ab274ba4b135a22d3d855649f7c21a8db300db185fffe5d96746c7bebb7d')

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
