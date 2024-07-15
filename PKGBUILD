# Maintainer: Oystein Sture <oysstu at gmail.com>

pkgname=ros2-iron-base
pkgver=2024.07.12
pkgrel=1
_rosdist="Iron Irwini"
_rosdist_short_upper=${_rosdist%% *}
_rosdist_short=${_rosdist_short_upper,}
pkgdesc="A set of software libraries and tools for building robot applications (${_rosdist}, base variant)"
url="https://index.ros.org/p/ros_base/#${_rosdist_short}"
arch=('any')
license=('Apache')
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
    'spdlog'
    'tinyxml'  # urdfdom
    'tinyxml2'
)
makedepends=(
  'procps-ng'  # For 'free'
  'python-rosinstall_generator'
  'python-vcstool'
)
source=(
    "https://github.com/ros2/ros2/archive/release-${_rosdist_short}-${pkgver//.}.tar.gz"
    "ros2-variants-0.10.0.tar.gz::https://github.com/ros2/variants/archive/0.10.0.tar.gz"
)
sha256sums=('a65bb5d974767c5eb06bd77b18e1f84020ce1a949828fc4008df8c3ae36f9995'
            'df17f20c0168f4553e40023b8e324d93bdcc1f39932df785cb1d55051076e3f6')

prepare() {
    # Clone the repos
    printf "Cloning ros2 repositories\n"
    mkdir -p $srcdir/ros2/src
    vcs import $srcdir/ros2/src < $srcdir/ros2-release-${_rosdist_short}-${pkgver//.}/ros2.repos

    # Type error
    git -C "$srcdir/ros2/src/ros2/ros2_tracing" cherry-pick -n 7e8d42e3816dc9f7dc268109a2bb9cc66cc4d4ee
}

build() {
    # Disable parallel build if RAM is low
    # export COLCON_EXTRA_ARGS="${COLCON_EXTRA_ARGS} --executor sequential"

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
