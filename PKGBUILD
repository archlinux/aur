# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

# shellcheck disable=SC2034
# _target="arm-none-eabi"
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
checkdepends=('shellcheck')
makedepends=("${target}-binutils"
             "${target}-gcc-stage1"
             "${target}-newlib"
             "${target}-newlib-nano"
             "libgmp-static"
             "mpfr-static"
             "libmpc-static"
             "zstd-static")
optdepends=()
_branch="${_module}-${_gcc_ver}"
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
                 # -I"${srcdir}/buildroot/${_usr}/include"
                 # -L"${srcdir}/buildroot/${_usr}/lib"
                 # -I"/usr/include"
                 # -std=c99
                 # -std=c++98
                 # -nostdinc
                 -O2)
                 # -D_FORTIFY_SOURCE=0)

  local _ldflags=(${ldflags[@]})
                  # -ldl
                  # "-lstdio"
                  # "${srcdir}/buildroot/${_usr}/lib/libpthread.a")

  local _build_opts=(${_make_opts[@]}
                     CFLAGS="${_cflags[*]}"
                     CPPFLAGS="${_cflags[*]}"
                     LDFLAGS="${_ldflags[*]}")

  cd "${srcdir}/${target}-gcc"

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

    # CPP="${srcdir}/${_bin}/${_target}-cpp" \
    # CC="${srcdir}/${_bin}/${_target}-gcc" \
    # CC="/usr/bin/gcc" \
    # CPP="/usr/bin/cpp" \
    "../configure" ${_configure_opts[@]}

    # CPP="${srcdir}/${_bin}/${_target}-cpp" \
    # CC="${srcdir}/${_bin}/${_target}-gcc" \
    # CC="/usr/bin/gcc" \
    # CPP="/usr/bin/cpp" \
    make "${_build_opts[@]}" all
    
    cd ..
  done
}

# shellcheck disable=SC2154
package() {
  local _target
  cd "${srcdir}/${target}-gcc"
  for _target in "${target}"; do
    cd "build-${_target}-stage2"
    make DESTDIR="${pkgdir}" "${_make_opts[@]}" install-strip
    cd ..
  done
}
