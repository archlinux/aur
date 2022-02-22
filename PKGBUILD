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
((DISABLE_CUDA)) && {
  CMAKE_FLAGS+=("-DLUXRAYS_DISABLE_CUDA=ON")
} || {
  makedepends+=(cuda)
}

_name="luxcorerender"
pkgname=${_name}-git
pkgver=2.6.r16.g7ce21392d
epoch=2
pkgrel=1
pkgdesc="Physically correct, unbiased rendering engine."
arch=('x86_64')
url="https://www.luxcorerender.org/"
license=('Apache')
depends+=(blosc boost-libs embree glfw gtk3 openimagedenoise openimageio openvdb)
optdepends+=("pyside2: for pyluxcoretools gui")
makedepends+=(boost cmake doxygen git ninja pyside2-tools)
conflicts=(luxcorerender)
provides=(luxrays "luxcorerender=${pkgver%.r*}")
options=('!buildflags')
source=("${_name}::git+https://github.com/LuxCoreRender/LuxCore.git${_fragment}"
        "python.patch"
        "glfw.patch"
        "boost107400.patch::https://github.com/LuxCoreRender/LuxCore/pull/483.patch"
        "openexr3.patch"
        "openvdb.patch"
        )
sha256sums=('SKIP'
            '1395fbb98c989c101c66350d228af05c20abf20ada55f179ca563094c1b642ca'
            '4e04c3eb653f00d2389aff8e7fda2d244e258cbca3a22e32c13388a3984e4bb1'
            'f5fc0bbeb09c95750da6ca668ea2f26b84998c57c9abb8ac0a3d96131017f66d'
            '0ab21f055753155b3f46b6c773ef4509c69b86852cc474fcaa336ff8497dcaa9'
            'bc8d7f2cb0fd562f80ebdc93847d9db57b674ac25ce37d266c0582b7a0bd859d')
b2sums=('SKIP'
        '9e6f2eeaa87d3c75dbdcc91adf1a21c5b4edefab7984229e60ba639b34baf4c38b287b67a7be9954f22535375a179dfc9c8afdfab4bdea381d749047b00df781'
        '2903992389c61fc4720cde8a011d0b637de647a7c9e701609968c01a8ab904277dfb27a90179d4cfcf98382973542e59d1384580236c25f6568aaa7b6ba90528'
        '3057084619ac9067883b820d6ca4cb896155b587a09b689aa2a0dd1139478577164cfe90d5165d84cb88850b35fc5721ad76568764f555bd5c05b8e394c95b48'
        'e42842f8ac778f617261e10e78aa805d8ab47c53e762f2153e5acb18e0f69f5eda735205cdaa9fe4b2ac93ae3e16ca4a5599ac8b2d4617e12e3b821cb99e5e2b'
        '3c35212e111ff1eab9704bb1bc30fec1b306d5857c59d8c714c156e36583db78e26e861354fbc279f30b90c80150c3b502a8e1f86d775c8d2f9fcdda37d703d4')

pkgver() {
# shellcheck disable=SC2164
  cd "${srcdir}/${_name}"
# shellcheck disable=SC2015
  git describe --long --tags --match luxcorerender* | sed 's/^luxcorerender_v//;s/\(alpha\|beta\|rc\)/\.\1/;s/\([^-]*-g\)/r\1/;s/-/./g'
}


prepare() {
  git -C "${srcdir}/${_name}" revert --no-commit 5d963d0b32a30d76ac193e8198647b74cd9a2e12
  git -C "${srcdir}/${_name}" apply -v "${srcdir}"/*.patch
  #fix build against fmt 8.0
  sed '/format_system_error/s/msg/msg.c_str()/' -i "${srcdir}/${_name}"/deps/spdlog-1.8.0/include/spdlog/common-inl.h
}

build() {
  _pyver=$(python -c "from sys import version_info; print(\"%d%d\" % (version_info.major,version_info.minor))")
  CMAKE_FLAGS+=("-DPYTHON_V=${_pyver}")
  CMAKE_FLAGS+=(-DCMAKE_CXX_STANDARD=14)
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
