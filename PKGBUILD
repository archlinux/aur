# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

# shellcheck disable=SC2034
target="mips64r5900el-ps2-elf"
_module="ee"
_platform="ps2"
_base="toolchain"
pkgname="${target}-gcc"
pkgver="v11.3.0"
pkgrel=1
_pkgdesc=("EE compiler which is used in the creation of homebrew software "
          "for the Sony PlayStation® 2 videogame system.")
pkgdesc="${_pkgdesc[*]}"
arch=('x86_64')
license=('BSD')
_github="https://github.com/ps2dev"
_local="ssh://git@127.0.0.1:/home/git"
url="${_github}/${_platform}${_base}-${_module}"
makedepends=("${target}-binutils"
             "${target}-gcc-stage1"
             "${target}-newlib"
             "${target}-newlib-nano"
             "${target}-pthread-embedded"
             "libgmp-static"
             "mpfr-static"
             "libmpc-static"
             "zstd-static")
optdepends=()
_branch="${_module}-${pkgver}"
_commit="331453616ac96717cfef82d21c03573c8984f17d"
source=("${target}-gcc::git+${_github}/gcc#commit=${_commit}")
# source=("${pkgbase}-gcc::git+${_local}/${_platform}-gcc#commit=${_branch}")
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

  local _cflags=(${cflags[@]}
                 -I"/usr/${target}/include/pthread-embedded"
                 # -include "/usr/${target}/include/pthread-embedded/pthread.h"
                 -I"/usr/${target}/include/pthread-embedded/bits"
                 # -I"/usr/${target}/include/newlib-nano"
                 # -std=c99
                 # -std=c++98
                 # -nostdinc
                 -O2)

  local _ldflags=(${ldflags[@]}
                  -L"/usr/${target}/lib/pthread-embedded"
                  -L"/usr/${target}/lib/newlib-nano")

  local _build_opts=(${_make_opts[@]}
                     CFLAGS="${_cflags[*]}"
                     CPPFLAGS="${_cflags[*]}"
                     LDFLAGS="${_ldflags[*]}")

  cd "${srcdir}/${pkgname}"

  for _target in "${target}"; do
    rm -rf "build-${_target}"
    mkdir -p "build-${_target}"
    cd "build-${_target}"
    local _configure_opts=(--prefix="/usr"
                           --target="${_target}"
                           --enable-languages="c,c++"
                           --with-float=hard
                           --with-sysroot="/usr/${_target}"
                           --with-newlib
                           --disable-libssp
                           --disable-multilib
                           --disable-tls
                           --enable-cxx-flags=-G0
                           --enable-threads=posix)

    "../configure" ${_configure_opts[@]}

    make "${_build_opts[@]}" all
    
    cd ..
  done
}

# shellcheck disable=SC2154
package() {
  local _target
  cd "${srcdir}/${pkgname}"
  for _target in "${target}"; do
    cd "build-${_target}"
    make DESTDIR="${pkgdir}" "${_make_opts[@]}" install-strip
    cd ..
  done
}
