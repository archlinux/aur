# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

# shellcheck disable=SC2034
# _target="arm-none-eabi"
_module="iop"
_platform="ps2"
_bu="binutils-gdb"
_base="toolchain"
pkgbase="${_platform}-${_module}"
pkgname=("${pkgbase}-${_bu}"
         "${pkgbase}-gcc")
pkgver=v1.0
_bu_ver="v2.35.2"
_gcc_ver="v11.3.0"
pkgrel=1
_pkgdesc=("IOP compiler used in the creation of homebrew software "
          "for the Sony PlayStation® 2 videogame system.")
pkgdesc="${_pkgdesc[*]}"
arch=('any')
license=('BSD')
_github="https://github.com/ps2dev"
_local="ssh://git@127.0.0.1:/home/git"
url="${_github}/${_platform}${_base}-${_module}"
checkdepends=('shellcheck')
optdepends=()
_bu_branch="${_module}-${_bu_ver}"
_gcc_branch="${_module}-${_gcc_ver}"
_bu_commit="04d85a33e7dd7a10b937dca8855a526c4b92601a"
_gcc_commit="331453616ac96717cfef82d21c03573c8984f17d"
source=("${pkgbase}-${_bu}::git+${_github}/${_bu}#commit=${_bu_commit}"
        "${pkgbase}-gcc::git+${_github}/gcc#commit=${_gcc_commit}")
# source=("${pkgname}::git+${_local}/${_platform}-${_bu}#branch=${_bu_branch}")
#         "${pkgbase}-gcc::git+${_local}/${_platform}-gcc#commit=${_gcc_branch}")
sha256sums=('SKIP'
            'SKIP')

# shellcheck disable=SC2154
build_ps2-iop-binutils-gdb() {
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
  local _build_opts=(${_make_opts[@]}
                     CFLAGS="${_cflags[*]}"
                     CPPFLAGS="${_cflags[*]}"
                     LDFLAGS="${_ldflags[*]}")

  cd "${srcdir}/${pkgbase}-${_bu}"

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

    make "${_build_opts[@]}"
    
    cd ..
  done
}

# shellcheck disable=SC2154
package_ps2-iop-binutils-gdb() {
  local _n_cpu="$(getconf _NPROCESSORS_ONLN)"
  local _make_opts=("-j" "${_n_cpu}")
  local _target
  cd "${srcdir}/${pkgbase}-${_bu}"
  echo $(pwd)
  ls
  for _target in "mipsel-ps2-irx" "mipsel-ps2-elf"; do
    cd "build-${_target}"
    make "${_make_opts}" install-strip
    cd ..
  done
}

# shellcheck disable=SC2154
build_ps2-iop-gcc() {
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
  local _build_opts=(${_make_opts[@]}
                     CFLAGS="${_cflags[*]}"
                     CPPFLAGS="${_cflags[*]}"
                     LDFLAGS="${_ldflags[*]}")

  cd "${srcdir}/${pkgbase}-gcc"

  for _target in "mipsel-ps2-irx" "mipsel-ps2-elf"; do
    rm -rf "build-${_target}"
    mkdir -p "build-${_target}"
    cd "build-${_target}"
    local _configure_opts=(--prefix="${_usr}"
                           --target="${_target}"
                           --enable-languages="c"
                           --with-float=soft
                           --with-headers=no
                           --without-newlib
                           --without-clog
                           --without-ppl
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

    "../configure" "${_configure_opts[@]}"

    make "${_build_opts[@]}"
    
    cd ..
  done
}

# shellcheck disable=SC2154
package_ps2-iop-gcc() {
  local _n_cpu="$(getconf _NPROCESSORS_ONLN)"
  local _make_opts=("-j" "${_n_cpu}")
  local _target
  cd "${srcdir}/${pkgbase}-gcc"
  for _target in "mipsel-ps2-irx" "mipsel-ps2-elf"; do
    cd "build-${_target}"
    make "${_make_opts}" install-strip
    cd ..
  done
}

build() {
  "build_${_platform}-${_module}-"{"${_bu}","gcc"}
}
