pkgdesc="ROS - ROS package for LDS(HLS-LFCD2). The LDS (Laser Distance Sensor)
is a sensor sending the data to Host for the simultaneous localization and
mapping (SLAM)."
url='https://wiki.ros.org/hls_lfcd_lds_driver'

pkgname='ros-melodic-hls-lfcd-lds-driver'
pkgver='1.1.2'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=1
license=('BSD')

ros_makedepends=(
	ros-melodic-catkin
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
)

ros_depends=(
    ros-melodic-roscpp
    ros-melodic-std-msgs
    ros-melodic-sensor-msgs
)

depends=(
    'boost1.69'
	${ros_depends[@]}
)

_dir="hls-lfcd-lds-driver-${pkgver}/"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ROBOTIS-GIT/hls_lfcd_lds_driver/archive/${pkgver}.tar.gz")
sha256sums=('3176593c1bb31ced2f12cf31a784029ab270cc7f0098ffdbc556b17915c67cf2')

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
		-DSETUPTOOLS_DEB_LAYOUT=OFF \
		 -DBOOST_ROOT=/opt/boost1.69 \
		 -DBoost_NO_SYSTEM_PATHS=TRUE
	make
}

package() {
	cd "${srcdir}/build"
	make DESTDIR="${pkgdir}/" install
}
