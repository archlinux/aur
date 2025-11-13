# Maintainer: Oystein Sture <oysstu at gmail.com>

pkgname=ros2-kilted
pkgver=2025.07.28
pkgrel=1
_rosdist="Kilted Kaiju"
_rosdist_short_upper=${_rosdist%% *}
_rosdist_short=${_rosdist_short_upper,}
pkgdesc="A set of software libraries and tools for building robot applications (${_rosdist})"
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
    'libxrandr'
    'libxaw'
    'freetype2'
    'sip4'
    'python-sip4'
    'python-pyqt5'
    'lttng-tools'
    'qt5-base'
    'glu'
    'opencv'
    'qt6-base'
)
makedepends=(
  'python-rosinstall_generator'
  'python-vcstool'
  'rust'
)
provides=("$pkgname-base")
conflicts=("$pkgname-base")
source=(
    "https://github.com/ros2/ros2/archive/release-${_rosdist_short}-${pkgver//.}.tar.gz"
    "ros2-variants-0.12.0.tar.gz::https://github.com/ros2/variants/archive/0.12.0.tar.gz"
    "mcap_vendor_cstdint.patch"
)
sha256sums=('b289c53e97d924209efb9ed9c6f30caafde965fa1c72a039e39a528fcc9045b3'
            '5089bf2dea8368020243d40a2b513405cd060aacc42de6fae2289c1a87f74f99'
            'f2ac0967f508f6a4f1fd4f278800e64052127859ee3e21cdf1b467b3ffe7563f'
    )
# Uncomment this if zenoh/transport_tls is needed in zenoh_cpp_vendor
# TODO: find a way to disable LTO for only the zenoh_cpp_vendor package
#options=(!debug !lto)
options=(!debug)

prepare() {
    # Clone the repos
    printf "Cloning ros2 repositories\n"
    mkdir -p "$srcdir/ros2/src"
    vcs import --retry 10 "$srcdir/ros2/src" < $srcdir/ros2-release-${_rosdist_short}-${pkgver//.}/ros2.repos

    printf "Patching sources\n"

    # https://github.com/eProsima/Fast-DDS/issues/5790
    # https://github.com/eProsima/Fast-DDS/issues/5792
    git -C "$srcdir/ros2/src/eProsima/Fast-DDS" checkout v3.2.3

    # https://github.com/foxglove/mcap/pull/1371
    git -C "$srcdir/ros2/src/ros2/rosbag2" checkout "mcap_vendor/src/main.cpp"
    git -C "$srcdir/ros2/src/ros2/rosbag2" apply "$srcdir/mcap_vendor_cstdint.patch"

    # https://github.com/ros2/rosidl/pull/864
    git -C "$srcdir/ros2/src/ros2/rosidl" cherry-pick -n f02a0f1

    # https://github.com/ros2/orocos_kdl_vendor/pull/39
    git -C "$srcdir/ros2/src/ros2/orocos_kdl_vendor" cherry-pick -n 98a9e0686b58fb4684c77f28c824d86765a58bb9
    
    # https://github.com/ros2/ros2_tracing/pull/194
    git -C "$srcdir/ros2/src/ros2/ros2_tracing" cherry-pick -n 6c5a704

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

    export CMAKE_POLICY_VERSION_MINIMUM=3.5

    # Build
    # THIRDPARTY_Asio: This forces Fast-DDS to use its internal ASIO version.
    #                  They were using deprecated ASIO functionality, which is now removed.
    #                  See the following issue: https://github.com/eProsima/Fast-DDS/issues/5726
    colcon build --merge-install ${COLCON_EXTRA_ARGS} --cmake-args -DBUILD_TESTING=OFF -DCMAKE_IGNORE_PATH="/usr/share/orocos_kdl/cmake/"

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

