# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

# shellcheck disable=SC2034
_module="ee"
_platform="ps2"
target="mips64r5900el-ps2-elf"
_bu="binutils"
_base="toolchain"
pkgname=("${target}-binutils")
pkgver="v2.38.0"
pkgrel=1
_pkgdesc=("A set of programs to assemble and manipulate binary and object files "
          "for the Sony PlayStation® 2 videogame system (binutils).")
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
             "zstd-static")
optdepends=()
provides=("${_platform}-${_module}-${_bu}")
_branch="${_module}-${pkgver}"
_commit="04d85a33e7dd7a10b937dca8855a526c4b92601a"
source=("${pkgname}::git+${_github}/${_bu}-gdb#commit=${_commit}")
# source=("${pkgname}::git+${_local}/${_platform}-${_bu}-gdb#branch=${_branch}")
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

  local _cflags=(${cflags[@]})

  local _ldflags=(${ldflags[@]})

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
                           --infodir="/usr/share/info"
                           --target="${_target}"
                           --disable-separate-code
                           --disable-sim
                           --disable-nls)

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
}
