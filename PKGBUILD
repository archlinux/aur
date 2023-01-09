# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

# shellcheck disable=SC2034
_arch="mips"
_platform="ps2"
_iop="${_arch}el-${_platform}"
_ee="${_arch}64r5900el-${_platform}-elf"
_base="sdk"
_ns="${_platform}${_base}"
_pkgbase="${_platform}${_base}-ports"
_pkg="madplay"
pkgname="${_platform}-${_pkg}"
pkgver="v1.3.0"
pkgrel=1
_pkgdesc=(" (Sony Playstation® 2 videogame system port).")
pkgdesc="${_pkgdesc[*]}"
arch=('x86_64')
license=('custom')
_ns="${_platform}${_base}"
_github="https://github.com/ps2dev"
_local="ssh://git@127.0.0.1:/home/git"
url="${_github}/${_pkgbase}"
depends=("${_platform}-libmad")
         # "${_platform}-zlib")
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

_iop_incs=(# ${_cflags[*]}
           -I"${_iop_include}")

# _ee_incs=(-I"${_sdk_include}")
          # -I"${_ee_include}")

_ldflags=( # -T"/usr/${_ee}/startup/linkfile"
          -L"/usr/${_ee}/lib/pthread-embedded"
          # "/usr/lib/libz.a"
          # "/usr/lib/libid3tag.so"
          -L"/usr/${_ee}/lib")
          # -L"/usr/${_ee}/lib/newlib-nano"
          # "/usr/${_ee}/lib/newlib-nano/libc_nano.a"
          # "/usr/${_ee}/lib/newlib-nano/libm_nano.a"
          # "/usr/${_ee}/lib/newlib-nano/libg_nano.a"
          # "/usr/${_ee}/lib/newlib-nano/crt0.o")

_build_opts=(# CFLAGS="${_cflags[*]}"
             ${_make_opts[@]}
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
    # sed -i "s~-L\$(PS2SDK)/ee/lib~-L/usr/${_ee}/lib~g" "${_sample}"
    # sed -i "s~-I\$(PS2SDK)/common/include~-I/usr/include/ps2sdk~g" "${_sample}"
    # sed -i "s~-I\$(PS2SDK)/ee/include~-I/usr/${_ee}/include~g" "${_sample}"
    # sed -i "s~\$(PS2SDK)/ee~/usr/${_ee}~g" "${_sample}"
    # sed -i "s~\$(PS2SDK)/iop~/usr/${_iop}-irx~g" "${_sample}"
    # sed -i "s/EE_INCS = -I..\/include/EE_INCS = -I\/..include -I\/usr\/${_ee}\/include\/${_platform}${_base}/g" "libmad/Makefile"
  done
  # sed -i "/EE_CFLAGS =/d" "libjpeg/src/Makefile"
  # cat "libjpeg/src/Makefile"
  # sed -i "s~EE_INCS  =~EE_INCS  = -I/usr/${_ee}/include -Wl,-L/usr/${_ee}/lib,/usr/${_ee}/lib/libkernel.a -I/usr/include/${_platform}${_base}~g" "libjpeg/src/Makefile"
  # sed -i "s~EE_INCS  =~EE_INCS  = -I/usr/${_ee}/include -Wl,-L/usr/${_ee}/lib,/usr/${_ee}/lib/libkernel.a -I/usr/include/${_platform}${_base}~g" "libjpeg/src/Makefile"
  # cat "libjpeg/src/Makefile"
  # sed -i "s~EE_CFLAGS += ~EE_CFLAGS += -I${srcdir}/${pkgname}/libmad/ee/include -I/..include -I/usr/${_ee}/include/${_platform}${_base}~g" "libmad/ee/src/Makefile"
  cat "madplay/ee/src/Makefile"
  # echo "#define  HAVE_STRCASECMP 1" >> "${srcdir}/${pkgname}/madplay/ee/src/config.h"
  sed -i "/strncasecmp/d" "madplay/ee/src/global.h"
  cat "${srcdir}/${pkgname}/madplay/ee/src/config.h"
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
                    # '-include' "/usr/${srcdir}/${pkgname}/madplay/ee/src/config.h"
                    -I"${_pe_include}"
                    # '-include' "${srcdir}/${pkgname}/madplay/ee/src/config.h"
                    -I"${srcdir}/${pkgname}/madplay/ee/src"
                    # '-include' "${srcdir}/${pkgname}/libmad/ee/include/config.h"
                    # -I"${srcdir}/${pkgname}/libmad/ee/include"
                    # '-include' "/usr/include/id3tag.h"
                    # '-include' "/usr/${_ee}/include/sjpcm.h"
                    # -I"../include")
                    # -I"${srcdir}/${_pkg}"
                    -I"${_ee_include}"
                    -Wl,-L"/usr/${_ee}/lib"
                    -I"${_sdk_include}"
                    -I"${_sdk_include}/sys")

  # export C_INCLUDE_PATH="/usr/${_ee}/include/pthread-embedded"
  # export IOP_CFLAGS="${_cflags[*]}"
  # export IOP_LDFLAGS="${_cflags[*]}"
  # export CFLAGS="${_cflags[*]}"
  # export CPPFLAGS="${_cflags[*]}"
  # export CXXFLAGS="${_cflags[*]}"
  export LDFLAGS="${_ldflags[*]}"
  export PS2SDK="${srcdir}/${_platform}${_base}"
  export IOP_TOOL_PREFIX="${_iop}-elf-"
  # export IOP_INCS="${_iop_incs[*]}"
  export EE_CC="${_ee}-gcc"
  # export EE_INCS="${_ee_incs[*]}"
  export EE_CFLAGS="${_ee_cflags[*]}"
  # export EE_LDFLAGS="${_ee_ldflags[*]}"
  export PS2SDKDATADIR="/usr/share/ps2sdk"

  local _make_opts=(PS2SDKDATADIR="/usr/share/${_platform}${_base}"
                    LDFLAGS="${_ldflags[*]}"
                    EE_CFLAGS="${_ee_cflags[*]}")

  cd "${srcdir}/${pkgname}"
  mkdir -p "${PS2SDK}/ee/startup"
  ls
  cd "${_pkg}"
  cp -r "ee/include/"* "ee/src"
  # cp -r "${srcdir}/${pkgname}/libmad/ee/include/config.h" "ee/src"
  # cp -r "${srcdir}/${pkgname}/libmad/ee/include/bit.h" "ee/src"
  # cp -r "${srcdir}/${pkgname}/libmad/ee/include/fixed.h" "ee/src"
  # cp -r "${srcdir}/${pkgname}/libmad/ee/include/global.h" "ee/src"
  cp -r "/usr/include/id3tag.h" "ee/src"
  cp -r "/usr/${_ee}/startup/linkfile" "${PS2SDK}/ee/startup"
  # EE_LDFLAGS="${_ldflags[*]}" \
  # CFLAGS="${_cflags[*]}" \
  # IOP_INCS="${_iop_incs[*]}" \
  # EE_INCS="${_ee_incs[*]}" \
  EE_CFLAGS="${_ee_cflags[*]}" \
  EE_CC="${_ee}-gcc" \
  PS2SDKDATADIR="/usr/share/ps2sdk" \
  LDFLAGS="${_ldflags[*]}" \
  make "${_make_opts[@]}" -C ee/src 
}

# shellcheck disable=SC2154
package() {

  export CFLAGS=""
  export CXXFLAGS=""
  export CPPFLAGS=""
  export LDFLAGS=""

  # export C_INCLUDE_PATH="/usr/${_ee}/include/pthread-embedded"
  # export IOP_CFLAGS="${_cflags[*]}"
  # export IOP_LDFLAGS="${_cflags[*]}"
  # export EE_CFLAGS="${_cflags[*]}"
  # export CFLAGS="${_cflags[*]}"
  # export CPPFLAGS="${_cflags[*]}"
  # export CXXFLAGS="${_cflags[*]}"
  # export LDFLAGS="${_ldflags[*]}"
  export PS2SDK="/usr"
  # export IOP_TOOL_PREFIX="${_iop}-elf-"

  local _make_opts=(PS2SDKDATADIR="/usr/share/${_platform}${_base}"
                    DESTDIR="${pkgdir}")

  cd "${srcdir}/${pkgname}"
  ls
  cd madplay
  # make clean
  # LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:/usr/${_ee}/lib/pthread-embedded" \
  # IOP_CFLAGS="${_cflags[*]}" \
  # EE_CFLAGS="${_cflags[*]}" \
  # CFLAGS="${_cflags[*]}" \
  # CPPFLAGS="${_cflags[*]}" \
  # CXXFLAGS="${_cflags[*]}" \
  # EE_LDLAGS="${_cflags[*]}" \
  # IOP_LDLAGS="${_cflags[*]}" \
  # LDFLAGS="${_ldflags[*]}" \
  make DESTDIR="${pkgname}" "${_make_opts[@]}" -C "ee/src" install
  cd "${pkgdir}/usr"
  mv "ports" "${_ee}"
  # cp -r "iop" "${_iop}-elf"
  # mv "iop" "${_iop}-irx"
  # mkdir -p "share/${_pkgname}"
  # mv AUTHORS "share/${_pkgname}"
  # mv samples "share/${_pkgname}"
  # mv Defs.make "share/${_pkgname}"
  # mv CHANGELOG "share/${_pkgname}"
  # mv ID "share/${_pkgname}"
  # mv README.md "share/${_pkgname}"
  # mkdir -p "include"
  # mv "common/include" "include/${_pkgname}"
  # rmdir common
  # mkdir -p "share/licenses/${_pkgname}"
  # mv LICENSE "share/licenses/${_pkgname}"
}
