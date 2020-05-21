pkgdesc="C++ library for Franka Emika research robots "
url="http://wiki.ros.org/libfranka"

pkgname='ros-noetic-libfranka'
pkgver='0.7.1'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=1
license=('Apache')

ros_makedepends=(ros-noetic-roscpp ros-noetic-catkin)
makedepends=('cmake' 'ros-build-tools' ${ros_makedepends[@]})

ros_depends=()
depends=('eigen' 'poco' ${ros_depends[@]})

_dir="libfranka-release-upstream-$pkgver"
source=("$pkgname-$pkgver.tar.gz::https://github.com/frankaemika/libfranka-release/archive/upstream/$pkgver.tar.gz")
sha256sums=("4e552542954f43b03d68e4c8f2b21f221ac563b40ad9d7e63dd9938a17db0ab7")

build() {
	# Use ROS environment variables
  	source /usr/share/ros-build-tools/clear-ros-env.sh
  	[ -f /opt/ros/noetic/setup.bash ] && source /opt/ros/noetic/setup.bash

	# Create build directory
  	[ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  	cd ${srcdir}/build

	# Build project
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
