# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

# shellcheck disable=SC2034
_arch="mips"
_platform="ps2"
_iop="${_arch}el-${_platform}"
_ee="${_arch}64r5900el-${_platform}-elf"
_base="sdk"
_pkgname="${_platform}${_base}"
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
url="${_github}/${_pkgname}"
depends=("${_platform}-toolchain")
optdepends=()
_lwip_branch="${_platform}-${_lwip_ver}"
_commit="e21d1bb80642ced81a1290550426ed29dc17c38e"
source=("${pkgname}::git+${url}#commit=${_commit}"
        "lwip::git+${_github}/lwip#branch=${_lwip_branch}")
sha256sums=('SKIP'
            'SKIP')

prepare() {
  rm -rf "${srcdir}/external_deps/lwip"
  mkdir -p "${srcdir}/external_deps"
  cp -r "${srcdir}/lwip" "${srcdir}/${pkgname}/common/external_deps"
}

_cflags=(-I"/usr/${_ee}/include/pthread-embedded")
         # -nostdinc
         # -I"/usr/${_ee}/include/newlib-nano")
         # -static)

_ldflags=(-L"/usr/${_ee}/lib/pthread-embedded"
          # -L"/usr/${_ee}/lib/newlib-nano"
          "/usr/${_ee}/lib/newlib-nano/libc_nano.a"
          "/usr/${_ee}/lib/newlib-nano/libm_nano.a"
          "/usr/${_ee}/lib/newlib-nano/libg_nano.a"
          "/usr/${_ee}/lib/newlib-nano/crt0.o")

_build_opts=(CFLAGS="${_cflags[*]}"
             CPPFLAGS="${_cflags[*]}"
             CXXFLAGS="${_cflags[*]}"
             LDFLAGS="${_ldflags[*]}")


build() {
  export CFLAGS=""
  export CXXFLAGS=""
  export CPPFLAGS=""
  export LDLAGS=""

  # export C_INCLUDE_PATH="/usr/${_ee}/include/pthread-embedded"
  export IOP_CFLAGS="${_cflags[*]}"
  export IOP_LDFLAGS="${_cflags[*]}"
  export EE_CFLAGS="${_cflags[*]}"
  export CFLAGS="${_cflags[*]}"
  export CPPFLAGS="${_cflags[*]}"
  export CXXFLAGS="${_cflags[*]}"
  export LDFLAGS="${_ldflags[*]}"
  export PS2SDK="${pkgdir}/usr"
  export IOP_TOOL_PREFIX="${_iop}-elf-"

  cd "${srcdir}/${pkgname}"
  # make clean
  # LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:/usr/${_ee}/lib/pthread-embedded" \
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

  export CFLAGS=""
  export CXXFLAGS=""
  export CPPFLAGS=""
  export LDLAGS=""

  # export C_INCLUDE_PATH="/usr/${_ee}/include/pthread-embedded"
  export IOP_CFLAGS="${_cflags[*]}"
  export IOP_LDFLAGS="${_cflags[*]}"
  export EE_CFLAGS="${_cflags[*]}"
  export CFLAGS="${_cflags[*]}"
  export CPPFLAGS="${_cflags[*]}"
  export CXXFLAGS="${_cflags[*]}"
  export LDFLAGS="${_ldflags[*]}"
  export PS2SDK="${pkgdir}/usr"
  export IOP_TOOL_PREFIX="${_iop}-elf-"

  cd "${srcdir}/${pkgname}"
  # make clean
  # LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:/usr/${_ee}/lib/pthread-embedded" \
  IOP_CFLAGS="${_cflags[*]}" \
  EE_CFLAGS="${_cflags[*]}" \
  CFLAGS="${_cflags[*]}" \
  CPPFLAGS="${_cflags[*]}" \
  CXXFLAGS="${_cflags[*]}" \
  EE_LDLAGS="${_cflags[*]}" \
  IOP_LDLAGS="${_cflags[*]}" \
  LDFLAGS="${_ldflags[*]}" \
  make DESTDIR="${pkgname}" install
  cd "${pkgdir}/usr"
  ls
  mv "ee" "${_ee}"
  cp -r "iop" "${_iop}-elf"
  mv "iop" "${_iop}-irx"
  mkdir -p "share/${_pkgname}"
  mv AUTHORS "share/${_pkgname}"
  mv samples "share/${_pkgname}"
  mv Defs.make "share/${_pkgname}"
  mv CHANGELOG "share/${_pkgname}"
  mv ID "share/${_pkgname}"
  mv README.md "share/${_pkgname}"
  mkdir -p "include"
  mv "common/include" "include/${_pkgname}"
  rmdir common
  mkdir -p "share/licenses/${_pkgname}"
  mv LICENSE "share/licenses/${_pkgname}"

}
