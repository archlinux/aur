#!/usr/hint/bash
# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>
# shellcheck disable=SC2034,SC2154 # allow unused/uninitialized variables.

#Todo:
#* add external cmake projects to source array and patch src/externla/*.cmake
#* use system wide: levmar, libigl, qhull, structyresynth, libe57, u3d, tinygltf

#Configuration:
#Use: makepkg VAR1=0 VAR2=1 to enable(1) disable(0) a feature
#Use: {yay,paru} --mflags=VAR1=0,VAR2=1
#Use: aurutils --margs=VAR1=0,VAR2=1
#Use: VAR1=0 VAR2=1 pamac

# Use FRAGMENT={commit,tag,brach}=xxx for bisect build
_fragment="#${FRAGMENT:-branch=main}"

# Use CMAKE_FLAGS=xxx:yyy:zzz to define extra CMake flags
[[ -v CMAKE_FLAGS ]] && mapfile -t -d: _cmake_flags < <(echo -n "$CMAKE_FLAGS")

_name="meshlab"
pkgname="$_name-git"
pkgver=2022.02.r226.gca1f5ab1d
pkgrel=1
pkgdesc="System for processing and editing of unstructured 3D models arising in 3D scanning (qt5 version)"
arch=('i686' 'x86_64')
url="https://www.meshlab.net"
conflicts=('meshlab')
provides=('meshlab')
license=('GPL2')
depends=(
    'bzip2' 'cgal' 'glew' 'glu' 'openssl' 'qt5-base' 'qt5-declarative' 'qt5-script' 'qt5-xmlpatterns' 'xerces-c'
    'gmp' 'mpfr' 'mesa'
)
makedepends=('boost' 'cmake' 'eigen' 'ninja' 'git' 'muparser' 'lib3ds' 'openctm-tools' 'gcc12')
optdepends=('lib3ds: for Autodesk`s 3D-Studio r3 and r4 .3DS file support'
            'muparser: for filer_func plugins'
            'openctm-tools: for compressed triangle mesh file format')
source=(
    "$_name::git+https://github.com/cnr-isti-vclab/meshlab.git${_fragment}"
    "vcglib.patch"
)
sha256sums=('SKIP' 'SKIP')

prepare() {
  prepare_submodule
  cd $srcdir/meshlab/src/vcglib
  patch -Np1 -i $srcdir/vcglib.patch 
}

pkgver() {
  git -C "${srcdir}/${_name}" describe --long --tags --match "MeshLab-[0-9.]*"| sed 's/MeshLab-//g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  _cmake_flags+=( '-DALLOW_SYSTEM_QHULL=OFF'
                  '-DCMAKE_INSTALL_PREFIX=/usr'
                  '-DCMAKE_BUILD_TYPE=Release'
                  '-DCMAKE_C_COMPILER=gcc-12'
                  '-DCMAKE_CXX_COMPILER=g++-12'
                )
  cmake "${_cmake_flags[@]}" -G Ninja -B "${srcdir}/build" -S "${srcdir}/meshlab"
  ninja ${MAKEFLAGS:--j1} -C "${srcdir}/build"
}

package() {
  DESTDIR="$pkgdir" ninja -C "${srcdir}/build" install
  mv $pkgdir/usr/lib/meshlab/{libIDTF,plugins/libio_e57}.so -t $pkgdir/usr/lib
}

# Generated with git_submodule_PKGBUILD_conf.sh ( https://gist.github.com/bartoszek/41a3bfb707f1b258de061f75b109042b )
# Call prepare_submodule in prepare() function

prepare_submodule() {
  git -C "$srcdir/meshlab" -c protocol.file.allow=always submodule update --init
}

# vim:set ts=2 sw=2 et:
