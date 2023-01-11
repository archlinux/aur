# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

# shellcheck disable=SC2034
_arch="mips"
_platform="ps2"
_iop="${_arch}el-${_platform}"
_ee="${_arch}64r5900el-${_platform}-elf"
_base="sdk"
_ns="${_platform}${_base}"
_pkgbase="${_platform}${_base}-ports"
_pkg="sdlttf"
pkg="sdl_ttf"
pkgname="${_platform}-${pkg}"
pkgver="1.2"
pkgrel=1
_pkgdesc=("A library that allows you to use TrueType fonts in your SDL applications "
          "(Sony Playstation® 2 videogame system port).")
pkgdesc="${_pkgdesc[*]}"
arch=('x86_64')
license=('custom')
_ns="${_platform}${_base}"
_github="https://github.com/ps2dev"
_local="ssh://git@127.0.0.1:/home/git"
url="${_github}/${_pkgbase}"
makedepends=("${_platform}-sdk"
             "${_platform}-sdl")
optdepends=()
_commit="e3f9bfd51e3266b3c68de19b76f6d378f6ec643b"
source=("${pkgname}::git+${url}#commit=${_commit}")
# source=("${pkgname}::git+${_local}/${pkgname}#commit=${_commit}")
sha256sums=('SKIP')

_ee_include="/usr/${_ee}/include"
_ee_lib="/usr/${_ee}/lib"
_sdk_include="/usr/include/${_platform}${_base}"
_pe_include="/usr/${_ee}/include/pthread-embedded"
_pe_lib="/usr/${_ee}/lib/pthread-embedded"

prepare() {
  cd "${srcdir}/${pkgname}"
  local _mf _rep
  local _mfs=($(find . | grep Makefile))
  local _reps=("s~include \$(PS2SDK)/samples~include \$(PS2SDKDATADIR)/samples~g"
               "s~\$(PS2SDK)/bin/bin2c~/usr/bin/bin2c~g"
               "s~\$(PS2DEV)/isjpcm/bin~/usr/${_iop}\-irx/irx~g"
               "s~-I\$(PS2DEV)/isjpcm/include~-include ${_ee_include}/sjpcm.h~g"
               "s~-L\$(PS2DEV)/isjpcm/lib~${_ee_lib}/libsjpcm.a~g"
               "s~-L\$(PS2SDK)/ee/lib~-L${_ee_lib}~g"
               "s~-I\$(PS2SDK)/common/include~-I${_sdk_include}~g"
               "s~-I\$(PS2SDK)/ee/include~-I${_ee_include}~g"
               "s~-I\$(PS2SDK)/ports/include~-I${_ee_include}~g"
               "s~-L\$(PS2SDK)/ports/lib~-L${_ee_lib} -r ~g"
               "s~\$(PS2SDK)/iop/irx~/usr/${_iop}-irx/irx~g"
               "s~\$(PS2SDK)/ee/lib~${_ee_lib}~g"
               "s~\$(PS2SDK)/ports/lib~${_ee_lib}~g"
               "s~\$(PS2SDK)/ports/include~${_ee_include}~g")

  for _mf in "${_mfs[@]}"; do
    for _rep in "${_reps[@]}"; do
      sed -i "${_rep}" "${_mf}"
    done
  done
  # sed -i "/strncasecmp/d" "madplay/ee/src/global.h"
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

  export PS2SDK="/usr"
  export GSKIT="/usr/${_ee}"
  export PS2SDKDATADIR="/usr/share/ps2sdk"

  local _make_opts=(PS2SDKDATADIR="/usr/share/${_platform}${_base}"
                    GSKIT="/usr/${_ee}")

  cd "${srcdir}/${pkgname}"
  PS2SDKDATADIR="/usr/share/ps2sdk" \
  GSKIT="/usr/${_ee}" \
  make "${_make_opts[@]}" -C "${_pkg}"
}

# shellcheck disable=SC2154
package() {

  export CFLAGS=""
  export CXXFLAGS=""
  export CPPFLAGS=""
  export LDFLAGS=""

  local _make_opts=(PS2SDKDATADIR="/usr/share/${_platform}${_base}"
                    DESTDIR="${pkgdir}")

  cd "${srcdir}/${pkgname}/"
  make "${_make_opts[@]}" -C "${_pkg}" install
  cd "${pkgdir}/usr"
  # mv "ports" "${_ee}"
}
