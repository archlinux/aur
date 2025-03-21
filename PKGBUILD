# Maintainer: Oystein Sture <oysstu at gmail.com>

pkgname=ros2-iron-base
pkgver=2024.12.04
pkgrel=2
_rosdist="Iron Irwini"
_rosdist_short_upper=${_rosdist%% *}
_rosdist_short=${_rosdist_short_upper,}
pkgdesc="A set of software libraries and tools for building robot applications (${_rosdist}, base variant)"
url="https://index.ros.org/p/ros_base/#${_rosdist_short}"
arch=('any')
license=('Apache-2.0')
depends=(
    'asio'
    'bullet'
    'cmake'
    'eigen'
    'git'
    'libyaml'
    'lttng-ust'
    'orocos-kdl'
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
)
conflicts=("ros2-${_rosdist_short}")
source=(
    "https://github.com/ros2/ros2/archive/release-${_rosdist_short}-${pkgver//.}.tar.gz"
    "ros2-variants-0.10.0.tar.gz::https://github.com/ros2/variants/archive/0.10.0.tar.gz"
)
sha256sums=('cc614fa03de27d8a1cf6fb1f931ffcf9fe35d39ba07615b5e2f0adc9d68198c7'
            'df17f20c0168f4553e40023b8e324d93bdcc1f39932df785cb1d55051076e3f6')

prepare() {
    # Clone the repos
    printf "Cloning ros2 repositories\n"
    mkdir -p $srcdir/ros2/src
    vcs import $srcdir/ros2/src < $srcdir/ros2-release-${_rosdist_short}-${pkgver//.}/ros2.repos

    # Type error
    git -C "$srcdir/ros2/src/ros2/ros2_tracing" cherry-pick -n 7e8d42e3816dc9f7dc268109a2bb9cc66cc4d4ee

    # Support empy3 and empy4
    git -C "$srcdir/ros2/src/ros2/rosidl" cherry-pick -n e25750db3d7735947cad24f630d135ba02db5e59
}

build() {
    # Disable parallel build if RAM is low
    # export COLCON_EXTRA_ARGS="${COLCON_EXTRA_ARGS} --executor sequential"

    # Remove D_FORTIFY_SOURCE to avoid compilation errors
    CFLAGS=$(sed "s/-Wp,-D_FORTIFY_SOURCE=[0-9]\s//g" <(echo $CFLAGS))
    CXXFLAGS=$(sed "s/-Wp,-D_FORTIFY_SOURCE=[0-9]\s//g" <(echo $CXXFLAGS))

    # Build
    # THIRDPARTY_Asio: This forces Fast-DDS to use its internal ASIO version.
    #                  They were using deprecated ASIO functionality, which is now removed.
    #                  See the following issue: https://github.com/eProsima/Fast-DDS/issues/5726
    colcon build --packages-up-to ros_base --merge-install ${COLCON_EXTRA_ARGS} --cmake-args -DBUILD_TESTING=OFF -DTHIRDPARTY_Asio=FORCE
}

package() {
    mkdir -p $pkgdir/opt/ros/${_rosdist_short}
    cp -r $srcdir/install/* $pkgdir/opt/ros/${_rosdist_short}/
}
