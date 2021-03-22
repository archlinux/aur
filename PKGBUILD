pkgdesc="ROS - image_pipeline fills the gap between getting raw images from a camera driver and higher-level vision processing."
url='https://wiki.ros.org/image_pipeline'

pkgname='ros-melodic-image-pipeline'
pkgver='1.15.0'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=2
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
	ros-melodic-image-rotate
	ros-melodic-stereo-image-proc
	ros-melodic-depth-image-proc
	ros-melodic-image-view
	ros-melodic-image-proc
	ros-melodic-image-publisher
	ros-melodic-camera-calibration
)

depends=(
	${ros_depends[@]}
)

_dir="image_pipeline-${pkgver}/image_pipeline"
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
		-DSETUPTOOLS_DEB_LAYOUT=OFF
	make
}

package() {
	cd "${srcdir}/build"
	make DESTDIR="${pkgdir}/" install
}
