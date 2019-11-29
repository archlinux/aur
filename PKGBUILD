pkgdesc="ROS - This package provides an implementation of the Dynamic Window
Approach to local robot navigation on a plane."
url='https://wiki.ros.org/dwa_local_planner'

pkgname='ros-melodic-dwa-local-planner'
pkgver='1.16.3'
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(
    ros-melodic-catkin
    ros-melodic-angles
    ros-melodic-cmake-modules
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
)

ros_depends=(
    ros-melodic-base-local-planner
    ros-melodic-costmap-2d
    ros-melodic-dynamic-reconfigure
    ros-melodic-nav-core
    ros-melodic-nav-msgs
    ros-melodic-pluginlib
    ros-melodic-sensor-msgs
    ros-melodic-roscpp
    ros-melodic-tf2
    ros-melodic-tf2-geometry-msgs
    ros-melodic-tf2-ros
)

depends=(
    'eigen'
	${ros_depends[@]}
)

_dir="navigation-${pkgver}/dwa_local_planner"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-planning/navigation/archive/${pkgver}.tar.gz")
sha256sums=('23a6f3202fec00b07bb419453eed2591dd63fffa5da2fc78fb29620c9f2bdced')

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
