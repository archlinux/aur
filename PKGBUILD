# Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=ardupilot-copter-sitl
pkgver=4.0.3
pkgdesc="Advanced, Fully-Featured, and Reliable Autopilot Software (Copter,
SITL)"
url='https://ardupilot.org'
arch=('i686' 'x86_64')
pkgrel=2
license=('GPLv3')
provides=('ardupilot-sitl')
makedepends=('waf' 'python-setuptools')

# Deps taken from:
# https://github.com/ArduPilot/ardupilot/blob/master/Tools/environment_install/install-prereqs-ubuntu.sh
python_depends=(
    python-future
    python-lxml
    python-pymavlink
    python-mavproxy
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
        "libcanard::https://github.com/ArduPilot/libcanard/archive/99163fc2369e5e5f75f8473f0b950b3418830d3f.tar.gz"
        "mavlink::https://github.com/ArduPilot/mavlink/archive/d2cc7dbff67f8c318a40e1ef57a99488b4737fab.tar.gz"
        "uavcan::https://github.com/ArduPilot/uavcan/archive/3ef4b88d96466bbcf886f74d0ae169a4c8c1bdb0.tar.gz"
       )
sha256sums=('0dde0a2ab951054831e669257468ee3db784317ea515b36f05e3cf08ef3f9021'
            'c09b0342a77ecd9ea99331d54f51edd74b0050bd7575d4abee3a484bdcdee0b1'
            '880d31b95b0d1fafbb7d2dd14eccfcf1668dfcf888d15323c93388d3eda0e756'
            'f9638099720152f332b33bd26de24bde9c14d8afae24aa19e4e8da485145c84e'
           )

_pkgname=ardupilot-Copter

prepare() {
    cd "$srcdir"
    mv -n libcanard-99163fc2369e5e5f75f8473f0b950b3418830d3f/* \
          "${_pkgname}-${pkgver}/modules/libcanard"
    mv -n mavlink-d2cc7dbff67f8c318a40e1ef57a99488b4737fab/* \
          "${_pkgname}-${pkgver}/modules/mavlink"
    mv -n uavcan-3ef4b88d96466bbcf886f74d0ae169a4c8c1bdb0/* \
          "${_pkgname}-${pkgver}/modules/uavcan"
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
