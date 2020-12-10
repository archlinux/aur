pkgdesc="ROS - Single image rectification and color processing."
url='https://wiki.ros.org/image_proc'

pkgname='ros-melodic-image-proc'
pkgver='1.15.0'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=2
license=('BSD')

ros_makedepends=(
	ros-melodic-camera-calibration-parsers
	ros-melodic-image-geometry
	ros-melodic-nodelet
	ros-melodic-dynamic-reconfigure
	ros-melodic-catkin
	ros-melodic-cv-bridge
	ros-melodic-roscpp
	ros-melodic-sensor-msgs
	ros-melodic-nodelet-topic-tools
	ros-melodic-image-transport
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
	boost1.69
)

ros_depends=(
	ros-melodic-camera-calibration-parsers
	ros-melodic-image-geometry
	ros-melodic-nodelet
	ros-melodic-dynamic-reconfigure
	ros-melodic-cv-bridge
	ros-melodic-roscpp
	ros-melodic-sensor-msgs
	ros-melodic-nodelet-topic-tools
	ros-melodic-image-transport
	ros-melodic-rostest
)

depends=(
	${ros_depends[@]}
)

_dir="image_pipeline-${pkgver}/image_proc"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-perception/image_pipeline/archive/${pkgver}.tar.gz")
sha256sums=('d13a78ccdbd1b3a89c0d7b14a69cc097a3ce4a6a85edbc89831781a4a024fff8')

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
		 -DBOOST_ROOT=/opt/boost1.69
	make
}

package() {
	cd "${srcdir}/build"
	make DESTDIR="${pkgdir}/" install
}
