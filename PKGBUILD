pkgdesc="ROS - ROS package for LDS(HLS-LFCD2). The LDS (Laser Distance Sensor)
is a sensor sending the data to Host for the simultaneous localization and
mapping (SLAM)."
url='https://wiki.ros.org/hls_lfcd_lds_driver'

pkgname='ros-noetic-hls-lfcd-lds-driver'
pkgver='1.1.2'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=1
license=('BSD')

ros_makedepends=(
	ros-noetic-catkin
)

makedepends=(
	cmake
	ros-build-tools
	${ros_makedepends[@]}
)

ros_depends=(
    ros-noetic-roscpp
    ros-noetic-std-msgs
    ros-noetic-sensor-msgs
)

depends=(
	boost
	${ros_depends[@]}
)

_dir="hls_lfcd_lds_driver-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ROBOTIS-GIT/hls_lfcd_lds_driver/archive/${pkgver}.tar.gz")
sha256sums=('3176593c1bb31ced2f12cf31a784029ab270cc7f0098ffdbc556b17915c67cf2')

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
