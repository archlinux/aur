#!/usr/hint/bash
# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>
# shellcheck disable=SC2034,SC2154 # allow unused/uninitialized variables.

_name="meshlab"
pkgname="$_name-git"
pkgver=2020.03.r36.gd0fa7a31f
pkgrel=2
pkgdesc="System for processing and editing of unstructured 3D models arising in 3D scanning (qt5 version)"
arch=('i686' 'x86_64')
url="https://www.meshlab.net"
conflicts=('meshlab')
provides=('meshlab')
license=('GPL2')
depends=('bzip2' 'desktop-file-utils' 'glew' 'glu' 'openssl-1.0' 'qt5-base' 'qt5-declarative' 'qt5-script' 'qt5-xmlpatterns')
makedepends=('cmake' 'eigen3' 'ninja' 'git' 'muparser' 'levmar' 'lib3ds' 'mpir')
optdepends=('u3d: for U3D and IDTF file support'
            'lib3ds: for Autodesk`s 3D-Studio r3 and r4 .3DS file support'
            'levmar: for isoparametrization and mutualcorrs plugins'
            'muparser: for filer_func plugins'
            'mpir: for Constructive Solid Geometry operation filters')
#also create openctm(aur) jhead-lib structuresynth-lib to handle last dep
source=("$_name::git+https://github.com/cnr-isti-vclab/meshlab.git"
        "vcglib::git+https://github.com/cnr-isti-vclab/vcglib.git"
        "desktop.patch"
        "meshlab.desktop")
sha256sums=('SKIP'
            'SKIP'
            '1690f70118c985da61595b615635472144c4d0b3ddcefb515b9f230c106961b5'
            '030ab1dcafb7d793bed3bc455497208addadf1091a4619576fe7e044aed4231a')

prepare() {
  git -C "${srcdir}/${_name}" submodule init
  git -C "${srcdir}/${_name}" config submodule.vcglib.url "$srcdir"/vcglib
  git -C "${srcdir}/${_name}" submodule update
  git -C "${srcdir}/${_name}" apply -v "${srcdir}/desktop.patch"
}

pkgver() {
  git -C "${srcdir}/${_name}" describe --long --tags | sed 's/Meshlab-//g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  local cmake_flags=( '-DALLOW_SYSTEM_QHULL=OFF'
                      '-DCMAKE_INSTALL_PREFIX=/usr'
                    )
  cmake "${cmake_flags[@]}" -G Ninja -B "${srcdir}/build" -S "${srcdir}/meshlab/src"
# shellcheck disable=SC2086 # allow MAKEFLAGS to split when passing multiple flags.
  ninja ${MAKEFLAGS:--j1} -C "${srcdir}/build"
}

package() {
  DESTDIR="$pkgdir" ninja -C "${srcdir}/build" install
}

# vim:set ts=2 sw=2 et:
