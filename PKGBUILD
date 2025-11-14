# Maintainer: Oystein Sture <oysstu at gmail.com>

pkgname=ros2-kilted-git
pkgver=20251114.085827
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
provides=("ros2-kilted-base" "ros2-kilted")
conflicts=("ros2-kilted-base" "ros2-kilted")
source=(
    "git+https://github.com/ros2/ros2.git#branch=${_rosdist_short}"
    mcap_vendor_cstdint.patch
)
sha256sums=('SKIP'
            'f2ac0967f508f6a4f1fd4f278800e64052127859ee3e21cdf1b467b3ffe7563f')
options=(!debug !lto)

prepare() {
    # Clone the repos
    printf "Cloning ros2 repositories\n"
    mkdir -p "$srcdir/ros2/src"
    vcs import --retry 10 "$srcdir/ros2/src" < $srcdir/ros2/ros2.repos

    printf "Patching sources\n"

    git -C "$srcdir/ros2/src/ros2/rosbag2" apply "$srcdir/mcap_vendor_cstdint.patch"
}

pkgver() {
    cd "$srcdir/ros2/src"

    latest=0
    for d in */ */*/ ; do
        [ -d "$d/.git" ] || continue
        ts=$(git -C "$d" show -s --format="%ct" HEAD 2>/dev/null) || continue
        (( ts > latest )) && latest=$ts
    done

    date -u -d "@$latest" +"%Y%m%d.%H%M%S"
}

build() {
    # For low-mem high core count systems, add the following to disable parallel build
    #export COLCON_EXTRA_ARGS="${COLCON_EXTRA_ARGS} --executor sequential"

    # Remove D_FORTIFY_SOURCE to avoid compilation errors
    CFLAGS=$(sed "s/-Wp,-D_FORTIFY_SOURCE=[0-9]\s//g" <(echo $CFLAGS))
    CXXFLAGS=$(sed "s/-Wp,-D_FORTIFY_SOURCE=[0-9]\s//g" <(echo $CXXFLAGS))

    export CMAKE_POLICY_VERSION_MINIMUM=3.5

    # Build
    colcon build --merge-install ${COLCON_EXTRA_ARGS} --cmake-args -DBUILD_TESTING=OFF -DCMAKE_IGNORE_PATH="/usr/share/orocos_kdl/cmake/"

    # Replace all references to srcdir in colcon shell files
     printf "Replace references to srcdir in colcon shell files\n"
    _outdir="$srcdir/install"
    _instdir="/opt/ros/${_rosdist_short}"
    grep --include \*.sh --binary-files without-match -rl ${_outdir} . | xargs sed -i 's|'${_outdir}'|'${_instdir}'|g'
}

package() {
    mkdir -p "${pkgdir}/opt/ros"
    cp -r "${srcdir}/install" "${pkgdir}/opt/ros/${_rosdist_short}"
}

