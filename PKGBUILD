# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - rqt_gui provides the main to start an instance of the ROS integrated graphical user interface provided by qt_gui."
url='https://wiki.ros.org/rqt_gui'

pkgname='ros-melodic-rqt-gui'
pkgver='0.5.2'
_pkgver_patch=0
arch=('any')
pkgrel=3
license=('BSD')

ros_makedepends=(
	ros-melodic-qt-gui
	ros-melodic-catkin
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
)

ros_depends=(
	ros-melodic-qt-gui
	ros-melodic-catkin
)

depends=(
	${ros_depends[@]}
)

_dir="rqt-${pkgver}/rqt_gui"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-visualization/rqt/archive/${pkgver}.tar.gz"
"getiter.patch"::"https://github.com/ros-visualization/rqt/commit/80c0ae8b8a58a6b1e970ea3e5f3277f2a38cdd2f.patch")
sha256sums=('9913fb6da15f0ccb9d995f8ea3be935d36bd255379c8ae19c0005207883299eb'
            'ba6a6a30fc27d02ee403c92c1d9735c0be6b8aaf8d216d5b625910960da60b87')

prepare() {
  cd ${srcdir}/${_dir}
  patch --forward --strip=2 --input  ${srcdir}/getiter.patch || return 1
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
		-DPYTHON_INCLUDE_DIR=/usr/include/python3.7m \
		-DPYTHON_LIBRARY=/usr/lib/libpython3.7m.so \
		-DPYTHON_BASENAME=.cpython-37m \
		-DSETUPTOOLS_DEB_LAYOUT=OFF
	make
}

package() {
	cd "${srcdir}/build"
	make DESTDIR="${pkgdir}/" install
}
