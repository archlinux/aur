# Maintainer: Oystein Sture <oysstu at gmail.com>

pkgname=ros2-jazzy-base
pkgver=2025.04.07
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
)
makedepends=(
  'python-rosinstall_generator'
  'python-vcstool'
)
conflicts=(
  "ros2-${_rosdist_short}"
  'orocos-kdl'  # Build failure in python_orocos_kdl_vendor
)
source=(
    "https://github.com/ros2/ros2/archive/release-${_rosdist_short}-${pkgver//.}.tar.gz"
    "ros2-variants-0.11.0.tar.gz::https://github.com/ros2/variants/archive/0.11.0.tar.gz"
    "orocos_kdl_vendor.patch::https://github.com/ros2/orocos_kdl_vendor/pull/35.patch"
)
sha256sums=('2b8694d6773c1fb0767ad3438bf1d98ee6d002d750f32755e4476b19c93d46ae'
            'e04bf7430ebdc670b4b0ee4722db2966fb1e53d8881e9cb66df6aa381f2448d9'
            '896cca4533470216bf1be24daa6dd22ed781fab6f457919e8c2a56726e04aaab')

prepare() {
    # Clone the repos
    printf "Cloning ros2 repositories\n"
    mkdir -p "$srcdir/ros2/src"
    vcs import "$srcdir/ros2/src" < $srcdir/ros2-release-${_rosdist_short}-${pkgver//.}/ros2.repos

    printf "Patching sources\n"

    # https://github.com/ros/urdfdom/pull/205
    git -C "$srcdir/ros2/src/ros/urdfdom" cherry-pick -n 483ff92a7e631283117ca3d421d58e146c8b6d21

    # https://github.com/ros/urdfdom_headers/pull/79
    git -C "$srcdir/ros2/src/ros/urdfdom_headers" cherry-pick -n 94953f0bd332e7a9fc2b54c2179763a00d9ab603

    # https://github.com/ros2/orocos_kdl_vendor/pull/35
    git -C "$srcdir/ros2/src/ros2/orocos_kdl_vendor" checkout orocos_kdl_vendor/CMakeLists.txt
    patch -d "$srcdir/ros2/src/ros2/orocos_kdl_vendor" -p1 < ${srcdir}/orocos_kdl_vendor.patch
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
    colcon build --packages-up-to ros_base --merge-install ${COLCON_EXTRA_ARGS} --cmake-args -DBUILD_TESTING=OFF -DTHIRDPARTY_Asio=FORCE

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
