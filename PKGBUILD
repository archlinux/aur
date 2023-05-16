# Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=ardupilot-copter-sitl
pkgver=4.3.6
pkgdesc="Advanced, Fully-Featured, and Reliable Autopilot Software (Copter,
SITL)"
url='https://ardupilot.org'
arch=('i686' 'x86_64')
pkgrel=1
license=('GPLv3')
provides=('ardupilot-sitl')
makedepends=('waf' 'python-setuptools' 'git')

# Deps taken from:
# https://github.com/ArduPilot/ardupilot/blob/master/Tools/environment_install/install-prereqs-ubuntu.sh
sitl_depends=(
    libtool
    libxml2
    libxslt
    python
    python-pip
    python-setuptools
    python-numpy
    python-pyparsing
    python-psutil
    xterm
    python-matplotlib
    python-pyserial
    python-scipy
    python-opencv
    csfml
    sfml
    python-yaml
    python-wxpython
)
px4_depends=()
arm_linux_depends=(
    #arm-linux-gnueabihf-gcc
    #arm-linux-gnueabihf-pkg-config
)
coverage_depends=(
    lcov
    gcovr
)
python_depends=(
    python-future
    python-lxml
    python-pymavlink
    mavproxy
    python-pexpect
    flake8
    python-geocoder
    python-empy
    python-click
    python-decorator
    python-pygame
    python-intelhex
)
depends=(
    ${sitl_depends[@]}
    ${px4_depends[@]}
    ${arm_linux_depends[@]}
    ${coverage_depends[@]}
    ${python_depends[@]}
    ${submodule_depends[@]}
    lsb-release
)
source=("${pkgname}-${pkgver}::git+https://github.com/ArduPilot/ardupilot.git#tag=Copter-${pkgver}"
        "${pkgname}-libuavcan::git+https://github.com/DroneCAN/libuavcan.git"
        "${pkgname}-waf::git+https://github.com/ArduPilot/waf.git"
        "${pkgname}-benchmark::git+https://github.com/google/benchmark.git"
        "${pkgname}-mavlink::git+https://github.com/ArduPilot/mavlink.git"
        "${pkgname}-googletest::git+https://github.com/ArduPilot/googletest.git"
        "${pkgname}-ChibiOS::git+https://github.com/ArduPilot/ChibiOS.git"
        "${pkgname}-gsoap::git+https://github.com/ArduPilot/gsoap.git"
        "${pkgname}-DSDL::git+https://github.com/DroneCAN/DSDL.git"
        "${pkgname}-CrashDebug::git+https://github.com/ardupilot/CrashDebug.git"
        "${pkgname}-pydronecan::git+https://github.com/DroneCAN/pydronecan.git"
        "${pkgname}-dronecan_dsdlc::git+https://github.com/DroneCAN/dronecan_dsdlc.git"
        "${pkgname}-libcanard::git+https://github.com/DroneCAN/libcanard.git"
        "uint16_t.patch::https://github.com/ArduPilot/ardupilot/pull/23803.patch"
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
)

prepare() {
    cd "$srcdir/${pkgname}-${pkgver}"

    git submodule init

    git config submodule."modules/uavcan".url "${srcdir}/${pkgname}"-libuavcan
    git config submodule."modules/waf".url "${srcdir}/${pkgname}"-waf
    git config submodule."modules/gbenchmark".url "${srcdir}/${pkgname}"-benchmark
    git config submodule."modules/mavlink".url "${srcdir}/${pkgname}"-mavlink
    git config submodule."gtest".url "${srcdir}/${pkgname}"-googletest
    git config submodule."modules/ChibiOS".url "${srcdir}/${pkgname}"-ChibiOS
    git config submodule."modules/gsoap".url "${srcdir}/${pkgname}"-gsoap
    git config submodule."modules/DroneCAN/DSDL".url "${srcdir}/${pkgname}"-DSDL
    # git config submodule."modules/CrashDebug".url "${srcdir}/${pkgname}"-CrashDebug
    git config submodule."modules/DroneCAN/pydronecan".url "${srcdir}/${pkgname}"-pydronecan
    git config submodule."modules/DroneCAN/dronecan_dsdlc".url "${srcdir}/${pkgname}"-dronecan_dsdlc
    git config submodule."modules/DroneCAN/libcanard".url "${srcdir}/${pkgname}"-libcanard

    git -c protocol.file.allow=always submodule update --init --recursive

    patch -Np1 -i "${srcdir}"/uint16_t.patch
}

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    waf configure --board sitl
    waf copter
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    DESTDIR="${pkgdir}/" waf install
}
