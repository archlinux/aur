# Maintainer: ftsell <aur@finn-thorben.me>
pkgname=ros-melodic-plotjuggler
pkgdesc="juggle with data"
pkgver=2.6.0
pkgrel=1
_gitorg=facontidavide
_gitname=PlotJuggler
#_gitbranch=master
arch=(any)
url="https://www.plotjuggler.io"
license=("LGPLv3")

ros_makedepends=()
makedepends=('cmake' 'ros-build-tools' 'clang'  ${ros_makedepends[@]})

ros_depends=("ros-melodic-ros-type-introspection" 
    "ros-melodic-rosbag"
    "ros-melodic-rosbag-storage" 
    "ros-melodic-roscpp"
    "ros-melodic-roscpp-serialization"
    "ros-melodic-rostime"
    "ros-melodic-topic-tools"
    "ros-melodic-tf"
    "ros-melodic-diagnostic-msgs"
    "ros-melodic-nav-msgs")
depends=("binutils" "qt5-base" "qt5-svg" "qt5-multimedia" ${ros_depends[@]})

_dir="${_gitname}-${pkgver}"
source=("${_gitname}-${pkgver}.tar.gz::https://github.com/${_gitorg}/${_gitname}/archive/${pkgver}.tar.gz")
sha256sums=("5cf7d941bd57d3ac2b19c8a228942ccbf9c676b79d971c026f456cb17296f339")


prepare() {
    cd "${srcdir}/${_dir}"
    sed -i "s/std::__cxx11::string/std::string/" ./plotter_gui/transforms/lua_custom_function.cpp
    sed -i "\|3rdparty/backward-cpp|d" ./CMakeLists.txt
    sed -i "s|../3rdparty/backward-cpp/backward.cpp||" ./plotter_gui/CMakeLists.txt
    echo "void DataStreamROS::clockCallback(const rosgraph_msgs::Clock::ConstPtr &msg) {}" >> ./plugins/ROS/DataStreamROS/datastream_ROS.cpp 
}


build() {
    # Use ROS environment variables
    source /usr/share/ros-build-tools/clear-ros-env.sh
    [ -f /opt/ros/melodic/setup.bash ] && source /opt/ros/melodic/setup.bash

    # Create build directory
    [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
    cd ${srcdir}/build

    # Fix Python2/Python3 conflicts
    /usr/share/ros-build-tools/fix-python-scripts.sh -v 3 ${srcdir}/${_dir}

    # Build project
    cmake ${srcdir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/melodic \
        -DCMAKE_CXX_STANDARD=11 \
        -DPYTHON_EXECUTABLE=/usr/bin/python3 \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
    make
}


package() {
    cd "${srcdir}/build"
    make DESTDIR="${pkgdir}/" install
}

