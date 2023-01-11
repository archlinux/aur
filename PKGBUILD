# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

# shellcheck disable=SC2034
_arch="mips"
_platform="ps2"
_iop="${_arch}el-${_platform}"
_ee="${_arch}64r5900el-${_platform}-elf"
_base="sdk"
_ns="${_platform}${_base}"
_pkgbase="${_platform}${_base}-ports"
_pkg="libmad"
pkgname="${_platform}-${_pkg}"
pkgver="v0.15.1b"
pkgrel=1
_pkgdesc=("An high-quality MPEG audio decoder (Sony Playstation® 2 videogame system port).")
pkgdesc="${_pkgdesc[*]}"
arch=('x86_64')
license=('custom')
_ns="${_platform}${_base}"
_github="https://github.com/ps2dev"
_local="ssh://git@127.0.0.1:/home/git"
url="${_github}/${_pkgbase}"
makedepends=("${_platform}-sdk"
             "${_platform}-isjpcm")
optdepends=()
_commit="e3f9bfd51e3266b3c68de19b76f6d378f6ec643b"
source=("${pkgname}::git+${url}#commit=${_commit}")
# source=("${pkgname}::git+${_local}/${pkgname}#commit=${_commit}")
sha256sums=('SKIP')

_iop_include="/usr/${_iop}/include"
_ee_include="/usr/${_ee}/include"
_ee_lib="/usr/${_ee}/lib"
_sdk_include="/usr/include/${_platform}${_base}"
_pe_include="/usr/${_ee}/include/pthread-embedded"

_cflags=(-I"${_pe_include}"
         -I"${_ee_sdk_include}"
         -I"${_ee_include}"
         -I"${_sdk_include}")

_iop_incs=(${_cflags[*]}
           -I"${_iop_include}")

_ee_incs=(-I"${_sdk_include}")
          # -I"${_ee_include}")

_ldflags=(-L"/usr/${_ee}/lib/pthread-embedded")
          # -L"${_ee_lib}")
          # -L"/usr/${_ee}/lib/newlib-nano"
          # "${_ee_lib}/newlib-nano/libc_nano.a"
          # "${_ee_lib}/newlib-nano/libm_nano.a"
          # "${_ee_lib}/newlib-nano/libg_nano.a"
          # "${_ee_lib}/newlib-nano/crt0.o")


prepare() {
  cd "${srcdir}/${pkgname}"
  local _sample _samples=()
  _samples=($(find . | grep Makefile))
  for _sample in "${_samples[@]}"; do
    sed -i 's/include $(PS2SDK)\/samples/include $(PS2SDKDATADIR)\/samples/g' "${_sample}"
  done
}

build() {
  export CFLAGS=""
  export CXXFLAGS=""
  export CPPFLAGS=""
  export LDFLAGS=""
  export IOP_CC=""
  export EE_CC=""
  export EE_INCS=""
  export EE_CFLAGS=""
  export EE_CFLAGS=""
  export PS2SDKDATADIR=""

  local _ee_cflags=(-I"${_pe_include}"
                    '-include' "${srcdir}/${pkgname}/${_pkg}/ee/include/config.h"
                    -I"../include"
                    -I"${_ee_include}")

  local _make_opts=(PS2SDKDATADIR="/usr/share/${_platform}${_base}"
                    # LDFLAGS="${_ldgflags[*]}"
                    EE_CFLAGS="${_ee_cflags[*]}")

  export CFLAGS="${_cflags[*]}"
  export PS2SDK="${srcdir}/${_platform}${_base}"
  export IOP_TOOL_PREFIX="${_iop}-elf-"
  export EE_CC="${_ee}-gcc"
  export EE_CFLAGS="${_ee_cflags[*]}"
  export PS2SDKDATADIR="/usr/share/ps2sdk"


  cd "${srcdir}/${pkgname}"
  mkdir -p ${PS2SDK}
  ls
  cd libmad
  cp -r "ee/include/global.h" "ee/src"
  cp -r "ee/include/config.h" "ee/src"
  cp -r "ee/include/bit.h" "ee/src"
  cp -r "ee/include/fixed.h" "ee/src"
  EE_CFLAGS="${_ee_cflags[*]}" \
  EE_CC="${_ee}-gcc" \
  EE_INCS="${_ee_incs[*]}" \
  PS2SDKDATADIR="/usr/share/ps2sdk" \
  make "${_make_opts[@]}" -C ee/src
}

# shellcheck disable=SC2154
package() {

  export CFLAGS=""
  export CXXFLAGS=""
  export CPPFLAGS=""
  export LDFLAGS=""
  export PS2SDK="/usr"

  local _make_opts=(PS2SDKDATADIR="/usr/share/${_platform}${_base}"
                    DESTDIR="${pkgdir}")

  cd "${srcdir}/${pkgname}"
  ls
  cd libmad
  make DESTDIR="${pkgdir}" "${_make_opts[@]}" -C "ee/src" install
  cd "${pkgdir}/usr"
  mv "ports" "${_ee}"
}
