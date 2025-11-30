# Maintainer: Anton Karmanov <a.karmanov@inventati.org>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

# shellcheck disable=SC2034,SC2164

pkgname='neovim-telescope'
_projname='telescope.nvim'
pkgver='0.2.0'
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
  'ripgrep: live_grep(), grep_srting(), find_files()'
  'vim-devicons: icons'
)
checkdepends=(
  'ripgrep'
)
conflicts=("${pkgname}-git")
source=("${_projname}-${pkgver}.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('96e20b8a67dfc29e220de5e463358bb1118f68755007835034aa2e2f81cd88a6')

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
