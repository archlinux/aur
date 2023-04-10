# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

# shellcheck disable=SC2034
_pkg="psdevkit"
_target="arm-none-eabi"
_platform="pocket-station"
pkgbase="${_platform}-devkit"
pkgname=("${_platform}-tools"
         "${_platform}-example-app")
pkgver=v
pkgrel=1
pkgdesc='A Sony PocketStation development kit.'
arch=('any')
license=('custom')
_license="mixed"
_gitlab="https://gitlab.com/tallero"
_local="ssh://git@127.0.0.1:/home/git"
url="${_gitlab}/${_pkg}"
depends=("psx-mc-cli")
_gccver="55"
_include="/usr/${_target}/include"
makedepends=("${_target}-gcc${_gccver}"
             "${_target}-newlib")
checkdepends=('shellcheck')
optdepends=()
_commit="09f9caa59bdc257a254824bcdb4065bbfaa864af"
source=( # "${_pkg}::git+${_local}/${_pkg}#commit=${_commit}"
         "${_pkg}::git+${_gitlab}/${_pkg}#commit=${_commit}")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkg}" || exit
  echo "v$(git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}

# shellcheck disable=SC2154
package_pocket-station-tools() {
  local _bin="${pkgdir}/usr/bin" _dir
  local _pin="${srcdir}/bin"
  mkdir -p "${_pin}"
  mkdir -p "${_bin}"
  cd "${_pkg}/tools" || exit
  for _dir in $(ls .); do
    cd "${_dir}"
    # arm-none-eabi-gcc -o "./${_dir}" \
    #                        --specs=nosys.specs \
    #                        -I"${_include}" \
    #                        "main.c"
    gcc -o "./${_dir}" "main.c"
    mv "${_dir}" "${_pin}"
    cd ..
  done
  cp "${_pin}/"* "${_bin}"
}

# shellcheck disable=SC2154
package_pocket-station-example-app() {
  local _pin="${srcdir}/bin"
  cd "${_pkg}/Example" || exit
  ls
  PATH="${PATH}:${_pin}" make
  "${_pin}/bin2mcs" "BESNESP00000GAMETEST" test.bin test.mcs
  ls
  # make DESTDIR="${pkgdir}" PREFIX='/usr' install
}
