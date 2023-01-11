# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

# shellcheck disable=SC2034
_arch="mips"
_platform="ps2"
_iop="${_arch}el-${_platform}"
_ee="${_arch}64r5900el-${_platform}-elf"
_base="sdk"
_pkgbase="${_platform}${_base}-ports"
_pkg="libjpeg"
pkgname="${_platform}-${_pkg}"
pkgver="v6b"
_ports_ver="v1.3.0"
pkgrel=1
_pkgdesc=("JPEG image codec with accelerated baseline compression and decompression "
          "(Sony Playstation® 2 videogame system port).")
pkgdesc="${_pkgdesc[*]}"
arch=('x86_64')
license=('MIT')
_ns="yaml"
_github="https://github.com/${_ns}"
_local="ssh://git@127.0.0.1:/home/git"
url="${_github}/${_pkg}"
_ports_url="https://github.com/${_platform}dev/${_platform}${_base}-ports"
makedepends=("${_platform}-sdk"
             "cmake")
optdepends=()
_commit="2c891fc7a770e8ba2fec34fc6b545c672beb37e6"
_ports_commit="e3f9bfd51e3266b3c68de19b76f6d378f6ec643b"
source=("${_platform}-ports::git+${_ports_url}#commit=${_ports_commit}")
# source=("${pkgname}::git+${_local}/${pkgname}#commit=${_commit}")
sha256sums=('SKIP')

_ee_include="/usr/${_ee}/include"
_ee_lib="/usr/${_ee}/lib"
_sdk_include="/usr/include/${_platform}${_base}"
_pe_include="/usr/${_ee}/include/pthread-embedded"
_pe_lib="/usr/${_ee}/lib/pthread-embedded"

_ldflags=(-L"${_pe_lib}"
          -L"${_ee_lib}")

prepare() {
  cd "${srcdir}/${_platform}-ports"
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
                    -L"${_pe_lib}"
                    # '-include' "${srcdir}/${pkgname}/${_pkg}/ee/include/config.h"
                    -I"../include"
                    -I"${_ee_include}"
                    -L"${_ee_lib}")

  local _make_opts=(PS2SDKDATADIR="/usr/share/${_platform}${_base}")
                    # LDFLAGS="${_ldflags[*]}"
                    # EE_CFLAGS="${_ee_cflags[*]}")

  export PS2SDK="${srcdir}/${_platform}${_base}"
  export PS2SDKDATADIR="/usr/share/ps2sdk"

  cd "${srcdir}/${_platform}-ports/"

  PS2SDKDATADIR="/usr/share/ps2sdk" \
  make "${_make_opts[@]}" -C "${_pkg}/src"
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

  cd "${srcdir}/${_platform}-ports/"
  PS2SDKDATADIR="/usr/share/ps2sdk" \
  make DESTDIR="${pkgdir}" "${_make_opts[@]}" -C "${_pkg}/src" install
  cd "${pkgdir}/usr"
  mv "ports" "${_ee}"
}
