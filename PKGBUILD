# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

# shellcheck disable=SC2034
_module="iop"
_platform="ps2"
_target="mipsel-${_platform}"
target="${_target}-irx"
_base="toolchain"
pkgname=("${target}-gcc-stage1")
pkgver="v11.3.0"
pkgrel=1
_pkgdesc=("The GNU Compiler Collection. Stage 1 for toolchain building (${target}).")
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
             "gmp4-static"
             "zstd-static")
optdepends=()
_branch="${_module}-${pkgver}"
_commit="331453616ac96717cfef82d21c03573c8984f17d"
source=("${pkgname}::git+${url}#commit=${_commit}")
# source=("${pkgname}::git+${_local}/${_platform}-gcc#commit=${_branch}")
sha256sums=('SKIP')

_n_cpu="$(getconf _NPROCESSORS_ONLN)"
_make_opts=(-j "${_n_cpu}")

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
  export PATH="${PATH}:${_bu_bin}"
  export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:/usr/lib"

  local _cflags=(-D_FORTIFY_SOURCE=0
                 -O2
                 -Wno-implicit-function-declaration
                 -I/usr/include
                 -L/usr/lib
                 # -ldl
                 -static)

  local _ldflags=(-I/usr/include
                  # -rdynamic
                  -L/usr/lib
                  # -ldl
                  -Bstatic
                  -s)

  local _libs=(-L/usr/lib)
               # -ldl
               # /usr/lib/libmpc.so
               # /usr/lib/libmpfr.so
               # /usr/lib/libgmp.so)

  local _build_opts=(${_make_opts[@]}
                     CFLAGS="${_cflags[*]}"
                     CXXFLAGS="${_cflags[*]}"
                     CPPFLAGS="${_cflags[*]}"
                     LDFLAGS="${_ldflags[*]}"
                     LIBS="${_libs[*]}")

  cd "${srcdir}/${pkgname}"

  for _target in "mipsel-ps2-irx" "mipsel-ps2-elf"; do
    _tbu_bin="${srcdir}/${_bu}-root/${_usr}/${_target}/bin"
    export PATH="${PATH}:${_tbu_bin}"
    rm -rf "build-${_target}"
    mkdir -p "build-${_target}"
    cd "build-${_target}"
    local _configure_opts=(--prefix="/usr"
                           --target="${_target}"
                           --host=${CHOST}
                           --build=${CHOST}
                           --infodir="/usr/${_target}/share/info"
                           --mandir="/usr/${_target}/share/man"
                           --enable-languages="c"
                           --with-float=soft
                           --with-gmp
                           --with-mpfr
                           --with-mpc
                           --without-headers
                           --with-headers=no
                           --without-newlib
                           --without-cloog
                           --without-ppl
                           --disable-bootstrap
                           --disable-decimal-float
                           --disable-libada
                           --disable-libatomic
                           --disable-libffi
                           --disable-libgomp
                           --disable-libmudflap
                           --disable-libquadmath
                           --disable-libssp
                           --disable-libstdcxx-pch
                           --disable-multilib
                           --disable-shared
                           --disable-threads
                           --disable-target-libiberty
                           --disable-target-zlib
                           --disable-nls
                           --disable-tls)

    LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:/usr/lib" \
    CC="/usr/bin/gcc" \
    CXX="/usr/bin/g++" \
    CFLAGS="${_cflags[*]}" \
    CXXFLAGS="${_cxxflags[*]}" \
    LDFLAGS="${_ldflags[*]}" \
    LIBS="${_libs[*]}" \
    "../configure" ${_configure_opts[@]}

    LD_LIBRARY_PATH=/usr/lib \
    CC="/usr/bin/gcc" \
    CXX="/usr/bin/g++" \
    CFLAGS="${_cflags[*]}" \
    CXXFLAGS="${_cxxflags[*]}" \
    LDFLAGS="${_ldflags[*]}" \
    LIBS="${_libs[*]}" \
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
