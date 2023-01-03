# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

# shellcheck disable=SC2034
_platform="ps2"
_target="mipsel-${_platform}"
_base="sdk"
pkgname="${_platform}-${_base}"
pkgver=v1.0
pkgrel=1
_pkgdesc=("Homebrew Sony Playstation® 2 videogame system SDK.")
pkgdesc="${_pkgdesc[*]}"
arch=('x86_64')
license=('BSD')
_github="https://github.com/ps2dev"
_local="ssh://git@127.0.0.1:/home/git"
url="${_github}/${_platform}${_base}"
depends=("${_platform}-"{"dvp","iop"})
         # "${_platform}-ee")
optdepends=()
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

build() {
  export CFLAGS=""
  export LDLAGS=""

  local _cflags=(-static
                 -I/usr/mips64r5900el-ps2-elf/include
                 -I/usr/mips64r5900el-ps2-elf/include/newlib-nano
                 -I/usr/mips64r5900el-ps2-elf/include/pthread-embedded
                 -include /usr/mips64r5900el-ps2-elf/include/pthread-embedded/sys/pte_generic_osal.h)

  local _ldflags=(-L/usr/mips64r5900el-ps2-elf/lib
                  -L/usr/mips64r5900el-ps2-elf/lib/newlib-nano
                  -L/usr/mips64r5900el-ps2-elf/lib/pthread-embedded
                  -l:libthread.a
                  -Bstatic)

  local _build_opts=(CFLAGS="${_cflags[*]}"
                     CPPFLAGS="${_ldflags[*]}"
                     CXXFLAGS="${_ldflags[*]}"
                     LDFLAGS="${_ldflags[*]}")

  export C_INCLUDE_PATH="/usr/mips64r5900el-ps2-elf/include/pthread-embedded"
  export CFLAGS="${_cflags[*]}"
  export CPPFLAGS="${_cflags[*]}"
  export CXXFLAGS="${_cflags[*]}"
  export LDFLAGS="${_ldflags[*]}"

  cd "${srcdir}/${pkgname}"
  # make clean
  CFLAGS="${_cflags[*]}" \
  CPPFLAGS="${_cflags[*]}" \
  CXXFLAGS="${_cflags[*]}" \
  LDFLAGS="${_ldlags[*]}" \
  make "${_build_opts[@]}" build
}

# shellcheck disable=SC2154
package() {
  echo "metapackage"
}
