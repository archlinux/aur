# Maintainer: Mohammad Mostafa Farzan <m2_farzan@yahoo.com>
# Acknowledgment: This work is hugely based on `ros2-arch-deps` AUR
# package, maintained by T. Borgert.

pkgname=ros2-foxy
pkgver=2020.12.11
pkgrel=6
pkgdesc="A set of software libraries and tools for building robot applications"
url="https://docs.ros.org/en/foxy/"
arch=('any')
license=('Apache')
depends=('ros2-arch-deps'
         'ros2-pyqt5-sip-compat'
         'gmock'
         'sip4')
source=("ros2::git+https://github.com/ros2/ros2#tag=release-foxy-20201211"
        "mimick_vendor.patch"
        "yaml_cpp_vendor.patch")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')
install=ros2-foxy.install

prepare() {
    # Check locale
    if [[ "$(locale | grep LANG | grep UTF-8)" == "" ]]; then
      msg2 "ERROR: Locale must support UTF-8. See https://wiki.archlinux.org/index.php/locale or https://wiki.archlinux.org/index.php/locale";

      exit 1;
    fi

    # Clone the repos
    rm -rf $srcdir/ros2/src
    mkdir -p $srcdir/ros2/src
    vcs import $srcdir/ros2/src < $srcdir/ros2/ros2.repos

    # Fix some issues in the code (TODO: Gradually move to upstream)
    ## mimick_vendor:
    git -C $srcdir/ros2/src/ros2/mimick_vendor cherry-pick c4f28e4f806fc3322d310bc3e93977df734ee733
    patch --forward $srcdir/ros2/src/ros2/mimick_vendor/CMakeLists.txt mimick_vendor.patch
    ## yaml_cpp_vendor:
    patch --forward $srcdir/ros2/src/ros2/yaml_cpp_vendor/CMakeLists.txt yaml_cpp_vendor.patch
    ## rcutils
    git -C $srcdir/ros2/src/ros2/rcutils cherry-pick 618a9d94565ab844b9f40e0f5828ddbab2bcdad1
    ## ros1_bridge
    git -C $srcdir/ros2/src/ros2/ros1_bridge revert 81b7610568286ec7b390c64cf6207b362d0a6550 --no-edit
    ## google_benchmark_vendor
    git -C $srcdir/ros2/src/ament/google_benchmark_vendor checkout main
    ## rcl_logging
    git -C $srcdir/ros2/src/ros2/rcl_logging cherry-pick 77b5b2a6c948a6db1986501edc83f12ceadedba3
}

build() {
    colcon build --merge-install
}

package() {
    mkdir -p $pkgdir/opt/ros2/foxy
    cp -r $srcdir/install/* $pkgdir/opt/ros2/foxy/
}
