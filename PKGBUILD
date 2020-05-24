# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - Provides nodes to assemble point clouds from either LaserScan or PointCloud messages."
url='https://wiki.ros.org/laser_assembler'

pkgname='ros-noetic-laser-assembler'
pkgver='1.7.6'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=3
license=('BSD')

ros_makedepends=(
	ros-noetic-filters
	ros-noetic-laser-geometry
	ros-noetic-rostest
	ros-noetic-catkin
	ros-noetic-tf
	ros-noetic-message-generation
	ros-noetic-roscpp
	ros-noetic-message-filters
	ros-noetic-sensor-msgs
	ros-noetic-pluginlib
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
)

ros_depends=(
	ros-noetic-filters
	ros-noetic-laser-geometry
	ros-noetic-message-filters
	ros-noetic-tf
	ros-noetic-roscpp
	ros-noetic-message-runtime
	ros-noetic-sensor-msgs
	ros-noetic-pluginlib
)

depends=(
	${ros_depends[@]}
)

_dir="laser_assembler-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-perception/laser_assembler/archive/${pkgver}.tar.gz"
  CMakeLists-signal.patch)
sha256sums=('f9b5c23f7eac7406dd3d0e4a095864335b18a25611fd28f3279763339d7bd94f'
            '1c050096b3e5edf41da7ef88db915f5690f5b6903e7d46c65a1655204f49039c')

prepare() {
  cd "${srcdir}/${_dir}"
  patch -uN CMakeLists.txt ../../CMakeLists-signal.patch || return 1
}

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
