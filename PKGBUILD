#!/hint/bash
# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>

# Configuration
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
pkgver=2.5.beta1.r14.g86465dd05
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
provides=(luxrays "luxcorerender=${epoch}:${pkgver%.r*}")
options=('!buildflags')
source=("${_name}::git+https://github.com/LuxCoreRender/LuxCore.git${_fragment}"
        "python.patch"
        "glfw.patch"
        "oidn124.patch::https://github.com/LuxCoreRender/LuxCore/pull/482.patch"
        "boost107400.patch::https://github.com/LuxCoreRender/LuxCore/pull/483.patch"
        )
sha256sums=('SKIP'
            'f639fb7e31056b6c7214e303c90fe06665572ffafc11e545f7c05128a8d85dc4'
            '4e04c3eb653f00d2389aff8e7fda2d244e258cbca3a22e32c13388a3984e4bb1'
            '2104154c23f1db1476897b6ee6c75b656bb242300a6eeb7eb0b449a964f6ad56'
            'f5fc0bbeb09c95750da6ca668ea2f26b84998c57c9abb8ac0a3d96131017f66d')
b2sums=('SKIP'
        '348fa445b9ac7f738461543f8adadbb9a93dc2f75d96d0d26acbf7168290a0621224d6f11b3af77a6c6e492ae089e57770fc02a987af0748f5bb3e73b8d90f54'
        '2903992389c61fc4720cde8a011d0b637de647a7c9e701609968c01a8ab904277dfb27a90179d4cfcf98382973542e59d1384580236c25f6568aaa7b6ba90528'
        'c80f46a1665dad88b2f5c768db6881aecdaab98f1714c159bcac9688592870708c161b39eb42097ab0eb35a8aed6d63a30769e7b67d943f8e8ad93f3af9e31ac'
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
