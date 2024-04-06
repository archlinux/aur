# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - This package contains the python bindings PyKDL for the Kinematics and Dynamics Library (KDL), distributed by the Orocos Project."
url='https://wiki.ros.org/python_orocos_kdl'

pkgname='ros-melodic-python-orocos-kdl'
pkgver=1.5.1.r87.g129693e
_commit=129693e571a7822655d1f58bb0f83b385542a3d8
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=1
license=('LGPL')

ros_makedepends=(
	ros-melodic-orocos-kdl
)

makedepends=(
	'cmake'
	'git'
	'python-pyqt5-sip'
	'sip'
	'ros-build-tools'
	${ros_makedepends[@]}
)

ros_depends=(
	ros-melodic-orocos-kdl
	ros-melodic-catkin
)

depends=(
	${ros_depends[@]}
)

_dir="${pkgname}/python_orocos_kdl"
source=("${pkgname}::git+https://github.com/orocos/orocos_kinematics_dynamics.git#commit=${_commit}")
b2sums=('SKIP')

pkgver() {
    cd "${_dir}"

    # Generate git tag based version. Count only proper (v)#.#* [#=number] tags.
    local _gitversion=$(git describe --long --tags --match '[v0-9][0-9.][0-9.]*' | sed -e 's|^v||' | tr '[:upper:]' '[:lower:]') 

    # Format git-based version for pkgver
    # Expected format: e.g. 1.5.0rc2.r521.g99982a1c
    # Or in case of 'post': 1.5.0.post1.r521.g99982a1c
    echo "${_gitversion}" | sed \
        -e 's;^\([0-9][0-9.]*\)[-_.]\([a-zA-Z]\+\);\1\2;' \
        -e 's;\([0-9]\+-g\);r\1;' \
        -e 's;-;.;g' \
        -e 's;\(post.*\);\.\1;'
}

build() {
	# Use ROS environment variables.
	source /usr/share/ros-build-tools/clear-ros-env.sh
	[ -f /opt/ros/melodic/setup.bash ] && source /opt/ros/melodic/setup.bash

	# Create the build directory.
	[ -d ${srcdir}/build ] || mkdir ${srcdir}/build
	cd ${srcdir}/build

	local python_version="$(python --version | cut -d' ' -f2 | cut -d'.' -f1,2)"

	# Build the project.
	cmake ${srcdir}/${_dir} \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/opt/ros/melodic \
		-DPYTHON_EXECUTABLE=/usr/bin/python3 \
		-DPYTHON_INCLUDE_DIR=/usr/include/python"${python_version}" \
		-DPYTHON_LIBRARY=/usr/lib/libpython"${python_version}".so
	make
}

package() {
	cd "${srcdir}/build"
	make DESTDIR="${pkgdir}/" install
}
