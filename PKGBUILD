# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - Base dependencies and support libraries for ROS."
url='https://wiki.ros.org/roslib'

pkgname='ros-melodic-roslib'
pkgver='1.14.9'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=2
license=('BSD')

ros_makedepends=(
	ros-melodic-rospack
	ros-melodic-catkin
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
	boost1.69
)

ros_depends=(
	ros-melodic-ros-environment
	ros-melodic-rospack
	ros-melodic-catkin
)

depends=(
	${ros_depends[@]}
	python-rospkg
)

_dir="ros-${pkgver}/core/roslib"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros/ros/archive/${pkgver}.tar.gz"
        https://patch-diff.githubusercontent.com/raw/ros/ros/pull/256.patch)
sha256sums=('5a129ce35c906f93117f62688a4d24aee1976b7d3f2fdf3dc4f6f305d170fb02'
            'f5c43d009715305711637d693cd0e78793519ca5e882fad153159e78ce698c02')

prepare() {
    cd ${srcdir}/ros-${pkgver}
    patch -p1 < ${srcdir}/256.patch
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
		-DSETUPTOOLS_DEB_LAYOUT=OFF \
		 -DBOOST_ROOT=/opt/boost1.69
	make
}

package() {
	cd "${srcdir}/build"
	make DESTDIR="${pkgdir}/" install
}
