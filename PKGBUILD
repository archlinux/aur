#!/hint/bash
# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>

# Configuration
_fragment=${FRAGMENT:-#branch=master}
# shellcheck disable=SC2015
((DISABLE_OPENCL)) && {
  CMAKE_FLAGS+=("-DLUXRAYS_DISABLE_OPENCL=ON")
} || {
  depends+=(opencl-icd-loader)
  makedepends+=(opencl-headers)
  optdepends+=("opencl-driver: for gpu acceleration")
}
# shellcheck disable=SC2015
((DISABLE_CUDA||DISABLE_OPENCL)) && {
  CMAKE_FLAGS+=("-DLUXRAYS_DISABLE_CUDA=ON")
} || {
  makedepends+=(cuda)
}

_name="luxcorerender"
pkgname=${_name}-git
pkgver=2.5.r77.g6642342f6
epoch=2
pkgrel=1
pkgdesc="Physically correct, unbiased rendering engine."
arch=('x86_64')
url="https://www.luxcorerender.org/"
license=('Apache')
depends+=(blosc boost-libs embree glfw gtk3 openimagedenoise openimageio)
optdepends+=("pyside2: for pyluxcoretools gui")
makedepends+=(boost cmake doxygen git ninja pyside2-tools)
conflicts=(luxcorerender)
provides=(luxrays "luxcorerender=${pkgver%.r*}")
options=('!buildflags')
source=("${_name}::git+https://github.com/LuxCoreRender/LuxCore.git${_fragment}"
        "python.patch"
        "glfw.patch"
        "boost107400.patch::https://github.com/LuxCoreRender/LuxCore/pull/483.patch"
        )
sha256sums=('SKIP'
            '2fcf39c621370c5609c06474279230c55c716dbb05d823d5703e662deede1ce8'
            '4e04c3eb653f00d2389aff8e7fda2d244e258cbca3a22e32c13388a3984e4bb1'
            'f5fc0bbeb09c95750da6ca668ea2f26b84998c57c9abb8ac0a3d96131017f66d')
b2sums=('SKIP'
        'a70524f4c417c22f4ca8725ee4fe3501488d7e56be85e55bd70338daedd23224de795660e44bded4a9bb6bf00bb4f96c0b66302e85b0f4109ca9af4fa1b75259'
        '2903992389c61fc4720cde8a011d0b637de647a7c9e701609968c01a8ab904277dfb27a90179d4cfcf98382973542e59d1384580236c25f6568aaa7b6ba90528'
        '3057084619ac9067883b820d6ca4cb896155b587a09b689aa2a0dd1139478577164cfe90d5165d84cb88850b35fc5721ad76568764f555bd5c05b8e394c95b48')

pkgver() {
# shellcheck disable=SC2164
  cd "${srcdir}/${_name}"
# shellcheck disable=SC2015
  git describe --long --tags --match luxcorerender* | sed 's/^luxcorerender_v//;s/\(alpha\|beta\|rc\)/\.\1/;s/\([^-]*-g\)/r\1/;s/-/./g'
}


prepare() {
  git -C "${srcdir}/${_name}" apply -v "${srcdir}"/*.patch
}

build() {
  _pyver=$(python -c "from sys import version_info; print(\"%d%d\" % (version_info.major,version_info.minor))")
  CMAKE_FLAGS+=("-DPYTHON_V=${_pyver}")
  cmake "${CMAKE_FLAGS[@]}" -S "${srcdir}"/${_name} -B build -G Ninja
# shellcheck disable=SC2046
  ninja $(grep -oP -- '-+[A-z]+ ?[0-9]*'<<<"${MAKEFLAGS:--j1}") -C "${srcdir}/build"
}

package() {
  cd "${srcdir}"/build

  install -d -m755 "${pkgdir}"/usr/{bin,include,lib}
  install -m755 bin/* "${pkgdir}"/usr/bin
  install -m644 lib/* "${pkgdir}"/usr/lib
  cp -a "${srcdir}"/${_name}/include "${pkgdir}"/usr
  for file in "${pkgdir}"/usr/include/*/*.in; do mv "$file" "${file%.in}"; done

  # install pyluxcore to the Python search path
  #  _pypath=`pacman -Ql python | sed -n '/\/usr\/lib\/python[^\/]*\/$/p' | cut -d" " -f 2`
  _pypath=$(python -c 'from sys import version_info;print("/usr/lib/python{}.{}".format(version_info.major,version_info.minor))')
  install -d -m755 "${pkgdir}/${_pypath}"
  mv "${pkgdir}"/usr/lib/pyluxcore.so "${pkgdir}/${_pypath}"
}
# vim:set ts=2 sw=2 et:
