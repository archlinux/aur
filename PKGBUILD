# Maintainer: Oystein Sture <oysstu at gmail.com>

pkgname=ros2-kilted-base
pkgver=2025.05.23
pkgrel=2
_rosdist="Kilted Kaiju"
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
    'nlohmann-json'
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
  'rust'
)
conflicts=(
  "ros2-${_rosdist_short}"
)
source=(
    "https://github.com/ros2/ros2/archive/release-${_rosdist_short}-${pkgver//.}.tar.gz"
    "ros2-variants-0.12.0.tar.gz::https://github.com/ros2/variants/archive/0.12.0.tar.gz"
    "console_bridge_vendor_cmake4.patch"
    "fastdds.patch"
    "mcap_vendor_cstdint.patch"
    "rosidl_cstdint.patch"
)
sha256sums=('79ab777f61b6928933d02c4560f3a6ce00edb0b57521947a450170fb1b03b567'
            '5089bf2dea8368020243d40a2b513405cd060aacc42de6fae2289c1a87f74f99'
            'd2b905b6dccc972cdc83a9c1410bf15494dcc22c888bb2ccf36497b25bd9134b'
            '42228a501fb2647c5c127906eed329145d4a1d81fe626e50e80c6a4cc53729e3'
            'f2ac0967f508f6a4f1fd4f278800e64052127859ee3e21cdf1b467b3ffe7563f'
            '23718705092c81860e50182341c006e0addcbec61c6b87c7f744e9185740b21c')

# Uncomment this if zenoh/transport_tls is needed in zenoh_cpp_vendor
# TODO: find a way to disable LTO for only the zenoh_cpp_vendor package
#options=(!lto)

prepare() {
    # Clone the repos
    printf "Cloning ros2 repositories\n"
    mkdir -p "$srcdir/ros2/src"
    vcs import "$srcdir/ros2/src" < $srcdir/ros2-release-${_rosdist_short}-${pkgver//.}/ros2.repos

    printf "Patching sources\n"

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

    # Patches for iceoryx cpptoml dependency
    git -C "$srcdir/ros2/src/eclipse-iceoryx/iceoryx" checkout .
    git -C "$srcdir/ros2/src/eclipse-iceoryx/iceoryx" cherry-pick 2a2c00bbbc3d42ff91492f8b16b44289c4dc4e58
    git -C "$srcdir/ros2/src/eclipse-iceoryx/iceoryx" cherry-pick a3458f823008ffc65868e884b82a3da5a93366f9
    git -C "$srcdir/ros2/src/eclipse-iceoryx/iceoryx" cherry-pick b99ac0c434e799b5b03087ec38a6709d7bbedb63

    # Patches for rmw_zenoh
    git -C "$srcdir/ros2/src/ros2/rmw_zenoh" checkout .
    git -C "$srcdir/ros2/src/ros2/rmw_zenoh" cherry-pick -n 5199759f9d1849affc1e5236f0cf24c65c70e00b
    git -C "$srcdir/ros2/src/ros2/rmw_zenoh" cherry-pick -n fce38ddb99358dad479a184442292682c8590423

    # Disable the zenoh/transport_tls feature (TLS/QUIC secure transports)
    # This is because GCC LTO is incompatible with the LLVM LTO
    # Disable LTO if you need this feature (see options comment above).
    # https://github.com/ros2/rmw_zenoh/issues/624
    sed -i 's/ zenoh\/transport_tls//' "$srcdir/ros2/src/ros2/rmw_zenoh/zenoh_cpp_vendor/CMakeLists.txt"
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
