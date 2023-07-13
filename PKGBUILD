# Maintainer: Oystein Sture <oysstu at gmail.com>
# Contributor: Mohammad Mostafa Farzan <m2_farzan@yahoo.com>
# Contributor: mjbogusz <mjbogusz+github@gmail.com>
# Contributor: yuanyuyuan <az6980522@gmail.com>
# Contributor: Rémy B. (github.com/KirrimK)
# Contributor: Renato Caldas (github.com/rmsc)
# Contributor: goekce (github.com/goekce)
# Contributor: David Castellon (github.com/bobosito000)
# Contributor: Yannic Wehner <yannic.wehner@gmail.com> (github.com/ElCap1tan)

pkgname=ros2-iron-base
pkgver=2023.05.23
pkgrel=2
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
    'pybind11'
    'python'
    'python-colcon-common-extensions'
    'python-lark-parser'
    'python-netifaces'
    'python-numpy'
    'python-yaml'
    'tinyxml2'
)
makedepends=(
  'procps-ng'  # For 'free'
  'python-rosinstall_generator'
  'python-vcstool'
)
source=(
    "ros2::git+https://github.com/ros2/ros2.git#tag=release-${_rosdist_short}-${pkgver//.}"
    "ros2_base::git+https://github.com/ros2/variants.git#branch=master"
)
sha256sums=('SKIP'
            'SKIP')

prepare() {
    # Clone the repos
    printf "Cloning ros2 repositories\n"
    mkdir -p $srcdir/ros2/src
    vcs import $srcdir/ros2/src < $srcdir/ros2/ros2.repos

    # Apply patches
    printf "Patching sources\n"

    # Missing cstdint/cstderr includes
    git -C "$srcdir/ros2/src/eProsima/Fast-DDS" cherry-pick -n "add29f42591fe3d785df727aea128f250040834f"
    git -C "$srcdir/ros2/src/ros2/rcpputils" cherry-pick -n "f96811a9047fa6a084a885219c88b415bc544487"
    git -C "$srcdir/ros2/src/ros-tooling/libstatistics_collector" cherry-pick -n "1c340c97c731019d0c7b40f8c167b0ef666bcf75"
    git -C "$srcdir/ros2/src/ros2/rclcpp/rclcpp/include/rclcpp" cherry-pick -n "86c77143c96d85711a87f2a5adcc4d7f0fb0dbeb"
}

build() {
    # Disable parallel build if RAM is low
    if [[ $(free | grep -Po "Mem:\s+\K\d+") < 8000000 ]]; then
        printf "\nRAM is smaller than 8 GB. Parallel build will be disabled for stability.\n\n"
        export COLCON_EXTRA_ARGS="${COLCON_EXTRA_ARGS} --executor sequential"
    fi

    ## For people with the old version of makepkg.conf
    #unset CPPFLAGS
    ## For people with the new version of makepkg.conf
    CFLAGS=$(sed "s/-Wp,-D_FORTIFY_SOURCE=2\s//g" <(echo $CFLAGS))
    CXXFLAGS=$(sed "s/-Wp,-D_FORTIFY_SOURCE=2\s//g" <(echo $CXXFLAGS))

    # Build
    colcon build --packages-up-to ros_base --merge-install ${COLCON_EXTRA_ARGS} --cmake-args -DBUILD_TESTING=OFF
}

package() {
    mkdir -p $pkgdir/opt/ros/${_rosdist_short}-base
    cp -r $srcdir/install/* $pkgdir/opt/ros/${_rosdist_short}-base/
}
