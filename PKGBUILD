pkgdesc="ROS - The Kinematics and Dynamics Library (KDL) defines a tree structure to represent the kinematic and dynamic parameters of a robot mechanism."
url='https://wiki.ros.org/kdl_parser'

pkgname='ros-melodic-kdl-parser'
pkgver='1.13.1'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=4
license=('BSD')

ros_makedepends=(
	ros-melodic-cmake-modules
	ros-melodic-catkin
	ros-melodic-urdf
	ros-melodic-rosconsole
	ros-melodic-orocos-kdl
	ros-melodic-rostest
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
	tinyxml
	tinyxml2
	urdfdom-headers
)

ros_depends=(
	ros-melodic-orocos-kdl
	ros-melodic-urdf
	ros-melodic-rosconsole
)

depends=(
	${ros_depends[@]}
	tinyxml
	tinyxml2
	urdfdom-headers
)

_dir="kdl_parser-${pkgver}/kdl_parser"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros/kdl_parser/archive/${pkgver}.tar.gz")
sha256sums=('51378b09efc288ad91870322930f032f31a82e4a436865222b9990470995f67a')

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
		-DSETUPTOOLS_DEB_LAYOUT=OFF \
                -DBOOST_ROOT=/opt/boost1.69
	make
}

package() {
	cd "${srcdir}/build"
	make DESTDIR="${pkgdir}/" install
}
