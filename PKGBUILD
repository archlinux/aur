#!/usr/hint/bash
# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>
# shellcheck disable=SC2034,SC2154 # unused/uninitialized variables.
# shellcheck disable=SC2191
[[ -v TRAVIS ]] && DISABLE_PYTHON=1

# Configuration.
_ver="v21.02" #switch to last blender supported version, latest is "v21.02"
_fragment="#tag=$_ver"
if ((DISABLE_PYTHON)); then
  _CMAKE_FLAGS+=( "-DPXR_ENABLE_PYTHON_SUPPORT:BOOL=OFF" )
  makedepends+=( python2 )
else
  _CMAKE_FLAGS+=( -DPXR_PYTHON_SHEBANG:STRING="/usr/bin/python2" )
  eval "depends+=( python2{,-opengl,-pyside} )"
  eval "makedepends+=( python2-{jinja,pyside-tools} )"
fi

pkgname=usd21
pkgver=${_ver#v}
pkgrel=1
pkgdesc="3D VFX pipeline interchange file format."
arch=('x86_64')
url="https://graphics.pixar.com/usd/docs/index.html"
license=('Apache')
depends+=(boost{,-python2}-libs 'glew' 'openexr' 'opensubdiv')
makedepends+=(boost{,-python2} 'cmake' 'git' 'intel-tbb' 'ninja')
provides=("usd=${pkgver}")
conflicts=("usd")
source=("git+https://github.com/PixarAnimationStudios/USD.git${_fragment}"
        "boost_python2.patch"
        "blender.patch"
        "gcc11.patch"
        "demangle-fix.patch")
sha256sums=('SKIP'
            '2f595ce72b9fb33e6da7db97b02be11fe6262e31b83b0e59232ee8713afed97e'
            '0a3f545fdf1b515bdcfad9d606e53293b6d0df47e954b0064370a97b54b8d377'
            '663352c8932a0b48230087284f4f5c540876f6a5adab3d4d1a7ee7b3a4ad6462'
            '99ea5fba92842d0215e5188662a066e0cc714ed4dea9c8663cb6239f6c1afbd0')

prepare() {
  git -C USD apply -v "${srcdir}"/{demangle-fix,gcc11}.patch
}

#pkgver() {
#  git -C USD describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
#}

build() {
  _CMAKE_FLAGS+=(
    -DCMAKE_INSTALL_PREFIX:PATH=/usr
    -DPXR_BUILD_TESTS=OFF
    -DPXR_BUILD_MONOLITHIC=ON               # Required by blender-2.83
    -DBoost_NO_BOOST_CMAKE=ON               # Fix boost overwriting boost_python27 with boost_python
    -DPXR_SET_INTERNAL_NAMESPACE=usdBlender
    -DBUILD_SHARED_LIBS=ON
  )
  export CXXFLAGS+=" -DBOOST_BIND_GLOBAL_PLACEHOLDERS"
  cmake -S USD -B build -G Ninja "${_CMAKE_FLAGS[@]}"
# shellcheck disable=SC2086
  ninja -C build ${MAKEFLAGS:--j1}
}

#check() {
#  ninja -C build test
#}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}

# vim:set ts=2 sw=2 et:
