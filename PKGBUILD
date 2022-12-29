# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

# shellcheck disable=SC2034
# _target="arm-none-eabi"
_module="iop"
_platform="ps2"
_pkg="binutils-gdb"
_base="toolchain"
pkgname="${_platform}-${_module}"
pkgver=v2.35.2
pkgrel=1
_pkgdesc=("Tools used in the creation of homebrew software for "
          "the Sony PlayStation® 2 videogame system.")
pkgdesc="${_pkgdesc[*]}"
arch=('any')
license=('BSD')
_github="https://github.com/ps2dev"
_local="ssh://git@127.0.0.1:/home/git"
url="${_github}/${_pkg}"
provides=("${_platform}-${_module}")
checkdepends=('shellcheck')
optdepends=()
_branch="${_module}-${pkgver}"
_commit="9cca5c1781d1a03b9b3b61a3e5270cdb9c69295e"
source=("${pkgname}::git+${_github}/${_pkg}#commit=${_commit}")
# source=("${pkgname}::git+${_local}/${_platform}-${_pkg}#branch=${_branch}")
sha256sums=('SKIP')

# shellcheck disable=SC2154
build() {
  local _target
  local _root="${pkgdir}/opt/ps2dev"
  local _usr="${_root}/${_module}"
  local _bin="${_usr}/bin"
  local _osver="$(uname)"
  local _n_cpu=$(getconf _NPROCESSORS_ONLN)

  local _cflags=(-D_FORTIFY_SOURCE=0
                 -O2
                 -Wno-implicit-function-declaration)

  local _ldflags=(${LDFLAGS}
                  -s)

  local _make_opts=(-j "${_n_cpu}")

  cd "${pkgname}"

  for _target in "mipsel-ps2-irx" "mipsel-ps2-elf"; do
    rm -rf "build-${_target}"
    mkdir -p "build-${_target}"
    cd "build-${_target}"
    local _configure_opts=(--prefix="${_usr}"
                           --target="${_target}"
                           --disable-separate-code
                           --disable-sim
                           --disable-nls)

    "../configure" "${_configure_opts[@]}"

    make "${_make_opts[@]}"
    
    cd ..
  done
}

# shellcheck disable=SC2154
package() {
  local _n_cpu="$(getconf _NPROCESSORS_ONLN)"
  local _make_opts=("-j" "${_n_cpu}")
  local _target
  cd "${pkgname}"
  for _target in "mipsel-ps2-irx" "mipsel-ps2-elf"; do
    cd "build-${_target}"
    make "${_make_opts}" install-strip
    cd ..
  done
}
