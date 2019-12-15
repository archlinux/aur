pkgdesc="ROS - Generalized client side source for rosserial."
url='https://wiki.ros.org/rosserial_client'

pkgname='ros-melodic-rosserial-client'
pkgver='0.8.0'
arch=('any')
pkgrel=2
license=('BSD')

ros_makedepends=(
	ros-melodic-catkin
    ros-melodic-rosbash
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
)

ros_depends=(
    ros-melodic-rosserial-msgs
    ros-melodic-std-msgs
    ros-melodic-rospy
    ros-melodic-tf
    ros-melodic-rosunit
)

depends=(
	${ros_depends[@]}
)

_dir="rosserial-${pkgver}/rosserial_client"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-drivers/rosserial/archive/${pkgver}.tar.gz"
        "${pkgname}-${pkgver}-c5e90cd.patch"::"https://github.com/ros-drivers/rosserial/commit/c5e90cdd34aafca9783addbd8e83364b0fef4579.patch")
sha256sums=('e96cdeb81e1c03fb1c5ad85a740cb0a1a0836c52a24c6a5d97c975084b49d576'
            '247974d9711161ab2a11ec281256b1c68b72238dd70f4f0d01fd845a6ff2e399')

prepare() {
	cd ${srcdir}/${_dir}/..
	patch -p1 < "${srcdir}/${pkgname}-${pkgver}-c5e90cd.patch"
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
