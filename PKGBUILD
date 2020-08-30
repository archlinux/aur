# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - This package contains the python bindings PyKDL for the Kinematics and Dynamics Library (KDL), distributed by the Orocos Project."
url='https://wiki.ros.org/python_orocos_kdl'

pkgname='ros-melodic-python-orocos-kdl'
pkgver='1.4.0'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=4
license=('LGPL')

ros_makedepends=(
	ros-melodic-orocos-kdl
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
	python-sip
	sip
)

ros_depends=(
	ros-melodic-orocos-kdl
	ros-melodic-catkin
)

depends=(
	${ros_depends[@]}
	python-sip
	sip
)

_dir="orocos_kinematics_dynamics-${pkgver}/python_orocos_kdl"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/orocos/orocos_kinematics_dynamics/archive/v${pkgver}.tar.gz"
sip.patch
sip2.patch)
sha256sums=('05b93e759923684dc07433ccae1e476d158d89b3c2be5079c20062406da7b4dd'
            '8c95f5794d6ff18fdf32a836443a2cbfd8bd8255bd3ec792b333d53280213049'
            '0887640880a9fdc3f6a879fd9dce92b64e0b84a712daab28b2758ba7638930a7')

prepare() {
  cd "${srcdir}/${_dir}"
  patch --forward --strip=0 --input="${srcdir}/sip.patch"
  patch --forward --strip=0 --input="${srcdir}/sip2.patch"

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
		-DPYTHON_INCLUDE_DIR=/usr/include/python3.8 \
		-DPYTHON_LIBRARY=/usr/lib/libpython3.8.so \
		-DPYTHON_BASENAME=.cpython-38 \
		-DSETUPTOOLS_DEB_LAYOUT=OFF
	make
}

package() {
	cd "${srcdir}/build"
	make DESTDIR="${pkgdir}/" install
}
