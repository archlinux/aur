# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

# shellcheck disable=SC2034
_module="iop"
_platform="ps2"
target="mipsel-${_platform}-elf"
_bu="binutils"
_base="toolchain"
pkgname=("${target}-${_bu}")
pkgver="v2.35.2"
pkgrel=1
_pkgdesc=("A set of programs to assemble and manipulate binary and object files "
          "for the Sony PlayStation® 2 videogame system (binutils, ${_target}).")
pkgdesc="${_pkgdesc[*]}"
arch=('x86_64')
license=('BSD')
_github="https://github.com/ps2dev"
_local="ssh://git@127.0.0.1:/home/git"
url="${_github}/${_bu}-gdb"
checkdepends=('shellcheck')
makedepends=("libgmp-static"
             "mpfr-static"
             "libmpc-static"
             "gmp4-static"
             "gcc7"
             "zstd-static")
optdepends=()
_branch="${_module}-${pkgver}"
_commit="04d85a33e7dd7a10b937dca8855a526c4b92601a"
source=("${pkgname}::git+${_github}/${_bu}-gdb#commit=${_commit}")
# source=("${pkgname}::git+${_local}/${_platform}-${_bu}#branch=${_branch}")
sha256sums=('SKIP')

_n_cpu="$(getconf _NPROCESSORS_ONLN)"
_make_opts=(-j "${_n_cpu}")


# shellcheck disable=SC2154
build() {
  local _target

  local _cflags=(-D_FORTIFY_SOURCE=0
                 -O2
                 -I/usr/include
                 -L/usr/lib
                 -Wno-implicit-function-declaration)

  local _ldflags=(${LDFLAGS}
                  -I/usr/include
                  -L/usr/lib
                  -lgmp
                  -lmpfr
                  -lmpc
                  -static
                  /usr/lib/libgmp4.a
                  /usr/lib/libgmpxx4.a
                  /usr/lib/libgmp.a
                  /usr/lib/libmpfr.a
                  /usr/lib/libmpc.a
                  -s)

  local _build_opts=(${_make_opts[@]}
                     CFLAGS="${_cflags[*]}"
                     CPPFLAGS="${_cflags[*]}"
                     LDFLAGS="${_ldflags[*]}")

  # mkdir -p "${srcdir}/${pkgname}"
  cd "${srcdir}/${pkgname}"

  for _target in "${target}"; do
    rm -rf "build-${_target}"
    mkdir -p "build-${_target}"
    cd "build-${_target}"
    local _configure_opts=(--prefix="/usr"
                           --target="${_target}"
                           --infodir="/usr/${_target}/share/info"
                           --disable-separate-code
                           --disable-sim
                           --with-gmp
                           --with-mpfr
                           --with-mpc
                           --disable-nls)

    LD_LIBRARY_PATH=/usr/lib \
    CC="/usr/bin/gcc" \
    CXX="/usr/bin/g++" \
    CFLAGS="${_cflags[*]}" \
    CXXFLAGS="${_cxxflags[*]}" \
    LDFLAGS="${_ldflags[*]}" \
    LIBS="${_libs[*]}" \
    "../configure" ${_configure_opts[@]}

    make "${_build_opts[@]}"
    
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
  # rm -rf "${pkgdir}/opt/ps2dev/iop/share/info/dir"
}
