pkgdesc="C++ library for Franka Emika research robots "
url="http://wiki.ros.org/libfranka"

pkgname='ros-melodic-libfranka'
pkgver='0.8.0'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=2
license=('Apache')

ros_makedepends=(ros-melodic-roscpp ros-melodic-catkin)
makedepends=('cmake' 'ros-build-tools' ${ros_makedepends[@]})

ros_depends=()
depends=('eigen' 'poco' ${ros_depends[@]})

_dir="libfranka-release-release-melodic-libfranka"
source=("ros-melodic-libfranka-$pkgver.tar.gz::https://github.com/frankaemika/libfranka-release/archive/release/melodic/libfranka/$pkgver.tar.gz"
missing_includes.patch)
sha256sums=('b62cdc54d52fe734976b24438cd199a2ab6d4a2fc1a6424f6faa7a951a033d06'
            'e4438f5cbd3227832905ee8830e692a50a74d8f43c29d1d687163c45469cc998')

prepare() {
  cd ${srcdir}/${_dir}
  patch --forward --strip=0  --input=${srcdir}/missing_includes.patch || return 1
}

build() {
	# Use ROS environment variables
  	source /usr/share/ros-build-tools/clear-ros-env.sh
  	[ -f /opt/ros/melodic/setup.bash ] && source /opt/ros/melodic/setup.bash

	# Create build directory
  	[ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  	cd ${srcdir}/build

	# Build project
	cmake ${srcdir}/${_dir} \
	      -DCATKIN_BUILD_BINARY_PACKAGE=ON \
	      -DCATKIN_ENABLE_TESTING=0 \
	      -DCMAKE_INSTALL_PREFIX=/opt/ros/melodic \
	      -DPYTHON_EXECUTABLE=/usr/bin/python3 \
	      -DSETUPTOOLS_DEB_LAYOUT=OFF
	make
}

package() {
	cd "${srcdir}/build"
	make DESTDIR="${pkgdir}/" install
}
