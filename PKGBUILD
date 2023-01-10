# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

# shellcheck disable=SC2034
_arch="mips"
_platform="ps2"
_iop="${_arch}el-${_platform}"
_ee="${_arch}64r5900el-${_platform}-elf"
_base="sdk"
_pkgbase="${_platform}${_base}-ports"
_pkg="libpng"
pkgname="${_platform}-${_pkg}"
pkgver="v1.6.37"
_ports_ver="v1.3.0"
pkgrel=1
_pkgdesc=("A collection of routines used to create PNG format graphics files "
          "(Sony Playstation® 2 videogame system port).")
pkgdesc="${_pkgdesc[*]}"
arch=('x86_64')
license=('custom')
_ns="glennrp"
_github="https://github.com/${_ns}"
_local="ssh://git@127.0.0.1:/home/git"
url="${_github}/${_pkg}"
_ports_url="https://github.com/${_platform}dev/${_platform}${_base}-ports"
makedepends=("${_platform}-sdk"
             "cmake")
optdepends=()
_commit="a40189cf881e9f0db80511c382292a5604c3c3d1"
_ports_commit="e3f9bfd51e3266b3c68de19b76f6d378f6ec643b"
source=("${pkgname}::git+${url}#commit=${_commit}"
        "${_platform}-ports::git+${_ports_url}#commit=${_ports_commit}")
# source=("${pkgname}::git+${_local}/${pkgname}#commit=${_commit}")
sha256sums=('SKIP'
            'SKIP')

_ee_include="/usr/${_ee}/include"
_ee_lib="/usr/${_ee}/lib"
_sdk_include="/usr/include/${_platform}${_base}"
_pe_include="/usr/${_ee}/include/pthread-embedded"
_pe_lib="/usr/${_ee}/lib/pthread-embedded"

_ldflags=(-L"${_pe_lib}"
          -L"${_ee_lib}")

prepare() {
    cd "${srcdir}/${_platform}-ports"
    local _rep 
    local _reps=("s~\$ENV{PS2SDK}/ee/include~${_ee_include}~g"
                 "s~\$ENV{PS2SDK}/common/include~${_sdk_include}~g"
                 "s~\$ENV{PS2DEV}/ee/ee~~g"
                 "s~\$ENV{PS2DEV}/ee~~g"
                 "s~\$ENV{PS2DEV}/ports~${pkgdir}/usr/${_ee}~g"
                 "s~\$ENV{PS2DEV}~~g"
                 "s~\$ENV{PS2SDK}/ports~~g"
                 "s~\$ENV{PS2SDK}~~g"
                 "s~CMAKE_FIND_ROOT_PATH ~CMAKE_FIND_ROOT_PATH /usr/${_ee}~g"
                 "s~CMAKE_C_FLAGS_INIT \"~CMAKE_C_FLAGS_INIT \"-std=gnu++11 ~g"
                 "s~-D_EE~-D_EE -r~g")
    for _rep in "${_reps[@]}"; do
        sed -i "${_rep}" "${_platform}dev.cmake"
    done
    local _linker_flags=(-r)
}

build() {

  export CFLAGS=""
  export CXXFLAGS=""
  export CPPFLAGS=""
  export LDFLAGS=""

  local _cmake_opts=(-Wno-dev
                     -DCMAKE_TOOLCHAIN_FILE="${srcdir}/${_platform}-ports/ps2dev.cmake"
                     -DCMAKE_INSTALL_PREFIX="/usr/${_ee}"
                     -DBUILD_SHARED_LIBS=OFF
                     -DLDFLAGS="-L${_ee_lib}"
                     -DCMAKE_BUILD_TYPE=RelWithDebInfo
                     -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON)

  local _site_opts=(-DPNG_SHARED=OFF
                    -DPNG_STATIC=ON)
  local _extra_opts=(-G"Unix Makefiles")

  cd "${srcdir}/${pkgname}"
  ls

  local _build="${srcdir}/${pkgname}/build"
  mkdir -p "${_build}"
  cd "${_build}"
  cmake "${_cmake_opts[@]}" "${_site_opts[@]}" "${_extra_opts[@]}" ..
}

# shellcheck disable=SC2154
package() {
  cd "${srcdir}/${pkgname}/build"
  make DESTDIR="${pkgdir}" clean install
}
