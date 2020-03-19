pkgdesc="ROS - A more performance- and stability-oriented server alternative
implemented in C++ to rosserial_python."
url='https://wiki.ros.org/rosserial_server'

pkgname='ros-melodic-rosserial-server'
pkgver='0.8.0'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=3
license=('BSD')

ros_makedepends=(
	ros-melodic-catkin
    ros-melodic-rosserial-msgs
    ros-melodic-std-msgs
    ros-melodic-roscpp
    ros-melodic-topic-tools
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
)

ros_depends=(
    ros-melodic-rosserial-msgs
    ros-melodic-rosserial-python
    ros-melodic-std-msgs
    ros-melodic-roscpp
    ros-melodic-topic-tools
)

depends=(
	${ros_depends[@]}
)

_dir="rosserial-${pkgver}/rosserial_server"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-drivers/rosserial/archive/${pkgver}.tar.gz"
        "fix-boost-1-71.patch"::"https://patch-diff.githubusercontent.com/raw/ros-drivers/rosserial/pull/468.patch")
sha256sums=('e96cdeb81e1c03fb1c5ad85a740cb0a1a0836c52a24c6a5d97c975084b49d576'
            '750137d86f3d535be30ecdc904e12355c71a7873a780fc686f6e6f133cd2172a')

prepare() {
    cd "${srcdir}/${_dir}/.."
    patch -p1 < ${srcdir}/fix-boost-1-71.patch
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
