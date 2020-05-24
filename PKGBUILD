pkgdesc="ROS - A simple viewer for ROS image topics."
url='https://wiki.ros.org/image_view'

pkgname='ros-noetic-image-view'
pkgver='1.13.0'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=4
license=('BSD')

ros_makedepends=(
	ros-noetic-std-srvs
	ros-noetic-nodelet
	ros-noetic-dynamic-reconfigure
	ros-noetic-stereo-msgs
	ros-noetic-catkin
	ros-noetic-cv-bridge
	ros-noetic-camera-calibration-parsers
	ros-noetic-message-generation
	ros-noetic-rosconsole
	ros-noetic-roscpp
	ros-noetic-message-filters
	ros-noetic-sensor-msgs
	ros-noetic-image-transport
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
	gtk2
)

ros_depends=(
	ros-noetic-std-srvs
	ros-noetic-nodelet
	ros-noetic-dynamic-reconfigure
	ros-noetic-cv-bridge
	ros-noetic-camera-calibration-parsers
	ros-noetic-rosconsole
	ros-noetic-roscpp
	ros-noetic-message-filters
	ros-noetic-image-transport
)

depends=(
	${ros_depends[@]}
	gtk2
	gtk3
)

_dir="image_pipeline-${pkgver}/image_view"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-perception/image_pipeline/archive/${pkgver}.tar.gz"
        CMakeLists.patch)
sha256sums=('3c2309d421acf354ca69a7c814ceec7c8b24732c31a7f1c47a055aedd95cb1c4'
            '715e30310dec53eb3d19ef40fb40be48a01a10e3fc170c6ec857ddaa0cea8474')

prepare() {
  cd "${srcdir}/${_dir}"
  patch -uN CMakeLists.txt ${srcdir}/CMakeLists.patch || return 1
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
