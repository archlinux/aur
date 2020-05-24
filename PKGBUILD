# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - A metapackage which extends ros_core and includes other basic non-robot tools like actionlib, dynamic reconfigure, nodelets, and pluginlib."
url='https://wiki.ros.org/ros_base'

pkgname='ros-noetic-ros-base'
pkgver='1.4.1'
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(
	ros-noetic-catkin
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
)

ros_depends=(
	ros-noetic-bond-core
	ros-noetic-nodelet-core
	ros-noetic-dynamic-reconfigure
	ros-noetic-ros-core
	ros-noetic-actionlib
)

depends=(
	${ros_depends[@]}
)

_dir="metapackages-${pkgver}/ros_base"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros/metapackages/archive/${pkgver}.tar.gz"
        "https://patch-diff.githubusercontent.com/raw/ros/metapackages/pull/31.patch")
sha256sums=('ef1df96c61c9762555174cc1a0e21e05149f74909d27044be0cd10aa065747a1'
            'a8648852cff7b2740c5fe523b78309557b7f58e5c010e71a94c341b8cbfd5ba2')

prepare() {
    cd ${srcdir}/${_dir}/..
    patch -p1 < ${srcdir}/31.patch
}

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
