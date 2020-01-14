pkgdesc="ROS - Single image rectification and color processing."
url='https://wiki.ros.org/image_proc'

pkgname='ros-melodic-image-proc'
pkgver='1.14.0'
arch=('any')
pkgrel=0
license=('BSD')

ros_makedepends=(
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
	boost
)

ros_depends=(
	ros-melodic-image-geometry
	ros-melodic-nodelet
	ros-melodic-dynamic-reconfigure
	ros-melodic-cv-bridge
	ros-melodic-roscpp
	ros-melodic-sensor-msgs
	ros-melodic-nodelet-topic-tools
	ros-melodic-image-transport
)

depends=(
	${ros_depends[@]}
)

_dir="image_pipeline-${pkgver}/image_proc"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-perception/image_pipeline/archive/${pkgver}.tar.gz")
sha256sums=('dcf1336d43c0c03165b76c9419fb7b5a275d0b091e1890b28daf37a02c1326b3')

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
