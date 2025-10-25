# Maintainer: Oystein Sture <oysstu at gmail.com>

pkgname=ros2-humble-base
pkgver=2025.07.21
pkgrel=2
_rosdist="Humble Hawksbill"
_rosdist_short_upper=${_rosdist%% *}
_rosdist_short=${_rosdist_short_upper,}
pkgdesc="A set of software libraries and tools for building robot applications (base variant)"
url="https://index.ros.org/p/ros_base/#humble"
arch=('any')
license=('Apache')
depends=(
    'asio'
    'bullet'
    'cmake'
    'eigen'
    'git'
    'libyaml'
    'pybind11'
    'python'
    'python-colcon-common-extensions'
    'python-lark-parser'
    'python-netifaces'
    'python-numpy'
    'python-yaml'
    'tinyxml'  # urdfdom
    'tinyxml2'
)
makedepends=(
  'procps-ng'  # For 'free'
  'python-rosinstall_generator'
  'python-vcstool'
  'git'
)
conflicts=("ros2-${_rosdist_short}")
source=(
    "https://github.com/ros2/ros2/archive/release-${_rosdist_short}-${pkgver//.}.tar.gz"
    "ros2-variants-0.10.0.tar.gz::https://github.com/ros2/variants/archive/0.10.0.tar.gz"
    "mcap_vendor_cstdint.patch"
    "fastdds.patch"
)
sha256sums=('b82b15e9b186e9a0df2acb44c1a09d4bf2b24ded37a86e08115c32cefdecc89a'
            'df17f20c0168f4553e40023b8e324d93bdcc1f39932df785cb1d55051076e3f6'
            'f2ac0967f508f6a4f1fd4f278800e64052127859ee3e21cdf1b467b3ffe7563f'
            'c3362474bb6965fdb72746cbb9aa50e9e6b0788def4818aa4756164e881257fd')

prepare() {
    # Clone the repos
    printf "Cloning ros2 repositories\n"
    mkdir -p $srcdir/ros2/src
    vcs import $srcdir/ros2/src < $srcdir/ros2-release-${_rosdist_short}-${pkgver//.}/ros2.repos

    printf "Patching sources\n"

    # Missing cstdint includes
    git -C "$srcdir/ros2/src/eProsima/Fast-DDS" cherry-pick -n add29f42591fe3d785df727aea128f250040834f
    git -C "$srcdir/ros2/src/ros-tooling/libstatistics_collector" cherry-pick -n 1c340c97c731019d0c7b40f8c167b0ef666bcf75
    git -C "$srcdir/ros2/src/ros2/rclcpp/rclcpp/include/rclcpp" cherry-pick -n 86c77143c96d85711a87f2a5adcc4d7f0fb0dbeb
    git -C "$srcdir/ros2/src/ros2/rosbag2" cherry-pick -n 65c889e1fa55dd85a148b27b8c27dadc73238e67

    # Support empy3 and empy4
    git -C "$srcdir/ros2/src/ros2/rosidl" reset --hard HEAD
    git -C "$srcdir/ros2/src/ros2/rosidl" cherry-pick -n 5b4700c7e6ea61125ee4a4f98a9ec936eec4b4c1
    git -C "$srcdir/ros2/src/ros2/rosidl" cherry-pick -n b8381d955a111cdf8a52a0f1891cc55de5f19db1
    git -C "$srcdir/ros2/src/ros2/rosidl" cherry-pick -n e25750db3d7735947cad24f630d135ba02db5e59
    git -C "$srcdir/ros2/src/ros2/rosidl" cherry-pick -n b3d84469b7a82ba63cf7ce3f708ba2db6b9d7607

    # https://github.com/foxglove/mcap/pull/1371
    git -C "$srcdir/ros2/src/ros2/rosbag2" checkout "mcap_vendor/src/main.cpp"
    git -C "$srcdir/ros2/src/ros2/rosbag2" apply "$srcdir/mcap_vendor_cstdint.patch"

    # https://github.com/eProsima/Fast-DDS/issues/5790
    # https://github.com/eProsima/Fast-DDS/issues/5792
    git -C "$srcdir/ros2/src/eProsima/Fast-DDS" checkout .
    git -C "$srcdir/ros2/src/eProsima/Fast-DDS" apply "$srcdir/fastdds.patch"

    # https://github.com/ros/urdfdom/pull/205
    git -C "$srcdir/ros2/src/ros/urdfdom" checkout .
    git -C "$srcdir/ros2/src/ros/urdfdom" cherry-pick -n 4768260074a90510571810d7439113960a304d44
}

build() {
    # For low-mem high core count systems, add the following to disable parallel build
    #export COLCON_EXTRA_ARGS="${COLCON_EXTRA_ARGS} --executor sequential"

    # Remove D_FORTIFY_SOURCE to avoid compilation errors
    CFLAGS=$(sed "s/-Wp,-D_FORTIFY_SOURCE=[0-9]\s//g" <(echo $CFLAGS))
    CXXFLAGS=$(sed "s/-Wp,-D_FORTIFY_SOURCE=[0-9]\s//g" <(echo $CXXFLAGS))

    export CMAKE_POLICY_VERSION_MINIMUM=3.5

    # Build
    # THIRDPARTY_Asio: This forces Fast-DDS to use its internal ASIO version.
    #                  They were using deprecated ASIO functionality, which is now removed.
    #                  See the following issue: https://github.com/eProsima/Fast-DDS/issues/5726
    colcon build --packages-up-to ros_base --merge-install ${COLCON_EXTRA_ARGS} --cmake-args \
        -DBUILD_TESTING=OFF  \
        -DCMAKE_CXX_STANDARD=17 \
        -DCMAKE_CXX_STANDARD_REQUIRED=ON \
        -DRMW_IMPLEMENTATION=rmw_fastrtps_cpp \
        -DTHIRDPARTY_Asio=FORCE
}

package() {
    mkdir -p $pkgdir/opt/ros/${_rosdist_short}
    cp -r $srcdir/install/* $pkgdir/opt/ros/${_rosdist_short}/
}
