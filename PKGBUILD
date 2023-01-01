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
_pkgdesc=("EE compiler which is used in the creation of homebrew software "
          "for the Sony PlayStation® 2 videogame system.")
pkgdesc="${_pkgdesc[*]}"
arch=('x86_64')
license=('BSD')
_github="https://github.com/ps2dev"
_local="ssh://git@127.0.0.1:/home/git"
url="${_github}/${_platform}${_base}-${_module}"
checkdepends=('shellcheck')
makedepends=("${target}-gcc-stage1"
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

_n_cpu="$(getconf _NPROCESSORS_ONLN)"
_make_opts=(-j "${_n_cpu}")

ldflags=(${LDFLAGS}
         -Bstatic
         -s)


# shellcheck disable=SC2154
build() {
  local _target

  local cflags=(-static
                -Wno-implicit-function-declaration)

  export CFLAGS=""
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
  cd "${srcdir}/${pkgname}"
  for _target in "${target}"; do
    make -C platform/ps2 DESTDIR="${pkgdir}" "${_make_opts[@]}" install
    cd ..
  done
}
