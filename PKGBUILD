pkgdesc="ROS - qt_gui_cpp provides the foundation for C++-bindings for qt_gui and creates bindings for every generator available."
url='https://wiki.ros.org/qt_gui_cpp'

pkgname='ros-melodic-qt-gui-cpp'
pkgver='0.4.1'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=1
license=('BSD')

ros_makedepends=(
	ros-melodic-python-qt-binding
	ros-melodic-cmake-modules
	ros-melodic-catkin
	ros-melodic-pluginlib
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
	tinyxml
	qt5-base
	pkg-config
)

ros_depends=(
	ros-melodic-qt-gui
	ros-melodic-pluginlib
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
		-DSETUPTOOLS_DEB_LAYOUT=OFF

	make
}

package() {
	cd "${srcdir}/build"
	make DESTDIR="${pkgdir}/" install
}
