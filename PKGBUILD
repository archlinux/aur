# Maintainer: tinywrkb <tinywrkb@gmail.com>

_pkgname=polybar-scripts
pkgname=${_pkgname}-git
pkgver=r445.2324dcc
pkgrel=3
pkgdesc='a community project which collects scripts for polybar'
arch=('x86_64')
url=https://github.com/polybar/${_pkgname}
license=('The Unlicense')
makedepends=(git)
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  set -o pipefail
  git describe --long 2> /dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd ${_pkgname}
  install -Dm644 README.md "${pkgdir}"/usr/share/doc/${_pkgname}/README.md
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${_pkgname}/LICENSE
  while IFS= read -r -d '' _fpath; do
    _fname=$(basename ${_fpath})
    _ppath=$(dirname ${_fpath})
    _pname=$(basename ${_ppath})
    case ${_fname} in
      *.py|*.sh)
        install -Dm755 ${_fpath} "${pkgdir}"/usr/share/polybar/scripts/${_fname}
        ;;
      *)
        install -Dm644 ${_fpath} "${pkgdir}"/usr/share/doc/${_pkgname}/${_pname}/${_fname}
        ;;
     esac
  done < <(find ${_pkgname}/ -maxdepth 2 -type f -not \( -name '*.png' \) -print0)
}
