pkgdesc="ROS - Server Side tools for Authorization and Authentication of ROS
Clients"
url='https://wiki.ros.org/rosauth'

pkgname='ros-noetic-rosauth'
pkgver='1.0.1'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=2
license=('BSD')

ros_makedepends=(
	ros-noetic-catkin
    ros-noetic-roscpp
    ros-noetic-message-generation
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
    openssl
)

ros_depends=(
    ros-noetic-message-generation
    ros-noetic-roscpp
)

depends=(
	${ros_depends[@]}
)

_dir="rosauth-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/GT-RAIL/rosauth/archive/${pkgver}.tar.gz")
sha256sums=('afa1e29ed21b9481b622b2a72f314765ee90a4ecaabef3e8825227f92ff5675b')

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
