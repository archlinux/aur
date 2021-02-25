# Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=ardupilot-copter-sitl
pkgver=4.0.7
pkgdesc="Advanced, Fully-Featured, and Reliable Autopilot Software (Copter,
SITL)"
url='https://ardupilot.org'
arch=('i686' 'x86_64')
pkgrel=1
license=('GPLv3')
provides=('ardupilot-sitl')
makedepends=('waf' 'python-setuptools')

# Deps taken from:
# https://github.com/ArduPilot/ardupilot/blob/master/Tools/environment_install/install-prereqs-ubuntu.sh
python_depends=(
    python-future
    python-lxml
    python-pymavlink
    mavproxy
    python-pexpect
    python-pygame
    python-intelhex
)

px4_depends=(
    python-argparse
    openocd
    flex
    bison
    ncurses
    autoconf
    texinfo
    libftdi
    zlib
    zip
    genromfs
    python-empy
    cmake
)
arm_linux_depends=(
    #arm-linux-gnueabihf-gcc
    #arm-linux-gnueabihf-pkg-config
)
sitl_depends=(
    libtool
    libxml2
    libxslt
    python
    python-matplotlib
    python-pyserial
    python-scipy
    #python-opencv
    python-numpy
    python-pyparsing
    xterm
    lcov
    gcovr
    csfml
    sfml
    python-yaml
)
submodule_depends=(
    chibios
    benchmark
    gtest
    #libcanard
    #libuavcan
    #mavlink
    waf
)
depends=(
    ${python_depends[@]}
    ${px4_depends[@]}
    ${arm_linux_depends[@]}
    ${sitl_depends[@]}
    ${submodule_depends[@]}
    lsb-release
    python-wxpython
)
source=("${pkgname}-${pkgver}::https://github.com/ArduPilot/ardupilot/archive/Copter-${pkgver}.tar.gz"
        "13921.patch"::"https://github.com/ArduPilot/ardupilot/pull/13921.patch"
        "libcanard::https://github.com/ArduPilot/libcanard/archive/99163fc2369e5e5f75f8473f0b950b3418830d3f.tar.gz"
        "mavlink::https://github.com/ArduPilot/mavlink/archive/6e08c0757a1e90c461a8caf1a8d5b724abf3ca57.tar.gz"
        "uavcan::https://github.com/ArduPilot/uavcan/archive/3ef4b88d96466bbcf886f74d0ae169a4c8c1bdb0.tar.gz"
       )
sha256sums=('26defe4a6d73da802ec152ff9ab9ad4e2673a16ff86f053e59e5369b6f67c355'
            '8237044e8dc5ef8e3159a01c765831a3b5a8d7c3fab7941f0ce8d403ebfe403b'
            'c09b0342a77ecd9ea99331d54f51edd74b0050bd7575d4abee3a484bdcdee0b1'
            '1d93d928503561f2ccb307245f6789c3437ad469d0efba637e97a90fb49e5aa8'
            'f9638099720152f332b33bd26de24bde9c14d8afae24aa19e4e8da485145c84e'
           )

_pkgname=ardupilot-Copter

prepare() {
    cd "$srcdir"
    mv -n libcanard-99163fc2369e5e5f75f8473f0b950b3418830d3f/* \
          "${_pkgname}-${pkgver}/modules/libcanard"
    mv -n mavlink-6e08c0757a1e90c461a8caf1a8d5b724abf3ca57/* \
          "${_pkgname}-${pkgver}/modules/mavlink"
    mv -n uavcan-3ef4b88d96466bbcf886f74d0ae169a4c8c1bdb0/* \
          "${_pkgname}-${pkgver}/modules/uavcan"
          
    cd "ardupilot-Copter-$pkgver"
    patch --forward --strip=1 --input="${srcdir}/13921.patch"
}

build() {
    cd "$srcdir/${_pkgname}-${pkgver}"
    waf configure --board sitl
    waf copter
}

package() {
    cd "$srcdir/${_pkgname}-${pkgver}"
    DESTDIR="${pkgdir}/" waf install
}
