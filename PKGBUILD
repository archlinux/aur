pkgdesc="ROS - A 2D navigation stack that takes in information from odometry,
sensor streams, and a goal pose and outputs safe velocity commands that are sent
to a mobile base."
url='https://wiki.ros.org/navigation'

pkgname='ros-melodic-navigation'
pkgver='1.16.7'
arch=('any')
pkgrel=2
license=('BSD' 'LGPL')

ros_makedepends=(
    ros-melodic-catkin
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
)

ros_depends=(
    ros-melodic-amcl
    ros-melodic-base-local-planner
    ros-melodic-carrot-planner
    ros-melodic-clear-costmap-recovery
    ros-melodic-costmap-2d
    ros-melodic-dwa-local-planner
    ros-melodic-fake-localization
    ros-melodic-global-planner
    ros-melodic-map-server
    ros-melodic-move-base
    ros-melodic-move-slow-and-clear
    ros-melodic-navfn
    ros-melodic-nav-core
    ros-melodic-rotate-recovery
    ros-melodic-voxel-grid
)

depends=(
	${ros_depends[@]}
)

_dir="navigation-${pkgver}/navigation"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-planning/navigation/archive/${pkgver}.tar.gz")
sha256sums=('3a4ee70949a07d4f5f84deddb2ee8a4314bc143d10fb2054b90683c7f92a2f33')

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
