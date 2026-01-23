# Maintainer: Anton Karmanov <a.karmanov@inventati.org>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

# shellcheck disable=SC2034,SC2164

pkgname='neovim-telescope'
_projname='telescope.nvim'
pkgver='0.2.1'
pkgrel=2
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
source=(
  "${_projname}-${pkgver}.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz"
  '3613.patch'
)
b2sums=(
  'e3b615602b62fbb1f61f8840ff23b66c080473ae0fbfabb63fabe31b963ff351b224684e4081b15de8ecc02cfe5c11d400fa4fd74e3222e8c6eca0a7db1ba88c'
  'a8afad94895e290edb692206fd6b2a998dd973f79c82ef58880abe9be84b0532de00ed4506c61a80409d6e1cd9a78ccf46d4ef58418fc118e0da8e5491a7912a'
)

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
  # https://github.com/nvim-telescope/telescope.nvim/issues/3613
  patch 'scripts/minimal_init.vim' < '../3613.patch'
  make test
}
