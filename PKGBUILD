pkgdesc="ROS - qt_gui_cpp provides the foundation for C++-bindings for qt_gui and creates bindings for every generator available."
url='https://wiki.ros.org/qt_gui_cpp'

pkgname='ros-noetic-qt-gui-cpp'
pkgver='0.4.1'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=2
license=('BSD')

ros_makedepends=(
	ros-noetic-catkin
	ros-noetic-cmake-modules
	ros-noetic-pluginlib
	ros-noetic-python-qt-binding
)

makedepends=(
	cmake
	ros-build-tools
	${ros_makedepends[@]}
	python-setuptools
	pkg-config
	qt5-base
	tinyxml
)

ros_depends=(
	ros-noetic-pluginlib
	ros-noetic-qt-gui
)

depends=(
	${ros_depends[@]}
	tinyxml
	sip
	python-sip
)

_dir="qt_gui_core-${pkgver}/qt_gui_cpp"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-visualization/qt_gui_core/archive/${pkgver}.tar.gz"
        "sip.patch::https://patch-diff.githubusercontent.com/raw/ros-visualization/qt_gui_core/pull/226.patch")
sha256sums=('6baab3b36409f385aa543d33c6595bfbfc89c24ce52233b6aa33ec2088d23132'
            '059769b768078b6871b6d9caf6124f5c3ff9bdbd2ce0e64cc9f12d1be5a16795')

prepare() {
    cd "$srcdir/qt_gui_core-${pkgver}"
    patch --forward --strip=1 --input="${srcdir}/sip.patch"
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
