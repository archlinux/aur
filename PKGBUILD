# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

# shellcheck disable=SC2034
_module="ee"
_platform="ps2"
target="mips64r5900el-ps2-elf"
_bu="binutils"
_base="toolchain"
_pkgbase="${_platform}-${_module}"
pkgname=("${target}-binutils")
# pkgver=v1.0
pkgver="v2.38.0"
_bu_ver="v2.38.0"
_gcc_ver="v11.3.0"
_newlib_ver="v4.1.0"
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
makedepends=("libgmp-static"
             "mpfr-static"
             "libmpc-static"
             "zstd-static")
optdepends=()
_branch="${_module}-${pkgver}"
_commit="04d85a33e7dd7a10b937dca8855a526c4b92601a"
source=("${pkgname}::git+${_github}/${_bu}-gdb#commit=${_commit}")
# source=("${pkgname}::git+${_local}/${_platform}-${_bu}-gdb#branch=${_branch}")
# source=("${pkgname}::git+${_local}/${_platform}-${_bu}-gdb#branch=${_branch}"
#         "${pkgbase}-gcc::git+${_local}/${_platform}-gcc#commit=${_gcc_branch}"
#         "${pkgbase}-newlib::git+${_local}/${_platform}-newlib#commit=${_newlib_branch}"
#         "${pkgbase}-${_pe}::git+${_local}/${_platform}-${_pe}#commit=${_pe_branch}")
sha256sums=('SKIP')
            # 'SKIP'
            # 'SKIP'
            # 'SKIP')

_n_cpu="$(getconf _NPROCESSORS_ONLN)"
_make_opts=(-j "${_n_cpu}")
_root="opt/ps2dev"
_usr="${_root}/${_module}"
_bin="${_usr}/bin"

cflags=(-static
        -Wno-implicit-function-declaration)
ldflags=(${LDFLAGS}
         -Bstatic
         -s)

build() {
  "build_${_platform}-${_module}-${_bu}"
  # "build_${_platform}-${_module}-gcc-stage1"
  # "build_${_platform}-${_module}-newlib"
  # "build_${_platform}-${_module}-newlib-nano"
  # "build_${_platform}-${_module}-${_pe}"
  # "build_${_platform}-${_module}-gcc-stage2"
}

# shellcheck disable=SC2154
build_ps2-ee-binutils() {
  provides+=("${_platform}-${_module}-binutils")
  local _target

  local _cflags=(${cflags[@]}
                 -D_FORTIFY_SOURCE=0
                 -O2)

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
    local _configure_opts=(--prefix="/${_usr}"
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
  for _target in "mips64r5900el-ps2-elf"; do
    cd "build-${_target}"
    make DESTDIR="${pkgdir}" "${_make_opts[@]}" install-strip
    cd ..
  done
}
