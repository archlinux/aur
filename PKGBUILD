# Maintainer: Oystein Sture <oysstu at gmail.com>

pkgname=ros2-lyrical-base
pkgver=2026.08.07
pkgrel=1
_rosdist="Lyrical Luth"
_rosdist_short_upper=${_rosdist%% *}
_rosdist_short=${_rosdist_short_upper,}
pkgdesc="A set of software libraries and tools for building robot applications (${_rosdist}, base variant)"
url="https://index.ros.org/p/ros_base/#${_rosdist_short}"
arch=('any')
license=('Apache-2.0')
depends=(
    'asio'
    'bullet'
    'eigen'
    'libyaml'
    'lttng-ust'
    'nlohmann-json'
    'orocos-kdl'
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
    'zenoh-cpp'
)
makedepends=(
  'cmake'
  'git'
  'python-rosinstall_generator'
  'python-vcs2l'
)
conflicts=(
  "ros2-${_rosdist_short}"
)
source=(
    "https://github.com/ros2/ros2/archive/release-${_rosdist_short}-${pkgver//.}.tar.gz"
    "ros2-variants-0.13.0.tar.gz::https://github.com/ros2/variants/archive/0.13.0.tar.gz"
    "colcon.meta"
)
sha256sums=('6906704f349210d956babf13f12114f527ab525ae8f2d283ec834d6bea51617e'
            'd14cc0ec092511b26cb2be60200eaeb59ee1b1d21750b7d63fe98f476e6db89f'
            'b9de02644cd80ffee220401ca4b2c00290f4329d655fa06491e0f218700f61ad')

options=(!debug)

prepare() {
    # Clone the repos
    printf "Cloning ros2 repositories\n"
    mkdir -p "$srcdir/ros2/src"
    vcs import "$srcdir/ros2/src" < $srcdir/ros2-release-${_rosdist_short}-${pkgver//.}/ros2.repos
}

build() {
    # For low-mem high core count systems, add the following to disable parallel build
    #export COLCON_EXTRA_ARGS="${COLCON_EXTRA_ARGS} --executor sequential"

    # Remove D_FORTIFY_SOURCE to avoid compilation errors
    CFLAGS=$(sed "s/-Wp,-D_FORTIFY_SOURCE=[0-9]\s//g" <(echo $CFLAGS))
    CXXFLAGS=$(sed "s/-Wp,-D_FORTIFY_SOURCE=[0-9]\s//g" <(echo $CXXFLAGS))

    export CMAKE_POLICY_VERSION_MINIMUM=3.5
    export CXXFLAGS="${CXXFLAGS} -w"

    # Build
    colcon build --metas $srcdir/colcon.meta --packages-up-to ros_base --merge-install ${COLCON_EXTRA_ARGS} --cmake-args -DBUILD_TESTING=OFF -Wno-dev

    # Replace all references to srcdir in colcon shell files
     printf "Replace references to srcdir in colcon shell files\n"
    _outdir="$srcdir/install"
    _instdir="/opt/ros/${_rosdist_short}-base"
    grep --include \*.sh --binary-files without-match -rl ${_outdir} . | xargs sed -i 's|'${_outdir}'|'${_instdir}'|g'
}

package() {
    mkdir -p "${pkgdir}/opt/ros"
    cp -r "${srcdir}/install" "${pkgdir}/opt/ros/${_rosdist_short}"

    # Merge packages installed into opt into regular installation
    if [ -d "${pkgdir}/opt/ros/${_rosdist_short}/opt" ]; then
        for dir in ${pkgdir}/opt/ros/${_rosdist_short}/opt/*; do
            [ -d "$dir" ] && cp -r "$dir"/* "${pkgdir}/opt/ros/${_rosdist_short}/"
        done
    fi
    rm -rf ${pkgdir}/opt/ros/${_rosdist_short}/opt
}
