pkgdesc="ROS - A more performance- and stability-oriented server alternative
implemented in C++ to rosserial_python."
url='https://wiki.ros.org/rosserial_server'

pkgname='ros-melodic-rosserial-server'
pkgver='0.8.0'
arch=('any')
pkgrel=1
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
        "io-service.patch")
sha256sums=('e96cdeb81e1c03fb1c5ad85a740cb0a1a0836c52a24c6a5d97c975084b49d576'
            '3020b8961dd3cbe295fdac0b86a43d4da6b8d76b07337d46ba54d12cee4e1cb0')

prepare() {
    cd "${srcdir}/${_dir}/include/rosserial_server"
    patch -uN async_read_buffer.h ../../../../../io-service.patch || return 1
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
