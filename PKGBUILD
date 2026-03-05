# Maintainer: abod8639 <https://github.com/abod8639>

_pkgname=arduino-cli-manager
pkgname=${_pkgname}-git
pkgver=r61.29d67dd
pkgrel=1
pkgdesc="A powerful interactive shell script to manage Arduino CLI projects"
arch=('any')
url="https://github.com/abod8639/${_pkgname}"
license=('MIT')
depends=('bash' 'arduino-cli')
optdepends=(
  'fzf: for enhanced interactive menus'
  'jq: for update notifications'
  'neovim: for the "Edit Project (nvim)" menu option'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/abod8639/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_pkgname}"
  
  # Define destination directory
  local _dest="${pkgdir}/usr/share/${_pkgname}"
  install -d "${_dest}"
  
  # Install library files
  cp -r lib/ "${_dest}/"
  
  # Install the main script
  install -m755 "arduino-cli-manager.sh" "${_dest}/"
  
  # Create a symlink in /usr/bin for global access
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/${_pkgname}/arduino-cli-manager.sh" "${pkgdir}/usr/bin/${_pkgname}"
  
  # Install documentation and license
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
