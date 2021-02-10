pkgdesc="ROS - The Kinematics and Dynamics Library (KDL) defines a tree structure to represent the kinematic and dynamic parameters of a robot mechanism."
url='https://wiki.ros.org/kdl_parser'

pkgname='ros-noetic-kdl-parser'
pkgver='1.14.1'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=1
license=('BSD')

ros_makedepends=(
	ros-noetic-catkin
	ros-noetic-cmake-modules
	ros-noetic-rosconsole
)

makedepends=(
	cmake
	ros-build-tools
	${ros_makedepends[@]}
	urdfdom-headers
)

ros_depends=(
	ros-noetic-rosconsole
	ros-noetic-urdf
)

depends=(
	${ros_depends[@]}
	orocos-kdl
	tinyxml
	tinyxml2
)

_dir="kdl_parser-${pkgver}/kdl_parser"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros/kdl_parser/archive/${pkgver}.tar.gz")
sha256sums=('5892b145bc5bf4fe8a5d287e83d600a5f7a324ab9b243b45c53d82f733b76963')

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
