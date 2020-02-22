pkgdesc="ROS - A simple viewer for ROS image topics."
url='https://wiki.ros.org/image_view'

pkgname='ros-melodic-image-view'
pkgver='1.13.0'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=4
license=('BSD')

ros_makedepends=(
	ros-melodic-std-srvs
	ros-melodic-nodelet
	ros-melodic-dynamic-reconfigure
	ros-melodic-stereo-msgs
	ros-melodic-catkin
	ros-melodic-cv-bridge
	ros-melodic-camera-calibration-parsers
	ros-melodic-message-generation
	ros-melodic-rosconsole
	ros-melodic-roscpp
	ros-melodic-message-filters
	ros-melodic-sensor-msgs
	ros-melodic-image-transport
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
	gtk2
)

ros_depends=(
	ros-melodic-std-srvs
	ros-melodic-nodelet
	ros-melodic-dynamic-reconfigure
	ros-melodic-cv-bridge
	ros-melodic-camera-calibration-parsers
	ros-melodic-rosconsole
	ros-melodic-roscpp
	ros-melodic-message-filters
	ros-melodic-image-transport
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
		-DSETUPTOOLS_DEB_LAYOUT=OFF
	make
}

package() {
	cd "${srcdir}/build"
	make DESTDIR="${pkgdir}/" install
}
