# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

# shellcheck disable=SC2034
# _target="arm-none-eabi"
_module="ee"
_platform="ps2"
_bu="binutils-gdb"
_pe="pthread-embedded"
_base="toolchain"
pkgbase="${_platform}-${_module}"
pkgname=("${pkgbase}-${_bu}"
         "${pkgbase}-gcc-stage1"
         "${pkgbase}-newlib"
         "${pkgbase}-newlib-nano"
         "${pkgbase}-${_pe}"
         "${pkgbase}-gcc-stage2")
pkgver=v1.0
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
             "zstd-static")
optdepends=()
_bu_branch="${_module}-${_bu_ver}"
_gcc_branch="${_module}-${_gcc_ver}"
_newlib_branch="${_module}-${_newlib_ver}"
_pe_branch="platform_agnostic"
_bu_commit="04d85a33e7dd7a10b937dca8855a526c4b92601a"
_gcc_commit="331453616ac96717cfef82d21c03573c8984f17d"
_newlib_commit="6b90d31371ff4e0f41d64d7539038864899a6b40"
_pe_commit="ea029de9a92d565fcb00fbf9e0c0ed99df0ef79d"
source=("${pkgbase}-${_bu}::git+${_github}/${_bu}#commit=${_bu_commit}"
        "${pkgbase}-gcc::git+${_github}/gcc#commit=${_gcc_commit}"
        "${pkgbase}-newlib::git+${_github}/newlib#commit=${_newlib_commit}"
        "${pkgbase}-${_pe}::git+${_github}/${_pe}#commit=${_pe_commit}")
# source=("${pkgname}::git+${_local}/${_platform}-${_bu}#branch=${_bu_branch}"
#         "${pkgbase}-gcc::git+${_local}/${_platform}-gcc#commit=${_gcc_branch}"
#         "${pkgbase}-newlib::git+${_local}/${_platform}-newlib#commit=${_newlib_branch}"
#         "${pkgbase}-${_pe}::git+${_local}/${_platform}-${_pe}#commit=${_pe_branch}")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

_n_cpu="$(getconf _NPROCESSORS_ONLN)"
_make_opts=(-j "${_n_cpu}")
_root="opt/ps2dev"
_usr="${_root}/${_module}"
_bin="${_usr}/bin"

build() {
  "build_${_platform}-${_module}-${_bu}"
  "build_${_platform}-${_module}-gcc-stage1"
  "build_${_platform}-${_module}-newlib"
  "build_${_platform}-${_module}-newlib-nano"
  "build_${_platform}-${_module}-${_pe}"
  "build_${_platform}-${_module}-gcc-stage2"
}

# shellcheck disable=SC2154
build_ps2-ee-binutils-gdb() {
  local _target

  local _cflags=(-D_FORTIFY_SOURCE=0
                 -O2
                 # -static
                 -Wno-implicit-function-declaration)

  local _ldflags=(${LDFLAGS}
                  # -Bstatic
                  -s)

  local _build_opts=(${_make_opts[@]}
                     CFLAGS="${_cflags[*]}"
                     CPPFLAGS="${_cflags[*]}"
                     LDFLAGS="${_ldflags[*]}")

  mkdir -p "${srcdir}/${_bu}-root"
  cd "${srcdir}/${pkgbase}-${_bu}"

  for _target in "mips64r5900el-ps2-elf"; do
    rm -rf "build-${_target}"
    mkdir -p "build-${_target}"
    cd "build-${_target}"
    local _configure_opts=(--prefix="/${_usr}"
                           --infodir="/${_usr}/share/info"
                           --target="${_target}"
                           --disable-separate-code
                           --disable-sim
                           --disable-nls)

    "../configure" ${_configure_opts[@]}

    make "${_build_opts[@]}"
    make DESTDIR="${srcdir}/${_bu}-root" "${_make_opts[@]}" install
    
    cd ..
  done
}

# shellcheck disable=SC2154
package_ps2-ee-binutils-gdb() {
  local _target
  cd "${srcdir}/${pkgbase}-${_bu}"
  for _target in "mips64r5900el-ps2-elf"; do
    cd "build-${_target}"
    make DESTDIR="${pkgdir}" "${_make_opts[@]}" install-strip
    cd ..
  done
}

# shellcheck disable=SC2154
build_ps2-ee-gcc-stage1() {
  local _target
  local _tbu_bin
  local _bu_bin="${srcdir}/${_bu}-root/${_bin}"
  export PATH="${PATH}:${_bu_bin}"

  local _cflags=(-D_FORTIFY_SOURCE=0
                 -O2
                 -Wno-implicit-function-declaration
                 -static)

  local _ldflags=(${LDFLAGS}
                  # -ldl
                  # -Bstatic
                  -s)

  local _build_opts=(${_make_opts[@]}
                     CFLAGS="${_cflags[*]}"
                     CPPFLAGS="${_cflags[*]}"
                     LDFLAGS="${_ldflags[*]}")

  cd "${srcdir}/${pkgbase}-gcc"

  for _target in "mips64r5900el-ps2-elf"; do
    _tbu_bin="${srcdir}/${_bu}-root/${_usr}/${_target}/bin"
    export PATH="${PATH}:${_tbu_bin}"
    rm -rf "build-${_target}-stage1"
    mkdir -p "build-${_target}-stage1"
    cd "build-${_target}-stage1"
    local _configure_opts=(--prefix="/${_usr}"
                           --target="${_target}"
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
package_ps2-ee-gcc-stage1() {
  local _target
  cd "${srcdir}/${pkgbase}-gcc"
  for _target in "mips64r5900el-ps2-elf"; do
    cd "build-${_target}-stage1"
    make DESTDIR="${pkgdir}" "${_make_opts[@]}" install-strip
    # make "${_make_opts}" clean
    cd ..
  done
}

# shellcheck disable=SC2154
build_ps2-ee-newlib() {
  local _target

  local _cflags=(-D_FORTIFY_SOURCE=0
                 -O2
                 -Wno-implicit-function-declaration
                 -static)

  local _ldflags=(${LDFLAGS}
                  # -ldl
                  -Bstatic
                  -s)

  local _build_opts=(${_make_opts[@]}
                     CFLAGS="${_cflags[*]}"
                     CPPFLAGS="${_cflags[*]}"
                     LDFLAGS="${_ldflags[*]}")

  cd "${srcdir}/${pkgbase}-newlib"

  for _target in "mips64r5900el-ps2-elf"; do
    _tbu_bin="${srcdir}/${_bu}-root/${_usr}/${_target}/bin"
    export PATH="${PATH}:${_tbu_bin}"
    rm -rf "build-${_target}"
    mkdir -p "build-${_target}"
    cd "build-${_target}"
    local _configure_opts=(--prefix="/${_usr}"
                           --target="${_target}")

    CFLAGS="${_cflags[*]}" \
    CFLAGS_FOR_TARGET="-02" \
    "../configure" "${_configure_opts[@]}"

    make "${_build_opts[@]}" all
    
    cd ..
  done
}

# shellcheck disable=SC2154
package_ps2-ee-newlib() {
  local _target
  cd "${srcdir}/${pkgbase}-newlib"
  for _target in "mips64r5900el-ps2-elf"; do
    cd "build-${_target}"
    make ${_make_opts[@]} install-strip
    make ${_make_opts[@]} clean
    cd ..
  done
}

# shellcheck disable=SC2154
build_ps2-ee-newlib-nano() {
  local _target
  local _cflags=(-O2
                 -Wno-implicit-function-declaration
                 # -D_FORTIFY_SOURCE=0
                 -static
                 -Wno-implicit-function-declaration)

  local _ldflags=(${LDFLAGS}
                  # -ldl
                  -Bstatic
                  -s)

  local _build_opts=(${_make_opts[@]}
                     CFLAGS="${_cflags[*]}"
                     CPPFLAGS="${_cflags[*]}"
                     LDFLAGS="${_ldflags[*]}")

  cd "${srcdir}/${pkgbase}-newlib"

  for _target in "mips64r5900el-ps2-elf"; do
    _tbu_bin="${srcdir}/${_bu}-root/${_usr}/${_target}/bin"
    export PATH="${PATH}:${_tbu_bin}"
    rm -rf "build-${_target}-nano"
    mkdir -p "build-${_target}-nano"
    cd "build-${_target}-nano"
    local _configure_opts=(--prefix="/${_usr}"
                           --target="${_target}"
                           --disable-newlib-supplied-syscall
                           --enable-newlib-reent-small
                           --disable-newlib-fvwrite-in-streamio
                           --disable-newlib-fseek-optimization
                           --disable-newlib-wide-orient
                           --disable-newlib-nano-malloc
                           --disable-newlib-unbuf-stream-opt
                           --enable-lite-exit
                           --enable-newlib-global-atexit
                           --enable-newlib-nano-formatted-io
                           --disable-nls)

    CFLAGS_FOR_TARGET="-DPREFER_SIZE_OVER_SPEED=1 -Os" \
    "../configure" "${_configure_opts[@]}"

    make "${_build_opts[@]}" all
    
    cd ..
  done
}

# shellcheck disable=SC2154
package_ps2-ee-newlib-nano() {
  local _target
  cd "${srcdir}/${pkgbase}-newlib-nano"
  for _target in "mips64r5900el-ps2-elf"; do
    cd "build-${_target}"
    make "${_make_opts[@]}" install-strip
    make "${_make_opts[@]}" clean
    cd ..
  done
}

# shellcheck disable=SC2154
build_ps2-ee-pthread-embedded() {
  local _target

  local _ldflags=(${LDFLAGS}
                  -ldl
                  -s)

  local _build_opts=(${_make_opts[@]}
                     CFLAGS="${_cflags[*]}"
                     CPPFLAGS="${_cflags[*]}"
                     LDFLAGS="${_ldflags[*]}")

  cd "${srcdir}/${pkgbase}-${_pe}"

  for _target in "mips64r5900el-ps2-elf"; do
    cd "platform/${_platform}"

    make "${_make_opts[@]}" all
    cd ..
  done
}

# shellcheck disable=SC2154
package_ps2-ee-pthread-embedded() {
  local _target
  cd "${srcdir}/${pkgbase}-${_pe}"
  for _target in "mips64r5900el-ps2-elf"; do
    cd "platform/${_platform}"
    make "${_make_opts[@]}" install
    make "${_make_opts[@]}" clean
    cd ..
  done
}

# shellcheck disable=SC2154
build_ps2-ee-gcc-stage2() {
  local _target

  local _cflags=(-D_FORTIFY_SOURCE=0
                 -O2
                 -Wno-implicit-function-declaration)

  local _ldflags=(${LDFLAGS}
                  -ldl
                  -s)

  local _build_opts=(${_make_opts[@]}
                     CFLAGS="${_cflags[*]}"
                     CPPFLAGS="${_cflags[*]}"
                     LDFLAGS="${_ldflags[*]}")

  cd "${srcdir}/${pkgbase}-gcc"

  for _target in "mips64r5900el-ps2-elf"; do
    rm -rf "build-${_target}-stage2"
    mkdir -p "build-${_target}-stage2"
    cd "build-${_target}-stage2"
    local _configure_opts=(--prefix="/${_usr}"
                           --target="${_target}"
                           --enable-languages="c,c++"
                           --with-float=hard
                           --with-sysroot="/${_usr}/${_target}"
                           --with-newlib
                           --disable-libssp
                           --disable-multilib
                           --disable-tls
                           --enable-cxx-flags=-G0
                           --enable-threads=posix)

    "../configure" "${_configure_opts[@]}"

    make "${_build_opts[@]}" all
    
    cd ..
  done
}

# shellcheck disable=SC2154
package_ps2-ee-gcc-stage2() {
  local _target
  cd "${srcdir}/${pkgbase}-gcc"
  for _target in "mips64r5900el-ps2-elf"; do
    cd "build-${_target}-stage2"
    make DESTDIR="${pkgdir}" "${_make_opts[@]}" install-strip
    make "${_make_opts[@]}" clean
    cd ..
  done
}
