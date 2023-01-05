# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

# shellcheck disable=SC2034
_platform="ps2"
_target="mipsel-${_platform}"
_base="sdk"
pkgname="${_platform}-${_base}"
pkgver="v1.3.0"
_lwip_ver="v2.0.3"
pkgrel=1
_pkgdesc=("Homebrew Sony Playstation® 2 videogame system SDK.")
pkgdesc="${_pkgdesc[*]}"
arch=('x86_64')
license=('BSD')
_github="https://github.com/ps2dev"
_local="ssh://git@127.0.0.1:/home/git"
url="${_github}/${_platform}${_base}"
depends=("${_platform}-toolchain")
optdepends=()
_lwip_branch="${_platform}-${_lwip_ver}"
source=("${pkgname}::git+${url}#tag=${pkgver}"
        "lwip::git+${_github}/lwip#branch=${_lwip_branch}")
sha256sums=('SKIP'
            'SKIP')

prepare() {
  rm -rf "${srcdir}/external_deps/lwip"
  mkdir -p "${srcdir}/external_deps"
  cp -r "${srcdir}/lwip" "${srcdir}/${pkgname}/common/external_deps"
}

build() {
  export CFLAGS=""
  export LDLAGS=""
  local _cflags=(-I/usr/mips64r5900el-ps2-elf/include/pthread-embedded)
                 # -nostdinc
                 # -I/usr/mips64r5900el-ps2-elf/include/newlib-nano)
                 # -static)

  local _ldflags=(-L/usr/mips64r5900el-ps2-elf/lib/pthread-embedded
                  # -L/usr/mips64r5900el-ps2-elf/lib/newlib-nano
                  /usr/mips64r5900el-ps2-elf/lib/newlib-nano/libc_nano.a
                  /usr/mips64r5900el-ps2-elf/lib/newlib-nano/libm_nano.a
                  /usr/mips64r5900el-ps2-elf/lib/newlib-nano/libg_nano.a
                  /usr/mips64r5900el-ps2-elf/lib/newlib-nano/crt0.o)

  local _build_opts=(CFLAGS="${_cflags[*]}"
                     CPPFLAGS="${_cflags[*]}"
                     CXXFLAGS="${_cflags[*]}"
                     LDFLAGS="${_ldflags[*]}")

  # export C_INCLUDE_PATH="/usr/mips64r5900el-ps2-elf/include/pthread-embedded"
  export IOP_CFLAGS="${_cflags[*]}"
  export IOP_LDFLAGS="${_cflags[*]}"
  export EE_CFLAGS="${_cflags[*]}"
  export CFLAGS="${_cflags[*]}"
  export CPPFLAGS="${_cflags[*]}"
  export CXXFLAGS="${_cflags[*]}"
  export LDFLAGS="${_ldflags[*]}"
  export PS2SDK="${pkgdir}/opt/ps2dev"
  export IOP_TOOL_PREFIX="mipsel-ps2-elf-"

  cd "${srcdir}/${pkgname}"
  # make clean
  # LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:/usr/mips64r5900el-ps2-elf/lib/pthread-embedded" \
  IOP_CFLAGS="${_cflags[*]}" \
  EE_CFLAGS="${_cflags[*]}" \
  CFLAGS="${_cflags[*]}" \
  CPPFLAGS="${_cflags[*]}" \
  CXXFLAGS="${_cflags[*]}" \
  EE_LDLAGS="${_cflags[*]}" \
  IOP_LDLAGS="${_cflags[*]}" \
  LDFLAGS="${_ldflags[*]}" \
  make "${_build_opts[@]}" build
}

# shellcheck disable=SC2154
package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgname}" install
  # echo "metapackage"
}
