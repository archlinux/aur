# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

# shellcheck disable=SC2034
target="mips64r5900el-ps2-elf"
_module="ee"
_platform="ps2"
_bu="binutils-gdb"
_pe="pthread-embedded"
_base="toolchain"
pkgname="${target}-${_pe}"
pkgver=v1.0
pkgrel=1
_pkgdesc=("Open Source Software implementation of the "
          "Threads component of the POSIX 1003.1 2001 Standard "
          "for the Sony PlayStation® 2 videogame system.")
pkgdesc="${_pkgdesc[*]}"
arch=('x86_64')
license=('BSD')
_github="https://github.com/ps2dev"
_local="ssh://git@127.0.0.1:/home/git"
url="${_github}/${_platform}${_base}-${_module}"
makedepends=("${target}-gcc"
             "${target}-newlib"
             "libgmp-static"
             "mpfr-static"
             "libmpc-static"
             "zstd-static")
optdepends=()
_branch="platform_agnostic"
_commit="ea029de9a92d565fcb00fbf9e0c0ed99df0ef79d"
source=("${pkgname}::git+${_github}/${_pe}#commit=${_commit}")
# source=("${pkgname}::git+${_local}/${_platform}-${_pe}#commit=${_branch}")
sha256sums=('SKIP')

# shellcheck disable=SC2154
build() {
  local _target

  export LDFLAGS=""
  export LD_LIBRARY_PATH=""

  cd "${srcdir}/${pkgname}"

  for _target in "${target}"; do
    make -C platform/ps2 all
    cd ..
  done
}

# shellcheck disable=SC2154
package() {
  local _target
  local _include="${pkgdir}/usr/${target}/include/${_pe}"
  local _lib="${pkgdir}/usr/${target}/lib/${_pe}"
  mkdir -p "${pkgdir}/${_pe}-include"
  mkdir -p "${pkgdir}/${_pe}-lib"
  cd "${srcdir}/${pkgname}"
  for _target in "${target}"; do
    make -C platform/ps2 DESTDIR="${pkgdir}/usr/${target}" "${_make_opts[@]}" install
    mv "${pkgdir}/usr/${target}/include/"* "${pkgdir}/${_pe}-include"
    mkdir -p "${_include}"
    mv "${pkgdir}/${_pe}-include/"* "${_include}"
    mv "${pkgdir}/usr/${target}/lib/"* "${pkgdir}/${_pe}-lib"
    mkdir -p "${_lib}"
    mv "${pkgdir}/${_pe}-lib/"* "${_lib}"
    cd ..
    rm -rf "${pkgdir}/${_pe}-include" "${pkgdir}/${_pe}-lib"
  done
}
