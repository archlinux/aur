# Maintainer: Mohammad Mostafa Farzan <m2_farzan@yahoo.com>
# Contributor: mjbogusz <mjbogusz+github@gmail.com>
# Contributor: yuanyuyuan <az6980522@gmail.com>
# Contributor: Rémy B. (github.com/KirrimK)
# Contributor: Renato Caldas (github.com/rmsc)
# Acknowledgment: This work is hugely based on `ros2-arch-deps` AUR
# package, maintained by T. Borgert.

pkgname=ros2-galactic
pkgver=2021.07.16
pkgrel=5
pkgdesc="A set of software libraries and tools for building robot applications"
url="https://docs.ros.org/en/galactic/"
arch=('any')
license=('Apache')
depends=(
    'ros2-arch-deps'
    'ros2-pyqt5-sip-compat'
    'gmock'
    'sip4'
)
source=(
    "ros2::git+https://github.com/ros2/ros2#tag=release-galactic-20210716"
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
    # Check locale
    locale | grep LANG | grep UTF-8
    if [[ $? -ne 0 ]]; then
        printf "Locale must support UTF-8. See https://wiki.archlinux.org/index.php/locale
        or https://wiki.archlinux.org/index.php/locale ."
        exit 1
    fi

    # Clone the repos
    mkdir -p $srcdir/ros2/src
    vcs import $srcdir/ros2/src < $srcdir/ros2/ros2.repos

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
    ## ros1_bridge
    git -C $srcdir/ros2/src/ros2/ros1_bridge revert 81b7610568286ec7b390c64cf6207b362d0a6550 --no-edit
    ## rcl_logging
    git -C $srcdir/ros2/src/ros2/rcl_logging cherry-pick 77b5b2a6c948a6db1986501edc83f12ceadedba3
    ## rviz_assimp_vendor
    git -C $srcdir/ros2/src/ros2/rviz checkout .
    git -C $srcdir/ros2/src/ros2/rviz apply $srcdir/rviz_assimp_vendor.patch
}

build() {
    # Disable parallel build if RAM is low
    if [[ $(free | grep -Po "Mem:\s+\K\d+") < 16000000 ]]; then
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
