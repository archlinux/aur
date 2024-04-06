pkgdesc="ROS - qt_gui_cpp provides the foundation for C++-bindings for qt_gui and creates bindings for every generator available."
url='https://wiki.ros.org/qt_gui_cpp'

pkgname='ros-melodic-qt-gui-cpp'
pkgver=0.4.2.r4.g9147631
_commit=9147631f5f21f77e1f8e1f3ad884b5e96a8e22e4
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
  'git'
  'ros-build-tools'
  ${ros_makedepends[@]}
  qt5-base
  tinyxml
)

ros_depends=(
  ros-melodic-qt-gui
  ros-melodic-pluginlib
)

depends=(
  ${ros_depends[@]}
  python-pyqt5-sip
  sip
  tinyxml
)

_dir="${pkgname}/qt_gui_cpp"
source=("${pkgname}::git+https://github.com/ros-visualization/qt_gui_core.git#commit=${_commit}")
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
