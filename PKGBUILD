pkgdesc="ROS - The ROS packages in this repository were created to provide an improved alternative Inverse Kinematics solver to the popular inverse Jacobian methods in KDL."
url='http://wiki.ros.org/trac_ik'

pkgname='ros-noetic-trac-ik'
pkgver='1.5.1'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=1
license=('BSD')

ros_makedepends=(
    ros-noetic-catkin
)
makedepends=(
    cmake
    ros-build-tools
    ${ros_makedepends[@]}
)

ros_depends=(
    ros-noetic-trac-ik-python
    ros-noetic-trac-ik-lib
    ros-noetic-trac-ik-examples
    ros-noetic-trac-ik-kinematics-plugin
)

depends=(
    ${ros_depends[@]}
)

_dir="traclabs-trac_ik-f4597094e974/trac_ik"
source=("${pkgname}-${pkgver}.tar.gz"::"https://bitbucket.org/traclabs/trac_ik/get/${pkgver}.tar.gz")
sha256sums=('67bdfb8dfcdf99c4ff5bd10de3c214527443a5c1ac54c99a0b5590d2692bf676')

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
