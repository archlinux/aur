pkgdesc="ROS - This package contains a ROS wrapper for OpenSlam's Gmapping."
url='https://wiki.ros.org/gmapping'

pkgname='ros-melodic-gmapping'
pkgver='1.4.1'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=5
license=('BSD' 'Apache 2.0')

ros_makedepends=(
    ros-melodic-catkin
    ros-melodic-nav-msgs
    ros-melodic-openslam-gmapping
    ros-melodic-roscpp
    ros-melodic-rostest
    ros-melodic-tf
    ros-melodic-nodelet
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
)

ros_depends=(
    ros-melodic-nav-msgs
    ros-melodic-openslam-gmapping
    ros-melodic-roscpp
    ros-melodic-tf
    ros-melodic-nodelet
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
