# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

# shellcheck disable=SC2034
target="mips64r5900el-ps2-elf"
_module="ee"
_platform="ps2"
_pe="pthread-embedded"
_base="toolchain"
pkgname=("${target}-newlib-nano")
pkgver="v4.1.0"
pkgrel=1
pkgdesc="A C library intended for use on embedded systems (${target}, nano version)"
arch=('x86_64')
license=('BSD')
_github="https://github.com/ps2dev"
_local="ssh://git@127.0.0.1:/home/git"
url="${_github}/${_platform}${_base}-${_module}"
checkdepends=('shellcheck')
makedepends=("${target}-binutils"
             "${target}-gcc-stage1"
             "libgmp-static"
             "mpfr-static"
             "libmpc-static"
             "zstd-static")
optdepends=()
_branch="${_module}-${pkgver}"
_commit="6b90d31371ff4e0f41d64d7539038864899a6b40"
source=("${target}-newlib::git+${_github}/newlib#commit=${_commit}")
# source=("${target}-newlib::git+${_local}/${_platform}-newlib#commit=${_branch}")
sha256sums=('SKIP')

_n_cpu="$(getconf _NPROCESSORS_ONLN)"
_make_opts=(-j "${_n_cpu}")

cflags=(-static
        -Wno-implicit-function-declaration)

ldflags=(${LDFLAGS}
         -Bstatic
         -s)

# shellcheck disable=SC2154
build() {
  local _target
  CFLAGS=""
  CXXFLAGS=""
  CPPFLAGS=""
  LDFLAGS=""
  export CFLAGS
  export CXXFLAGS
  export CPPFLAGS
  export LDFLAGS

  local _cflags=(${cflags[@]})
                 # -O2
                 # -D_FORTIFY_SOURCE=0)

  local _ldflags=(${ldflags[@]})
                  # -ldl)

  local _build_opts=(${_make_opts[@]}
                     CFLAGS="${_cflags[*]}"
                     CPPFLAGS="${_cflags[*]}"
                     LDFLAGS="${_ldflags[*]}")

  cd "${srcdir}/${target}-newlib"

  for _target in "${target}"; do
    rm -rf "build-${_target}"
    mkdir -p "build-${_target}"
    cd "build-${_target}"
    local _configure_opts=(--prefix="/usr"
                           --target="${_target}"
                           --disable-newlib-supplied-syscall
                           --enable-newlib-reent-small
                           --disable-newlib-fvwrite-in-streamio
                           --disable-newlib-fseek-optimization
                           --disable-newlib-wide-orient
                           --disable-newlib-nano-malloc
                           --disable-newlib-unbuf-stream-opt
                           --enable-lite-exit
                           --enable-newlib-global-atexit
                           --enable-newlib-nano-formatted-io
                           --disable-nls)

    # CFLAGS_FOR_TARGET="-02" \
    CFLAGS_FOR_TARGET="-DPREFER_SIZE_OVER_SPEED=1 -Os" \
    CFLAGS="${_cflags[*]}" \
    "../configure" "${_configure_opts[@]}"

    make "${_build_opts[@]}" all

    cd ..
  done
}

# shellcheck disable=SC2154
package() {
  local _target
  local _include="${pkgdir}/usr/${target}/include/newlib-nano"
  local _lib="${pkgdir}/usr/${target}/lib/newlib-nano"
  mkdir -p "${pkgdir}/newlib-include"
  mkdir -p "${pkgdir}/newlib-lib"
  cd "${srcdir}/${target}-newlib"
  for _target in "mips64r5900el-ps2-elf"; do
    cd "build-${_target}"
    make DESTDIR="${pkgdir}" ${_make_opts[@]} install-strip
    mv "${pkgdir}/usr/${target}/include/"* "${pkgdir}/newlib-include"
    mkdir -p "${_include}"
    mv "${pkgdir}/newlib-include/"* "${_include}"
    mv "${pkgdir}/usr/${target}/lib/"* "${pkgdir}/newlib-lib"
    mkdir -p "${_lib}"
    mv "${pkgdir}/newlib-lib/"* "${_lib}"
    cd ..
    rm -rf "${pkgdir}/newlib-include" "${pkgdir}/newlib-lib"
  done
}
