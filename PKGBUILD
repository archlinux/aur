pkgdesc="ROS - This package contains a ROS wrapper for OpenSlam's Gmapping."
url='https://wiki.ros.org/gmapping'

pkgname='ros-noetic-gmapping'
pkgver='1.4.1'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=1
license=('BSD' 'Apache 2.0')

ros_makedepends=(
    ros-noetic-catkin
    ros-noetic-nav-msgs
    ros-noetic-openslam-gmapping
    ros-noetic-roscpp
    ros-noetic-rostest
    ros-noetic-tf
    ros-noetic-nodelet
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
)

ros_depends=(
    ros-noetic-nav-msgs
    ros-noetic-openslam-gmapping
    ros-noetic-roscpp
    ros-noetic-tf
    ros-noetic-nodelet
)

depends=(
	${ros_depends[@]}
)

_dir="slam_gmapping-${pkgver}/gmapping"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-perception/slam_gmapping/archive/${pkgver}.tar.gz")
sha256sums=('28429cf962b5ec2c49556aee73b7f87859c0421bc8c8056e3667e3a2b20591e2')

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
