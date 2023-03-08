# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

# shellcheck disable=SC2034
_pkg="psdevkit"
_target="arm-none-eabi"
_platform="pocket-station"
_pkgbase="${_platform}-devkit"
pkgbase="${_pkgbase}-git"
pkgname=("${pkgbase}"
         "${_platform}-tools-git"
         "${_platform}-example-app-git")
pkgver=v
pkgrel=1
pkgdesc='A Sony PocketStation development kit.'
arch=('any')
license=('custom')
_license="mixed"
_gitlab="https://gitlab.com/tallero"
_local="ssh://git@127.0.0.1:/home/git"
url="${_gitlab}/${_pkg}"
depends=()
_gccver="55"
_include="/usr/${_target}/include"
makedepends=("${_target}-gcc${_gccver}")
checkdepends=()
optdepends=()
_branch="develop"
source=("${_pkg}::git+${_local}/${_pkg}#branch=${_branch}")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkg}" || exit
  echo "v$(git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}

package_pocket-station-devkit-git() {
  depends+=("${_platform}-tools"
            "${_platform}-example-app")
}

# shellcheck disable=SC2154
package_pocket-station-tools-git() {
  provides+=("${_platform}-tools")
  conflicts=("${_pkgbase}")
  local _bin="${pkgdir}/usr/bin" _dir
  local _pin="${srcdir}/bin"
  mkdir -p "${_pin}"
  mkdir -p "${_bin}"
  cd "${_pkg}/tools" || exit
  for _dir in $(ls .); do
    cd "${_dir}"
    gcc -o "./${_dir}" "main.c"
    mv "${_dir}" "${_pin}"
    cd ..
  done
  cp "${_pin}/"* "${_bin}"
}

# shellcheck disable=SC2154
package_pocket-station-example-app-git() {
  provides+=("${_platform}-example-app")
  conflicts=("${_platform}-example-app")
  local _pin="${srcdir}/bin"
  cd "${_pkg}/Example" || exit
  ls
  PATH="${PATH}:${_pin}" make
  "${_pin}/bin2mcs" "BESNESP00000GAMETEST" test.bin test.mcs
  ls
  # make DESTDIR="${pkgdir}" PREFIX='/usr' install
}
