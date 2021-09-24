# Maintainer: Mohammad Mostafa Farzan <m2_farzan@yahoo.com>
# Acknowledgment: This work is hugely based on `ros2-arch-deps` AUR
# package, maintained by T. Borgert.

pkgname=ros2-git
pkgver=r224.3d98527
pkgrel=2
pkgdesc="A set of software libraries and tools for building robot applications (Rolling Distro)"
url="https://docs.ros.org/en/rolling/"
arch=('any')
license=('Apache')
depends=('ros2-arch-deps'
         'gmock'
         'sip4'
         # AUR
         'foonathan_memory'
         )
source=("ros2::git+https://github.com/ros2/ros2#branch=master"
        "mimick_vendor.patch"
        "yaml_cpp_vendor.patch")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

install=ros2-git.install

pkgver() {
  cd $srcdir/ros2
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    # Check locale
    locale | grep LANG | grep UTF-8
    if [[ $? -ne 0 ]]; then
        printf "Locale must support UTF-8. See https://wiki.archlinux.org/index.php/locale
        or https://wiki.archlinux.org/index.php/locale ."
        exit 1
    fi

    # Create required symlinks (see https://wiki.archlinux.org/index.php/ROS)
    sudo mkdir -p /usr/share/sip
    sudo ln -sf /usr/lib/python3.9/site-packages/PyQt5 /usr/share/sip/.
    sudo ln -sf /usr/lib/python3.9/site-packages/PyQt5/bindings/* /usr/share/sip/PyQt5/.

    # Clone the repos
    rm -rf $srcdir/ros2/src
    mkdir -p $srcdir/ros2/src
    vcs import $srcdir/ros2/src < $srcdir/ros2/ros2.repos

    # Fix some issues in the code (TODO: Gradually move to upstream)
    ## mimick_vendor:
    patch --forward $srcdir/ros2/src/ros2/mimick_vendor/CMakeLists.txt mimick_vendor.patch
    ## yaml_cpp_vendor:
    patch --forward $srcdir/ros2/src/ros2/yaml_cpp_vendor/CMakeLists.txt yaml_cpp_vendor.patch
    ## ros1_bridge
    git -C $srcdir/ros2/src/ros2/ros1_bridge revert 81b7610568286ec7b390c64cf6207b362d0a6550 --no-edit
    ## cyclonedds
    git -C $srcdir/ros2/src/eclipse-cyclonedds/cyclonedds cherry-pick bdf270a588aae77d0f1a0f0070b53ad1388da61c
    ## rcl_logging
    git -C $srcdir/ros2/src/ros2/rcl_logging cherry-pick 77b5b2a6c948a6db1986501edc83f12ceadedba3
}

build() {
    colcon build --merge-install
}

package() {
    mkdir -p $pkgdir/opt/ros2/rolling
    cp -r $srcdir/install/* $pkgdir/opt/ros2/rolling/
}
