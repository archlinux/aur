pkgdesc="ROS - This package contains a ROS wrapper for OpenSlam's Gmapping."
url='https://wiki.ros.org/gmapping'

pkgname='ros-melodic-gmapping'
pkgver='1.4.0'
arch=('any')
pkgrel=1
license=('BSD' 'Apache 2.0')

ros_makedepends=(
    ros-melodic-catkin
    ros-melodic-nav-msgs
    ros-melodic-openslam-gmapping
    ros-melodic-roscpp
    ros-melodic-rostest
    ros-melodic-tf
    ros-melodic-nodelet
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
)

ros_depends=(
    ros-melodic-nav-msgs
    ros-melodic-openslam-gmapping
    ros-melodic-roscpp
    ros-melodic-tf
    ros-melodic-nodelet
)

depends=(
	${ros_depends[@]}
)

_dir="slam_gmapping-${pkgver}/gmapping"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-perception/slam_gmapping/archive/${pkgver}.tar.gz"
        "boost-signal.patch")
sha256sums=('2ab5bce850fa55366ae5ce96754910e0fc468cc86c82a6016854d143ecbabfc6'
            'b575dcd61e41957de5d89c8d772677e554275932d062b99d476d6f6ee5ce6e14')

prepare() {
    cd "${srcdir}/${_dir}"
    patch -uN CMakeLists.txt ../../../boost-signal.patch || return 1
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
