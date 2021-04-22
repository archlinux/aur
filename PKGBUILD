#!/usr/hint/bash
# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>
# shellcheck disable=SC2034,SC2154 # unused/uninitialized variables.
# shellcheck disable=SC2191
[[ -v TRAVIS ]] && DISABLE_PYTHON=1

# Configuration.
_ver="v19.11" #switch to last blender supported version, latest is "v20.02"
_fragment="#tag=$_ver"
if ((DISABLE_PYTHON)); then
  _CMAKE_FLAGS+=( "-DPXR_ENABLE_PYTHON_SUPPORT:BOOL=OFF" )
  makedepends+=( python2 )
else
  _CMAKE_FLAGS+=( -DPXR_PYTHON_SHEBANG:STRING="/usr/bin/python2" )
  eval "depends+=( python2{,-opengl,-pyside} boost-python2-libs )"
  eval "makedepends+=( python2-{jinja,pyside-tools} boost-python2 )"
:
fi

pkgname=usd19
pkgver=${_ver#v}
pkgrel=3
pkgdesc="3D VFX pipeline interchange file format."
arch=('x86_64')
url="https://www.openusd.org"
license=('Apache')
depends+=('boost-libs' 'glew' 'openexr' 'opensubdiv')
makedepends+=('boost' 'cmake' 'git' 'intel-tbb' 'ninja')
provides=("usd=${pkgver}")
source=("git+https://github.com/PixarAnimationStudios/USD.git${_fragment}"
        "boost_python2.patch"
        "blender.patch"
        "gcc10.patch")
sha256sums=('SKIP'
            'dec16bd0270c9d682f34c555e38812ea010bee88907a02d6ce60f3f319b21425'
            'a4b92e59eb6330109f65d1b168ad0c4b1292c5317f579dcbf0594df22ffbc587'
            'c45a4503be17764a39f0be8e9524804c64c038b11fe2bf9c5627c88b5d523837')

prepare() {
  git -C USD apply -v "${srcdir}"/{boost_python2,blender,gcc10}.patch
}

#pkgver() {
#  git -C USD describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
#}

build() {
  _CMAKE_FLAGS+=(
    -DCMAKE_INSTALL_PREFIX:PATH=/usr
    -DPXR_BUILD_TESTS:BOOL=OFF
    -DPXR_BUILD_MONOLITHIC:BOOL=ON          # Required by blender-2.83
                )
  cmake -S USD -B build -G Ninja "${_CMAKE_FLAGS[@]}"
# shellcheck disable=SC2046
  ninja -C build $([ -v MAKEFLAGS ] || echo -j1)
}

#check() {
#  ninja -C build test
#}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}

# vim:set ts=2 sw=2 et:
