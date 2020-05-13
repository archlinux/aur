pkgdesc="ROS - Low-level build system macros and infrastructure for ROS."
url='https://www.wiki.ros.org/catkin'

pkgname='ros-noetic-catkin'
pkgver='0.8.3'
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(
)

makedepends=(
	'cmake'
	${ros_makedepends[@]}
	python-catkin_pkg
	python-empy
	python
)

ros_depends=(
)

depends=(
	${ros_depends[@]}
	python-nose
	gtest
	python-catkin_pkg
	python-empy
	gmock
	python
	ros-build-tools-py3
)

_dir="catkin-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros/catkin/archive/${pkgver}.tar.gz"
        "https://patch-diff.githubusercontent.com/raw/ros/catkin/pull/1090.patch")
sha256sums=('08b3bb22025f4ba5588136e2938e014000fef61339d678070e72a7c5e5e5913d'
            'aa8e19489b8056eafd24113308aed773b01e39d0ed6f67cacb94a821bc8c75f7')

prepare() {
    cd ${srcdir}/${_dir}
    patch -p1 < ${srcdir}/1090.patch
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
		-DCMAKE_BUILD_TYPE=Release \
		-DCATKIN_BUILD_BINARY_PACKAGE=OFF \
		-DCMAKE_INSTALL_PREFIX=/opt/ros/noetic \
		-DPYTHON_EXECUTABLE=/usr/bin/python3 \
		-DSETUPTOOLS_DEB_LAYOUT=OFF
	make
}

package() {
	cd "${srcdir}/build"
	make DESTDIR="${pkgdir}/" install
}
