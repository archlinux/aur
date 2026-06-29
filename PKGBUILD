# Maintainer: Oystein Sture <oysstu at gmail.com>

pkgname=ros2-jazzy-base
pkgver=2026.06.18
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
  'python-vcs2l'
)
conflicts=(
  "ros2-${_rosdist_short}"
)
source=(
    "https://github.com/ros2/ros2/archive/release-${_rosdist_short}-${pkgver//.}.tar.gz"
    "ros2-variants-0.11.0.tar.gz::https://github.com/ros2/variants/archive/0.11.0.tar.gz"
    "mcap_vendor_cstdint.patch"
)
sha256sums=('11b132de0af6576f24f6cd2cb917a7ee5370d58b959342f0e8f0bc84c694d892'
            'e04bf7430ebdc670b4b0ee4722db2966fb1e53d8881e9cb66df6aa381f2448d9'
            'f2ac0967f508f6a4f1fd4f278800e64052127859ee3e21cdf1b467b3ffe7563f')

prepare() {
    # Clone the repos
    printf "Cloning ros2 repositories\n"
    mkdir -p "$srcdir/ros2/src"
    vcs import "$srcdir/ros2/src" < $srcdir/ros2-release-${_rosdist_short}-${pkgver//.}/ros2.repos

    printf "Patching sources\n"

    # https://github.com/ros/urdfdom/pull/205
    git -C "$srcdir/ros2/src/ros/urdfdom" checkout .
    git -C "$srcdir/ros2/src/ros/urdfdom" cherry-pick -n 483ff92a7e631283117ca3d421d58e146c8b6d21

    # https://github.com/ros2/orocos_kdl_vendor/pull/39
    git -C "$srcdir/ros2/src/ros2/orocos_kdl_vendor" cherry-pick -n 76ee1ce6c49a28a42c433a9b6fd20053605ccaf7

    # https://github.com/foxglove/mcap/pull/1371
    git -C "$srcdir/ros2/src/ros2/rosbag2" checkout "mcap_vendor/src/main.cpp"
    git -C "$srcdir/ros2/src/ros2/rosbag2" apply "$srcdir/mcap_vendor_cstdint.patch"
}

build() {
    # For low-mem high core count systems, add the following to disable parallel build
    #export COLCON_EXTRA_ARGS="${COLCON_EXTRA_ARGS} --executor sequential"

    # Remove D_FORTIFY_SOURCE to avoid compilation errors
    CFLAGS=$(sed "s/-Wp,-D_FORTIFY_SOURCE=[0-9]\s//g" <(echo $CFLAGS))
    CXXFLAGS=$(sed "s/-Wp,-D_FORTIFY_SOURCE=[0-9]\s//g" <(echo $CXXFLAGS))

    export CMAKE_POLICY_VERSION_MINIMUM=3.5

    # Build
    # THIRDPARTY_Asio: This forces Fast-DDS to use its internal ASIO version.
    #                  They were using deprecated ASIO functionality, which is now removed.
    #                  See the following issue: https://github.com/eProsima/Fast-DDS/issues/5726
    colcon build --packages-up-to ros_base --merge-install ${COLCON_EXTRA_ARGS} --cmake-args \
        -DBUILD_TESTING=OFF \
        -DTHIRDPARTY_Asio=FORCE \
        -DRMW_IMPLEMENTATION=rmw_fastrtps_cpp \
        -DCMAKE_IGNORE_PATH="/usr/share/orocos_kdl/cmake/"

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
