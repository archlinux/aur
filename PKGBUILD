# Maintainer: Kino <cybao292261@163.com>

pkgname=ros2-lyrical
pkgver=2026.06.23
pkgrel=1
pkgdesc="A set of software libraries and tools for building robot applications"
url="https://docs.ros.org/en/lyrical/"
arch=('x86_64')
license=('Apache-2.0')
depends=(
    'ros2-arch-deps'
    'qt6-base'
    'nvidia-cg-toolkit'
    'assimp'
    'gmock'
    'lttng-ust'
    'pyside6'
    'python-pyqt6'
    'python-pyqt6-sip'
    'pyqt-builder'
    'orocos-kdl'
    'zenoh-cpp'
)
makedepends=('cmake' 'ninja' 'git' 'gcc')
optdepends=('gz-harmonic: For Gazebo Simulation support')
conflicts=('ros2-lyrical-base')
source=(
    "ros2::git+https://github.com/ros2/ros2#tag=release-lyrical-${pkgver//.}"
)
sha256sums=('SKIP')
install=ros2-lyrical.install

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

    # Use system zenoh
    cd $srcdir/ros2/src/ros2/rmw_zenoh/zenoh_cpp_vendor/
    sed -i 's/option(USE_SYSTEM_ZENOH "[^"]*" OFF)/option(USE_SYSTEM_ZENOH "Use non-vendored zenoh from the system" ON)/' CMakeLists.txt
}

build() {
    # Disable parallel build if RAM is low
    MIN_PARALLEL_BUILD_RAM_KB=16000000
    if [[ $(free | grep -Po "Mem:\s+\K\d+") -lt $MIN_PARALLEL_BUILD_RAM_KB && $(grep MemTotal /proc/meminfo | grep -Po "MemTotal:\s+\K\d+") -lt $MIN_PARALLEL_BUILD_RAM_KB ]]; then
        printf "\nRAM is smaller than 16 GB. Parallel build will be disabled for stability.\n\n"
        export COLCON_EXTRA_ARGS="${COLCON_EXTRA_ARGS} --executor sequential"
    fi

    ## For people with the new version of makepkg.conf
    CFLAGS=$(sed "s/-Wp,-D_FORTIFY_SOURCE=[23]\s//g" <(echo $CFLAGS))
    CXXFLAGS=$(sed "s/-Wp,-D_FORTIFY_SOURCE=[23]\s//g" <(echo $CXXFLAGS))
    ## Fix missing cstdiint headers in many packages
    CXXFLAGS+=" --include=cstdint -w"

    # Build all packages
    colcon build --merge-install ${COLCON_EXTRA_ARGS} --packages-ignore lttngpy \
      --cmake-args \
      -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
      -DBUILD_TESTING=OFF \
      -GNinja -Wno-dev
}

package() {
    mkdir -p $pkgdir/opt/ros/lyrical
    cp -r $srcdir/install/* $pkgdir/opt/ros/lyrical/
}
