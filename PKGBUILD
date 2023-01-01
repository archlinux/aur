# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

# shellcheck disable=SC2034
_module="ee"
_platform="ps2"
target="mips64r5900el-ps2-elf"
_base="toolchain"
pkgname=("${target}-gcc-stage1")
pkgver="v11.3.0"
pkgrel=1
_pkgdesc=("The GNU Compiler Collection. Stage 1 for toolchain building (${target})")
pkgdesc="${_pkgdesc[*]}"
arch=('x86_64')
license=('BSD')
_github="https://github.com/ps2dev"
_local="ssh://git@127.0.0.1:/home/git"
url="${_github}/gcc"
makedepends=("${target}-binutils"
             "libgmp-static"
             "mpfr-static"
             "libmpc-static"
             "zstd-static")
optdepends=()
_branch="${_module}-${pkgver}"
_commit="331453616ac96717cfef82d21c03573c8984f17d"
source=("${pkgname}::git+${_github}/gcc#commit=${_commit}")
# source=("${pkgname}::git+${_local}/${_platform}-gcc#commit=${_branch}")
sha256sums=('SKIP')

_n_cpu="$(getconf _NPROCESSORS_ONLN)"
_make_opts=(-j "${_n_cpu}")

cflags=(-static
        -O2
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
                 -I/usr/include
                 -static)

  local _ldflags=(${ldflags[@]})
                  # -ldl)

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
                           --host=${CHOST}
                           --build=${CHOST}
                           --enable-languages="c"
                           --with-float=hard
                           --without-headers
                           --without-newlib
                           --disable-libssp
                           --disable-multilib
                           --disable-tls)

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
    # make "${_make_opts}" clean
    cd ..
  done
}
