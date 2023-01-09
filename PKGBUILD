# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

# shellcheck disable=SC2034
_arch="mips"
_platform="ps2"
_iop="${_arch}el-${_platform}"
_ee="${_arch}64r5900el-${_platform}-elf"
_base="sdk"
_pkgname="${_platform}${_base}"
_pkg="isjpcm"
pkgname="${_platform}-${_pkg}"
pkgver="v2.2"
pkgrel=1
_pkgdesc=("Sound library from Sjeep (Sony Playstation® 2 videogame system port).")
pkgdesc="${_pkgdesc[*]}"
arch=('x86_64')
license=('LGPL2.1')
_ns="ps2homebrew"
_github="https://github.com/${_ns}"
_local="ssh://git@127.0.0.1:/home/git"
url="${_github}/${_pkg}"
makedepends=("${_platform}-${_base}")
optdepends=()
_commit="1b913952e5c7a715efacf2d2088658741b62c73a"
source=("${pkgname}::git+${url}#commit=${_commit}")
# source=("${pkgname}::git+${_local}/${_platform}-${_pkg}#commit=${_commit}")
sha256sums=('SKIP')

_iop_include="/usr/${_iop}/include"
_ee_include="/usr/${_ee}/include"

_sdk_include="/usr/include/${_platform}${_base}"
_ee_sdk_include="/usr/${_ee}/include/${_platform}${_base}"
_pe_include="/usr/${_ee}/include/pthread-embedded"

_cflags=(-I"${_pe_include}"
         -I"${_ee_sdk_include}"
         -I"${_ee_include}"
         -I"${_sdk_include}")

_ee_cflags=(-I"${_pe_include}"
            -I"${_sdk_include}"
            -I"${_ee_sdk_include}"
            -I"${_ee_include}")

_iop_incs=(# ${_cflags[*]}
           -I"${_sdk_include}"
           -I"${_iop_include}")

_ee_incs=(-I"${_ee_sdk_include}"
          -I"${_ee_include}")

_ldflags=(-L"/usr/${_ee}/lib/pthread-embedded"
          -L"/usr/${_ee}/lib")
          # -L"/usr/${_ee}/lib/newlib-nano"

_make_opts=(PS2SDKDATADIR="/usr/share/${_platform}${_base}")

_ee_make_opts=(${_make_opts[@]}
               LDFLAGS="${_ldgflags[*]}"
               EE_CFLAGS="${_ee_cflags[*]}")

_build_opts=(CFLAGS="${_cflags[*]}"
             ${_make_opts[@]}
             CPPFLAGS="${_cflags[*]}"
             CXXFLAGS="${_cflags[*]}"
             LDFLAGS="${_ldflags[*]}")

prepare() {
   cd "${srcdir}/${pkgname}"
   local _sample _samples=()
   _samples=($(find . | grep Makefile))
   for _sample in "${_samples[@]}"; do
     sed -i 's~include $(PS2SDK)/samples~include $(PS2SDKDATADIR)/samples~g' "${_sample}"
     sed -i "s~include \$(PS2SDK)/Defs.make~include \$(PS2SDKDATADIR)/Defs.make~g" "${_sample}"
   done
   ls
   cat "iop/Makefile"
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
  export IOP_BIN_DIR=""

  export IOP_TOOL_PREFIX="${_iop}-elf-"
  export IOP_INCS="${_iop_incs[*]}"
  export EE_CC="${_ee}-gcc"
  export EE_INCS="${_ee_incs[*]}"
  export EE_CFLAGS="${_ee_cflags[*]}"
  export EE_LDFLAGS="${_ee_ldflags[*]}"
  export PS2SDKDATADIR="/usr/share/ps2sdk"
  export PS2DEV="/usr"
  export IOP_BIN_DIR="${pkgdir}/usr/bin/"

  local _iop_make_opts=(${_make_opts[@]}
                        IOP_BIN_DIR="${srcdir}/usr/bin/")

  cd "${srcdir}/${pkgname}"
  mkdir -p "${srcdir}/usr/bin"
  touch "${srcdir}/usr/bin/${_pkg}.irx"
  ls
  PS2DEV="/usr" \
  EE_CFLAGS="${_ee_cflags[*]}" \
  IOP_INCS="${_iop_incs[*]}" \
  IOP_BIN_DIR="${pkgdir}/usr/bin/" \
  make ${_iop_make_opts[@]} -C iop

  PS2DEV="/usr" \
  EE_CFLAGS="${_ee_cflags[*]}" \
  IOP_INCS="${_iop_incs[*]}" \
  make -C ee
}

# shellcheck disable=SC2154
package() {

  export CFLAGS=""
  export CXXFLAGS=""
  export CPPFLAGS=""
  export LDLAGS=""

  local _iop_make_opts=(${_make_opts[@]}
                        IOP_BIN_DIR="${srcdir}/usr/bin/")

  export DESTDIR="${pkgdir}"

  cd "${srcdir}/${pkgname}"

  PS2DEV="/usr" \
  DESTDIR="${pkgdir}" \
  IOP_BIN_DIR="${srcdir}/usr/bin/" \
  make DESTDIR="${pkgdir}" ${_iop_make_opts[@]} -C iop install

  PS2DEV="/usr" \
  DESTDIR="${pkgdir}" \
  IOP_BIN_DIR="${srcdir}/usr/bin/" \
  make DESTDIR="${pkgdir}" -C ee install
  cd "${pkgdir}/usr"
  mkdir "${_ee}" "${_iop}-irx"
  mv "${_pkg}/"* ./
  mv "lib" "${_ee}"
  mv "include" "${_ee}"
  mv "bin" "${_iop}-irx/irx"
  rmdir "${_pkg}"
  # mv "${_pkg}" "${_ee}"
  # mv "${pkgdir}/usr/${pkgname}/"* ${pkgdir}
  # rm -rf "${pkgdir}/${pkgname}"
  # cd "${pkgdir}/usr"
  # ls
  # mv "ee" "${_ee}"
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
