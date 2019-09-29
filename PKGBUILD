pkgdesc="ROS - Server Side tools for Authorization and Authentication of ROS
Clients"
url='https://wiki.ros.org/rosauth'

pkgname='ros-melodic-rosauth'
pkgver='1.0.1'
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(
	ros-melodic-catkin
    ros-melodic-roscpp
    ros-melodic-message-generation
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
    openssl
)

ros_depends=(
    ros-melodic-message-generation
    ros-melodic-roscpp
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
