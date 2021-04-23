#!/usr/hint/bash
# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>
# shellcheck disable=SC2034,SC2154 # unused/uninitialized variables.
# shellcheck disable=SC2191
[[ -v TRAVIS ]] && DISABLE_PYTHON=1

# Configuration.
_ver="v20.05" #switch to last blender supported version, latest is "v20.08"
_fragment="#tag=$_ver"
if ((DISABLE_PYTHON)); then
  _CMAKE_FLAGS+=( "-DPXR_ENABLE_PYTHON_SUPPORT:BOOL=OFF" )
  makedepends+=( python2 )
else
  _CMAKE_FLAGS+=( -DPXR_PYTHON_SHEBANG:STRING="/usr/bin/python2" )
  eval "depends+=( python2{,-opengl,-pyside} )"
  eval "makedepends+=( python2-{jinja,pyside-tools} )"
fi

pkgname=usd20
pkgver=${_ver#v}
pkgrel=1
pkgdesc="3D VFX pipeline interchange file format."
arch=('x86_64')
url="https://graphics.pixar.com/usd/docs/index.html"
license=('Apache')
depends+=(boost{,-python2}-libs 'glew' 'openexr' 'opensubdiv')
makedepends+=(boost{,-python2} 'cmake' 'git' 'intel-tbb' 'ninja')
conflicts=("usd")
provides=("usd=${pkgver}")
source=("git+https://github.com/PixarAnimationStudios/USD.git${_fragment}"
        "boost_python2.patch"
        "blender.patch"
        "std.patch")
sha256sums=('SKIP'
            '2f595ce72b9fb33e6da7db97b02be11fe6262e31b83b0e59232ee8713afed97e'
            '95a4934ae8154e1650a024b09ed3237ba7d9411ada089a4b6337cbba9312705a'
            '5e9dfc3daa97271b959e78737079335907a3536bb8af2d74ef9b8f7529f2f8e5')

prepare() {
  git -C USD apply -v "${srcdir}"/{boost_python2,blender,std}.patch
}

#pkgver() {
#  git -C USD describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
#}

build() {
  _CMAKE_FLAGS+=(
    -DCMAKE_INSTALL_PREFIX:PATH=/usr
    -DPXR_BUILD_TESTS:BOOL=OFF
    -DPXR_BUILD_MONOLITHIC:BOOL=ON          # Required by blender-2.83
    -DBoost_NO_BOOST_CMAKE=ON               # Fix boost overwriting boost_python27 with boost_python
    -DPXR_SET_INTERNAL_NAMESPACE=usdBlender
    -DBUILD_SHARED_LIBS=ON
    -DCMAKE_DEBUG_POSTFIX=_d
  )
  cmake -S USD -B build -G Ninja "${_CMAKE_FLAGS[@]}"
# shellcheck disable=SC2046
  ninja -C build ${MAKEFLAGS:--j1}
}

#check() {
#  ninja -C build test
#}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}

# vim:set ts=2 sw=2 et:
