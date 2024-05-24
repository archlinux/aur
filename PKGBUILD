# Maintainer: Anton Karmanov <a.karmanov@inventati.org>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

# shellcheck disable=SC2034,SC2164

pkgname='neovim-telescope'
_projname='telescope.nvim'
pkgver='0.1.8'
pkgrel=1
pkgdesc='Extendable fuzzy search for Neovim'
arch=('any')
url="https://github.com/nvim-telescope/telescope.nvim"
license=('MIT')
groups=('neovim-plugins')
depends=('neovim' 'neovim-plenary')
optdepends=(
  'bat: alternative inline previews'
  'fd: finder'
  'neovim-tree-sitter: finder and preview'
  'ripgrep: live_grep(), grep_srting(), find_files()'
  'vim-devicons: icons'
)
checkdepends=(
  'ripgrep'
)
conflicts=("${pkgname}-git")
source=("${_projname}-${pkgver}.tar.gz::$url/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('2480c5675def3368fcc5a6c890ab44f02d95a389743f309ca958f244381065dd')

package() {
  pkgdir=${pkgdir:?}
  local dirs=(data doc lua plugin)
  local docs=(README.md developers.md)

  cd "${_projname}-${pkgver}"

  find "${dirs[@]}" \
    -type f \
    -exec install -Dm644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"

  for file in "${docs[@]}"; do
    install -Dvm644 "$file" -t "$pkgdir/usr/share/doc/$pkgname/"
  done
}

check() {
  cd "${_projname}-${pkgver}"
  make test
}
