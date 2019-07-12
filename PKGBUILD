# Maintainer: Finn-Thorben Sell <aur@finn-thorben.me>
pkgname="ros-dashing-ament-cmake-core"
pkgdesc="ROS - The core of the ament buildsystem in CMake"
url="https://index.ros.org/doc/ros2/"
license=("Apache License 2.0")

pkgver=0.7.3
_pkgver_patch=0
pkgrel=1
arch=('any')

_ros_makedepends=()
makedepends=(ros-build-tools
	${_ros_makedepends[@]})

_ros_depends=(ros-dashing-ament-package)
depends=(cmake python-setuptools python-catkin_pkg
	${_ros_depends[@]})

_dir="ament_cmake-release-release-dashing-ament_cmake_core"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ros2-gbp/ament_cmake-release/archive/release/dashing/ament_cmake_core/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('9339e4ee30d0325f8ea35222fef0874fb6a9b8fda71a3d45a54a8dd375549693')


build() {
	# Figure out installed python version
	PYTHON_VERSION=$(python --version | cut -d " " -f 2 | sed 's/\.[0-9]$//g')

	# Use empty ROS dashing environment
	export ROS_PREFIX=/opt/ros/dashing
	source /usr/share/ros-build-tools/clear-ros-env.sh
	[ -f ${ROS_PREFIX}/setup.bash ] && source ${ROS_PREFIX}/setup.bash
	export PYTHONPATH="${PYTHONPATH}:${ROS_PREFIX}/lib/python${PYTHON_VERSION}/site-packages"

	# Create build directory
	[ -d "${srcdir}/build" ] || mkdir "${srcdir}/build"
	cd "${srcdir}/build"
	
	# Build package
	cmake "${srcdir}/${_dir}" \
		-DCMAKE_BUILD_TYPE=Release \
		-DBUILD_TESTING=Off \
		-DCMAKE_INSTALL_PREFIX=${ROS_PREFIX}
	make
}


package() {
	cd "${srcdir}/build"
	make DESTDIR="${pkgdir}/" install
}
