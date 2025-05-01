# Maintainer: Oystein Sture <oysstu at gmail.com>

pkgname=ros2-jazzy-base
pkgver=2025.04.30
pkgrel=1
_rosdist="Jazzy Jalisco"
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
    'pybind11'
    'python'
    'python-colcon-common-extensions'
    'python-lark-parser'
    'python-netifaces'
    'python-numpy'
    'python-psutil'
    'python-yaml'
    'tinyxml2'
    'yaml-cpp'
)
makedepends=(
  'python-rosinstall_generator'
  'python-vcstool'
)
conflicts=(
  "ros2-${_rosdist_short}"
)
source=(
    "https://github.com/ros2/ros2/archive/release-${_rosdist_short}-${pkgver//.}.tar.gz"
    "ros2-variants-0.11.0.tar.gz::https://github.com/ros2/variants/archive/0.11.0.tar.gz"
    "orocos_kdl_vendor_cmake4.patch::https://github.com/ros2/orocos_kdl_vendor/pull/35.patch"
    "console_bridge_vendor_cmake4.patch"
    "fastdds.patch"
    "urdfdom_cstdint.patch"
    "mcap_vendor_cstdint.patch"
    "rosidl_cstdint.patch::https://github.com/ros2/rosidl/pull/864.patch"
)
sha256sums=('ca1006255e53552e7ba06e3b5ae943e54bbf32d8654944345d7f583e51426ec5'
            'e04bf7430ebdc670b4b0ee4722db2966fb1e53d8881e9cb66df6aa381f2448d9'
            '896cca4533470216bf1be24daa6dd22ed781fab6f457919e8c2a56726e04aaab'
            'd2b905b6dccc972cdc83a9c1410bf15494dcc22c888bb2ccf36497b25bd9134b'
            'c3362474bb6965fdb72746cbb9aa50e9e6b0788def4818aa4756164e881257fd'
            '4f453203b46ab40b5b9611eceb1b006af2a9b0b8d11a402a05fe225c5da1a8f3'
            'f2ac0967f508f6a4f1fd4f278800e64052127859ee3e21cdf1b467b3ffe7563f'
            '23718705092c81860e50182341c006e0addcbec61c6b87c7f744e9185740b21c')

prepare() {
    # Clone the repos
    printf "Cloning ros2 repositories\n"
    mkdir -p "$srcdir/ros2/src"
    vcs import "$srcdir/ros2/src" < $srcdir/ros2-release-${_rosdist_short}-${pkgver//.}/ros2.repos

    printf "Patching sources\n"

    # https://github.com/ros/urdfdom/pull/205
    git -C "$srcdir/ros2/src/ros/urdfdom" checkout .
    git -C "$srcdir/ros2/src/ros/urdfdom" cherry-pick -n 483ff92a7e631283117ca3d421d58e146c8b6d21
    git -C "$srcdir/ros2/src/ros/urdfdom" apply "$srcdir/urdfdom_cstdint.patch"

    # https://github.com/ros2/orocos_kdl_vendor/pull/35
    git -C "$srcdir/ros2/src/ros2/orocos_kdl_vendor" checkout orocos_kdl_vendor/CMakeLists.txt
    patch -d "$srcdir/ros2/src/ros2/orocos_kdl_vendor" -p1 < ${srcdir}/orocos_kdl_vendor_cmake4.patch

    # https://github.com/ros/console_bridge/issues/100
    git -C "$srcdir/ros2/src/ros2/console_bridge_vendor" checkout CMakeLists.txt
    git -C "$srcdir/ros2/src/ros2/console_bridge_vendor" apply "$srcdir/console_bridge_vendor_cmake4.patch"

    # https://github.com/eProsima/Fast-DDS/issues/5790
    # https://github.com/eProsima/Fast-DDS/issues/5792
    git -C "$srcdir/ros2/src/eProsima/Fast-DDS" checkout .
    git -C "$srcdir/ros2/src/eProsima/Fast-DDS" apply "$srcdir/fastdds.patch"

    # https://github.com/foxglove/mcap/pull/1371
    git -C "$srcdir/ros2/src/ros2/rosbag2" checkout "mcap_vendor/src/main.cpp"
    git -C "$srcdir/ros2/src/ros2/rosbag2" apply "$srcdir/mcap_vendor_cstdint.patch"

    # https://github.com/ros2/rosidl/pull/864
    git -C "$srcdir/ros2/src/ros2/rosidl" checkout .
    git -C "$srcdir/ros2/src/ros2/rosidl" apply "$srcdir/rosidl_cstdint.patch"
}

build() {
    # For low-mem high core count systems, add the following to disable parallel build
    #export COLCON_EXTRA_ARGS="${COLCON_EXTRA_ARGS} --executor sequential"

    # Remove D_FORTIFY_SOURCE to avoid compilation errors
    CFLAGS=$(sed "s/-Wp,-D_FORTIFY_SOURCE=[0-9]\s//g" <(echo $CFLAGS))
    CXXFLAGS=$(sed "s/-Wp,-D_FORTIFY_SOURCE=[0-9]\s//g" <(echo $CXXFLAGS))

    # Build
    # THIRDPARTY_Asio: This forces Fast-DDS to use its internal ASIO version.
    #                  They were using deprecated ASIO functionality, which is now removed.
    #                  See the following issue: https://github.com/eProsima/Fast-DDS/issues/5726
    colcon build --packages-up-to ros_base --merge-install ${COLCON_EXTRA_ARGS} --cmake-args -DBUILD_TESTING=OFF -DTHIRDPARTY_Asio=FORCE -DCMAKE_IGNORE_PATH="/usr/share/orocos_kdl/cmake/"

    # Replace all references to srcdir in colcon shell files
     printf "Replace references to srcdir in colcon shell files\n"
    _outdir="$srcdir/install"
    _instdir="/opt/ros/${_rosdist_short}-base"
    grep --include \*.sh --binary-files without-match -rl ${_outdir} . | xargs sed -i 's|'${_outdir}'|'${_instdir}'|g'
}

package() {
    mkdir -p "${pkgdir}/opt/ros"
    cp -r "${srcdir}/install" "${pkgdir}/opt/ros/${_rosdist_short}"

}
