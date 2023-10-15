# Maintainer: Mohammad Mostafa Farzan <m2_farzan@yahoo.com>
# Contributor: mjbogusz <mjbogusz+github@gmail.com>
# Contributor: yuanyuyuan <az6980522@gmail.com>
# Contributor: Rémy B. (github.com/KirrimK)
# Contributor: Renato Caldas (github.com/rmsc)
# Contributor: goekce (github.com/goekce)
# Contributor: David Castellon (github.com/bobosito000)
# Contributor: Raphael (github.com/ruffson)
# Contributor: jerry73204 (github.com/jerry73204)
# Acknowledgment: This work is hugely based on `ros2-arch-deps` AUR
# package, maintained by T. Borgert.

pkgname=ros2-galactic
pkgver=2022.12.09
pkgrel=1
pkgdesc="A set of software libraries and tools for building robot applications"
url="https://docs.ros.org/en/galactic/"
arch=('any')
license=('Apache')
depends=(
    'ros2-arch-deps'
    'python-pyqt5-sip4'
    'assimp'
    'gmock'
)
source=(
    "ros2::git+https://github.com/ros2/ros2#tag=release-galactic-20221209"
    "google_benchmark_vendor.patch"
    "rviz_assimp_vendor.patch"
)
sha256sums=(
    'SKIP'
    "609a5260736192608582c0f0a0fd4da09a9185d95d452a92d9527af38d720f6a"
    "1c097a78a023956fcf877e53ca35e2949a7956045deaf5f7b049a2b237fb391c"
)
install=ros2-galactic.install

prepare() {
    # Check locale according to
    # https://docs.ros.org/en/rolling/Installation/Ubuntu-Development-Setup.html#set-locale
    if ! locale | grep LANG | grep 'UTF-8\|utf8' > /dev/null; then
        echo 'Your locale must support UTF-8. See ' \
             'https://wiki.archlinux.org/index.php/locale and ' \
             'https://docs.ros.org/en/rolling/Installation/Ubuntu-Development-Setup.html#set-locale'
        exit 1
    fi

    # Clone the repos
    mkdir -p $srcdir/ros2/src
    vcs import $srcdir/ros2/src < $srcdir/ros2/ros2.repos

    # Setup git (required for the cherry-pick commands)
    export GIT_COMMITTER_NAME="PKGBUILD"
    export GIT_COMMITTER_EMAIL="pkgbuild@example.com"
    export GIT_AUTHOR_NAME="PKGBUILD"
    export GIT_AUTHOR_EMAIL="pkgbuild@example.com"

    # Fix some issues in the code (TODO: Gradually move to upstream)
    ## google_benchmark_vendor: apply patch to update google_benchmark to v1.5.4
    git -C $srcdir/ros2/src/ament/google_benchmark_vendor checkout .
    git -C $srcdir/ros2/src/ament/google_benchmark_vendor apply $srcdir/google_benchmark_vendor.patch
    ## Eclipse iceoryx: fix building error with GCC 11
    git -C $srcdir/ros2/src/eclipse-iceoryx/iceoryx checkout v1.0.1
    ## Eclipse CycloneDDS: latest release
    git -C $srcdir/ros2/src/eclipse-cyclonedds/cyclonedds checkout 0.8.1
    ## yaml_cpp_vendor: fix handling of CMAKE_C[XX]_FLAGS lists
    git -C $srcdir/ros2/src/ros2/yaml_cpp_vendor checkout a00f059a79e98bd3899e8fe4261ea61da807b6ef
    ## demos/pendulum_control
    git -C $srcdir/ros2/src/ros2/demos cherry-pick 754612348e408675f526174c5f03786e08ad8a70
    ## ros1_bridge
    git -C $srcdir/ros2/src/ros2/ros1_bridge revert 81b7610568286ec7b390c64cf6207b362d0a6550 --no-edit
    ## tlsf_cpp
    git -C $srcdir/ros2/src/ros2/realtime_support cherry-pick fa9a5545db8f641212de78c5924f1305e01bc7a8
    ## osrf_testing_tools_cpp
    git -C $srcdir/ros2/src/osrf/osrf_testing_tools_cpp cherry-pick 869da204dd829308380df5a33e432670e474e54a
    ## rmw_cyclonedds_cpp
    git -C $srcdir/ros2/src/ros2/rmw_cyclonedds cherry-pick f57732d15be53796d518e12352866124efcaa939
    ## googletest: fix building error with GCC 11
    git -C $srcdir/ros2/src/ament/googletest/googletest cherry-pick 4679637f1c9d5a0728bdc347a531737fad0b1ca3
    ## rcpputils: fix missing cstdint include
    git -C $srcdir/ros2/src/ros2/rcpputils cherry-pick f96811a9047fa6a084a885219c88b415bc544487
    ## eProsima Fast-DDS: fix missing cstdint include
    git -C $srcdir/ros2/src/eProsima/Fast-DDS cherry-pick -X theirs 02539b98a3a36e711da8f416372cbab2ecc178bb
    ## libstatistics_collector: Fix missing cstdint include
    git -C $srcdir/ros2/src/ros-tooling/libstatistics_collector cherry-pick 1c340c97c731019d0c7b40f8c167b0ef666bcf75
    ## rclcpp: Fix missing stdexcept includes
    git -C $srcdir/ros2/src/ros2/rclcpp cherry-pick 86c77143c96d85711a87f2a5adcc4d7f0fb0dbeb
    ## pybind11_vendor: Support for python 3.11
    git -C $srcdir/ros2/src/ros2/pybind11_vendor checkout 3.0.3
    ## rosbag2_storage: cherry pick to fix missing cstdint include
    git -C $srcdir/ros2/src/ros2/rosbag2 cherry-pick 5f5a583ca2e47f6a2ec1bca6076576a99efaaf73
    ## rosbag2_compression: cherry pick to fix missing cstdint include
    git -C $srcdir/ros2/src/ros2/rosbag2 cherry-pick 65c889e1fa55dd85a148b27b8c27dadc73238e67
}

build() {
    # Disable parallel build if RAM is low
    MIN_PARALLEL_BUILD_RAM_KB=16000000
    if [[ $(free | grep -Po "Mem:\s+\K\d+") -lt $MIN_PARALLEL_BUILD_RAM_KB && $(grep MemTotal /proc/meminfo | grep -Po "MemTotal:\s+\K\d+") -lt $MIN_PARALLEL_BUILD_RAM_KB ]]; then
        printf "\nRAM is smaller than 16 GB. Parallel build will be disabled for stability.\n\n"
        export COLCON_EXTRA_ARGS="${COLCON_EXTRA_ARGS} --executor sequential"
    fi

    ## For people with the old version of makepkg.conf
    unset CPPFLAGS
    ## For people with the new version of makepkg.conf
    CFLAGS=$(sed "s/-Wp,-D_FORTIFY_SOURCE=2\s//g" <(echo $CFLAGS))
    CXXFLAGS=$(sed "s/-Wp,-D_FORTIFY_SOURCE=2\s//g" <(echo $CXXFLAGS))

    # Build
    colcon build --merge-install ${COLCON_EXTRA_ARGS}
}

package() {
    mkdir -p $pkgdir/opt/ros2/galactic
    cp -r $srcdir/install/* $pkgdir/opt/ros2/galactic/
}
