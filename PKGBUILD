# Maintainer: Oystein Sture <oysstu at gmail.com>

pkgname=ros2-humble-base
pkgver=2024.08.07
pkgrel=1
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
source=(
    "https://github.com/ros2/ros2/archive/release-${_rosdist_short}-${pkgver//.}.tar.gz"
    "ros2-variants-0.10.0.tar.gz::https://github.com/ros2/variants/archive/0.10.0.tar.gz"
)
sha256sums=('a842548afdb525d772fb9225d85032e7f06d39f46196fa728fdfcbcfd95bc7ed'
            'df17f20c0168f4553e40023b8e324d93bdcc1f39932df785cb1d55051076e3f6')

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
}

build() {
    # For low-mem high core count systems, add the following to disable parallel build
    #export COLCON_EXTRA_ARGS="${COLCON_EXTRA_ARGS} --executor sequential"

    # Remove D_FORTIFY_SOURCE to avoid compilation errors
    CFLAGS=$(sed "s/-Wp,-D_FORTIFY_SOURCE=[0-9]\s//g" <(echo $CFLAGS))
    CXXFLAGS=$(sed "s/-Wp,-D_FORTIFY_SOURCE=[0-9]\s//g" <(echo $CXXFLAGS))

    # Build
    colcon build --packages-up-to ros_base --merge-install ${COLCON_EXTRA_ARGS} --cmake-args -DBUILD_TESTING=OFF
}

package() {
    mkdir -p $pkgdir/opt/ros/${_rosdist_short}-base
    cp -r $srcdir/install/* $pkgdir/opt/ros/${_rosdist_short}-base/
}
