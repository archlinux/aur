# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

# shellcheck disable=SC2034
_arch="mips"
_platform="ps2"
_iop="${_arch}el-${_platform}"
_ee="${_arch}64r5900el-${_platform}-elf"
_base="sdk"
_ns="${_platform}${_base}"
_pkgbase="${_platform}${_base}-ports"
_pkg="libid3tag"
pkgname="${_platform}-${_pkg}"
pkgver="v0.15.1b"
pkgrel=1
_pkgdesc=("ID3 tag manipulation library (Sony Playstation® 2 videogame system port).")
pkgdesc="${_pkgdesc[*]}"
arch=('x86_64')
license=('GPL2')
_ns="${_platform}${_base}"
_github="https://github.com/ps2dev"
_local="ssh://git@127.0.0.1:/home/git"
url="${_github}/${_pkgbase}"
depends=("${_platform}-libmad")
makedepends=("${_platform}-sdk")
optdepends=()
_commit="e3f9bfd51e3266b3c68de19b76f6d378f6ec643b"
source=("${pkgname}::git+${url}#commit=${_commit}")
# source=("${pkgname}::git+${_local}/${pkgname}#commit=${_commit}")
sha256sums=('SKIP')

_iop_include="/usr/${_iop}/include"
_ee_include="/usr/${_ee}/include"

_sdk_include="/usr/include/${_platform}${_base}"
_pe_include="/usr/${_ee}/include/pthread-embedded"

_iop_incs=(-I"${_iop_include}")

_ldflags=(-L"/usr/${_ee}/lib/pthread-embedded"
          -L"/usr/${_ee}/lib")

_build_opts=(${_make_opts[@]}
             CPPFLAGS="${_cflags[*]}"
             CXXFLAGS="${_cflags[*]}"
             LDFLAGS="${_ldflags[*]}")

prepare() {
  cd "${srcdir}/${pkgname}"
  local _sample _samples=()
  _samples=($(find . | grep Makefile))
  for _sample in "${_samples[@]}"; do
    sed -i 's/include $(PS2SDK)\/samples/include $(PS2SDKDATADIR)\/samples/g' "${_sample}"
    sed -i "s~\$(PS2SDK)/bin/bin2c~/usr/bin/bin2c~g" "${_sample}"
    sed -i "s~\$(PS2DEV)/isjpcm/bin~/usr/${_iop}\-irx/irx~g" "${_sample}"
    sed -i "s~-I\$(PS2DEV)/isjpcm/include~-include /usr/${_ee}/include/sjpcm.h~g" "${_sample}"
    sed -i "s~-L\$(PS2DEV)/isjpcm/lib~/usr/${_ee}/lib/libsjpcm.a~g" "${_sample}"
    sed -i "s~-L\$(PS2SDK)/ee/lib~-L/usr/${_ee}/lib~g" "${_sample}"
    sed -i "s~-I\$(PS2SDK)/common/include~-I/usr/include/ps2sdk~g" "${_sample}"
    sed -i "s~-I\$(PS2SDK)/ee/include~-I/usr/${_ee}/include~g" "${_sample}"
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

  cat "${srcdir}/${pkgname}/madplay/ee/src/config.h"
  local _ee_cflags=('-include' "${srcdir}/${pkgname}/madplay/ee/src/config.h"
                    -I"${_pe_include}"
                    -I"${srcdir}/${pkgname}/madplay/ee/src"
                    -I"${_ee_include}"
                    -L"/usr/${_ee}/lib"
                    -Wl,-L"/usr/${_ee}/lib"
                    -I"${_sdk_include}"
                    -I"${_sdk_include}/sys")

  export PS2SDK="${srcdir}/${_platform}${_base}"
  export PS2SDKDATADIR="/usr/share/ps2sdk"

  local _make_opts=(PS2SDKDATADIR="/usr/share/${_platform}${_base}")

  cd "${srcdir}/${pkgname}"
  ls
  cd "${_pkg}"
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
  cd "${_pkg}"
  make DESTDIR="${pkgname}" "${_make_opts[@]}" -C "ee/src" install
  cd "${pkgdir}/usr"
  mv "ports" "${_ee}"
}
