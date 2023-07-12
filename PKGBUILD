# Maintainer: Oystein Sture <oysstu at gmail.com>
# Contributor: Mohammad Mostafa Farzan <m2_farzan@yahoo.com>
# Contributor: mjbogusz <mjbogusz+github@gmail.com>
# Contributor: yuanyuyuan <az6980522@gmail.com>
# Contributor: Rémy B. (github.com/KirrimK)
# Contributor: Renato Caldas (github.com/rmsc)
# Contributor: goekce (github.com/goekce)
# Contributor: David Castellon (github.com/bobosito000)
# Contributor: Yannic Wehner <yannic.wehner@gmail.com> (github.com/ElCap1tan)
# Acknowledgment: This work is hugely based on `ros2-arch-deps` AUR
# package, maintained by T. Borgert.


pkgname=ros2-humble-base
pkgver=2023.06.14
pkgrel=2
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
    'tinyxml2'
)
makedepends=(
  'procps-ng'  # For 'free'
  'python-rosinstall_generator'
  'python-vcstool'
)
source=(
    "ros2::git+https://github.com/ros2/ros2.git#tag=release-humble-${pkgver//.}"
    "ros2_base::git+https://github.com/ros2/variants.git#branch=master"
)
sha256sums=('SKIP'
            'SKIP')

prepare() {
    # Check locale
    locale | grep LANG | grep -i UTF-8
    if [[ $? -ne 0 ]]; then
        printf "Locale must support UTF-8. See https://wiki.archlinux.org/index.php/locale
        or https://wiki.archlinux.org/index.php/locale ."
        exit 1
    fi

    # Clone the repos
    printf "Cloning ros2 repositories\n"
    mkdir -p $srcdir/ros2/src
    vcs import $srcdir/ros2/src < $srcdir/ros2/ros2.repos

    # Apply patches
    printf "Patching sources\n"

    # Missing cstdint includes
    git -C "$srcdir/ros2/src/ros2/rcpputils" cherry-pick -n f96811a9047fa6a084a885219c88b415bc544487
    git -C "$srcdir/ros2/src/eProsima/Fast-DDS" cherry-pick -n add29f42591fe3d785df727aea128f250040834f
    git -C "$srcdir/ros2/src/ros-tooling/libstatistics_collector" cherry-pick -n 1c340c97c731019d0c7b40f8c167b0ef666bcf75
    git -C "$srcdir/ros2/src/ros2/rclcpp/rclcpp/include/rclcpp" cherry-pick -n 86c77143c96d85711a87f2a5adcc4d7f0fb0dbeb
    git -C "$srcdir/ros2/src/ros2/rosbag2" cherry-pick -n 65c889e1fa55dd85a148b27b8c27dadc73238e67
}

build() {
    # Disable parallel build if RAM is low
    if [[ $(free | grep -Po "Mem:\s+\K\d+") < 16000000 ]]; then
        printf "\nRAM is smaller than 16 GB. Parallel build will be disabled for stability.\n\n"
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
    mkdir -p $pkgdir/opt/ros/humble-base
    cp -r $srcdir/install/* $pkgdir/opt/ros/humble-base/
}
