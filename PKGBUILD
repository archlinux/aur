# Maintainer: Oystein Sture <oysstu at gmail.com>

pkgname=ros2-jazzy-base
pkgver=2024.07.05
pkgrel=6
_rosdist="Jazzy Jalisco"
_rosdist_short_upper=${_rosdist%% *}
_rosdist_short=${_rosdist_short_upper,}
pkgdesc="A set of software libraries and tools for building robot applications (${_rosdist}, base variant)"
url="https://index.ros.org/p/ros_base/#${_rosdist_short}"
arch=('any')
license=('Apache')
depends=(
    'asio'
    'bullet'
    'cmake'
    'eigen'
    'git'
    'libyaml'
    'lttng-ust'
    'orocos-kdl'
    'pybind11'
    'python'
    'python-colcon-common-extensions'
    'python-lark-parser'
    'python-netifaces'
    'python-numpy'
    'python-psutil'
    'python-yaml'
    'spdlog'
    'tinyxml2'
)
makedepends=(
  'python-rosinstall_generator'
  'python-vcstool'
)
source=(
    "https://github.com/ros2/ros2/archive/release-${_rosdist_short}-${pkgver//.}.tar.gz"
    "ros2-variants-0.11.0.tar.gz::https://github.com/ros2/variants/archive/0.11.0.tar.gz"
)
sha256sums=('e6e31d637d13eade09db85789ffc213c075784136cce159220ae6874f35136c3'
            'e04bf7430ebdc670b4b0ee4722db2966fb1e53d8881e9cb66df6aa381f2448d9')

prepare() {
    # Clone the repos
    printf "Cloning ros2 repositories\n"
    mkdir -p "$srcdir/ros2/src"
    vcs import "$srcdir/ros2/src" < $srcdir/ros2-release-${_rosdist_short}-${pkgver//.}/ros2.repos

    printf "Patching sources\n"

    # https://github.com/ros/urdfdom/pull/205
    git -C "$srcdir/ros2/src/ros/urdfdom" cherry-pick -n 483ff92a7e631283117ca3d421d58e146c8b6d21

    # https://github.com/ros/urdfdom_headers/pull/79
    git -C "$srcdir/ros2/src/ros/urdfdom_headers" config remote.oysstu.url >&- || git -C "$srcdir/ros2/src/ros/urdfdom_headers" remote add oysstu "https://github.com/oysstu/urdfdom_headers.git"
    git -C "$srcdir/ros2/src/ros/urdfdom_headers" fetch oysstu
    git -C "$srcdir/ros2/src/ros/urdfdom_headers" merge oysstu/fix/pkgconfig_relocatable
}

build() {
    # For low-mem high core count systems, add the following to disable parallel build
    #export COLCON_EXTRA_ARGS="${COLCON_EXTRA_ARGS} --executor sequential"

    # Remove D_FORTIFY_SOURCE to avoid compilation errors
    CFLAGS=$(sed "s/-Wp,-D_FORTIFY_SOURCE=[0-9]\s//g" <(echo $CFLAGS))
    CXXFLAGS=$(sed "s/-Wp,-D_FORTIFY_SOURCE=[0-9]\s//g" <(echo $CXXFLAGS))

    # Build
    colcon build --packages-up-to ros_base --merge-install ${COLCON_EXTRA_ARGS} --cmake-args -DBUILD_TESTING=OFF

    # Replace all references to srcdir in colcon shell files
     printf "Replace references to srcdir in colcon shell files\n"
    _outdir="$srcdir/install"
    _instdir="/opt/ros/${_rosdist_short}-base"
    grep --include \*.sh --binary-files without-match -rl ${_outdir} . | xargs sed -i 's|'${_outdir}'|'${_instdir}'|g'
}

package() {
    mkdir -p "$pkgdir/opt/ros/${_rosdist_short}-base"
    cp -r "$srcdir/install/*" "$pkgdir/opt/ros/${_rosdist_short}-base/"
}
