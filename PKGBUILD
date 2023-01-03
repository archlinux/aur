# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

# shellcheck disable=SC2034
target="dvp"
_platform="ps2"
_bu="binutils"
_pkg="${_bu}-gdb"
_base="toolchain"
pkgname="${target}-binutils"
pkgver="v2.14"
pkgrel=1
_pkgdesc=("A set of programs to assemble and manipulate binary and object files "
          "for the Sony PlayStation® 2 videogame system (binutils, ${target}).")
pkgdesc="${_pkgdesc[*]}"
arch=('x86_64')
license=('BSD')
_github="https://github.com/ps2dev"
_local="ssh://git@127.0.0.1:/home/git"
url="${_github}/${_pkg}"
_branch="${_module}-${pkgver}"
_commit="9cca5c1781d1a03b9b3b61a3e5270cdb9c69295e"
source=("${pkgname}::git+${_github}/${_pkg}#commit=${_commit}")
# source=("${pkgname}::git+${_local}/${_platform}-${_pkg}#branch=${_branch}")
sha256sums=('SKIP')

_osver="$(uname)"
_n_cpu=$(getconf _NPROCESSORS_ONLN)
_make_opts=(-j "${_n_cpu}")

# shellcheck disable=SC2154
build() {
  local _target

  local _cflags=(-D_FORTIFY_SOURCE=0
                 -O2
                 -Wno-implicit-function-declaration)

  local _ldflags=(${LDFLAGS}
                  -s)

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
                           --disable-nls
                           --disable-build-warnings)

    "../configure" ${_configure_opts[@]}

    make # ${_build_opts[@]}
    
    cd ..
  done
}

# shellcheck disable=SC2154
package() {
  local _target
  cd "${srcdir}/${pkgname}"
  for _target in "${target}"; do
    cd "build-${_target}"
    make DESTDIR="${pkgdir}" install # ${_make_opts[@]}
    cd ..
  done
}
