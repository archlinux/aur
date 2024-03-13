# Maintainer: Anton Karmanov <a.karmanov@inventati.org>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

# shellcheck disable=SC2034,SC2164

pkgname='neovim-telescope'
_projname='telescope.nvim'
pkgver='0.1.6'
pkgrel=1
pkgdesc='Extendable fuzzy search for Neovim'
arch=('any')
url="https://github.com/nvim-telescope/telescope.nvim"
license=('MIT')
groups=('neovim-plugins')
depends=('neovim' 'neovim-plenary')
optdepends=(
  'bat: for inline previews'
  'fd'
  'ripgrep'
  'neovim-tree-sitter'
  'vim-devicons'
)
conflicts=("${pkgname}-git")
source=("${_projname}-${pkgver}.tar.gz::$url/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('4e37fe58054ad226fb1263b22b621355e9ec24432662cf4cb1f28be878470a44')

package() {
  pkgdir=${pkgdir:?}
  local dirs=(data doc lua plugin)
  local docs=(README.md developers.md)

  cd "${_projname}-${pkgver}"

  find "${dirs[@]}" \
    -not \( -path lua/tests -prune \) \
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
