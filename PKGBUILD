# Maintainer:
# Contributor: Hanatomizu <chart11from21 at outlook dot com>
# Contributor: edward-p <edward AT edward-p DOT xyz>

_pkgname="lunarvim"
pkgname="$_pkgname-git"
pkgver=1.4.0.r5.gaa51c20
pkgrel=2
pkgdesc="An IDE layer for Neovim with sane defaults"
url="https://github.com/LunarVim/LunarVim"
license=('GPL-3.0-only')
arch=('any')

depends=(
  'fzf'
  'git'
  'lua'
  'neovim'
  'neovim-remote'
  'nodejs'
  'tree-sitter'
  'yarn'
)
makedepends=(
  'git'
  'parallel'
  'tree-sitter-cli'
)
optdepends=(
  'ripgrep: optional dependencies for telescope.nvim'
  'lazygit: enables <leader>gg to launch lazygit for intergrated and enhanced Git experience while in lvim'
)

_pkgsrc="$_pkgname"
source=(
  "$_pkgsrc"::"git+$url.git"
  "nvim-treesitter"::"git+https://github.com/nvim-treesitter/nvim-treesitter.git"
  'langs.lua'
)
sha256sums=(
  'SKIP'
  'SKIP'
  '165e39c90fb14aa220b7e0c8082e6b95109f4302acede816ef572f9b5f951ff7'
)

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/nvim-treesitter"
  runtime="$srcdir/nvim-treesitter"

  echo "::: step 1"
  nvim --clean --cmd "set runtimepath+=${runtime}" -l "$srcdir/langs.lua"

  echo "::: step 2"
  langs=$(< langs.txt)

  for lang in ${langs[@]}; do
    if [[ ! -e "$runtime/parser/$lang.so" ]]; then
      echo "nvim --clean --cmd 'set runtimepath+=$runtime' --headless +'TSUpdateSync $lang' +qall"
    fi
  done | parallel -j $(nproc)
}

package() {
  cd "$_pkgsrc"

  mkdir -pm755 "$pkgdir/usr/share/lunarvim"{,/ftplugin}
  cp -r {lua,snapshots,init.lua} "$pkgdir/usr/share/lunarvim"

  mkdir -pm755 "$pkgdir/usr/share/lunarvim/prebuild/nvim-treesitter/parser"{,-info}

  for parser in "$srcdir/nvim-treesitter/parser"/*.so; do
    install -Dm755 "$parser" "$pkgdir/usr/share/lunarvim/prebuild/nvim-treesitter/parser/${parser##/*/}"
  done

  for info in "$srcdir/nvim-treesitter/parser-info"/*; do
    install -Dm755 "$info" "$pkgdir/usr/share/lunarvim/prebuild/nvim-treesitter/parser-info/${info##/*/}"
  done

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/lvim" << 'END'
#!/usr/bin/env sh

export LUNARVIM_RUNTIME_DIR="${LUNARVIM_RUNTIME_DIR:-$HOME/.local/share/lunarvim}"
export LUNARVIM_CONFIG_DIR="${LUNARVIM_CONFIG_DIR:-$HOME/.config/lvim}"
export LUNARVIM_CACHE_DIR="${LUNARVIM_CACHE_DIR:-$HOME/.cache/lvim}"

exec nvim -u "$LUNARVIM_RUNTIME_DIR/lvim/init.lua" "$@"
END

  install -Dm755 /dev/stdin "$pkgdir/usr/share/lunarvim/init-lvim.sh" << 'END'
#!/usr/bin/env bash

mkdir -p ~/.config/lvim
cat > ~/.config/lvim/config.lua << EOL
-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
EOL

mkdir -p ~/.local/share/lunarvim
ln -s /usr/share/lunarvim ~/.local/share/lunarvim/lvim

echo -e "\033[1;32m==> Installing dependencies of NodeJS & Rust...\033[0m"
yarn global add neovim
yarn global add tree-sitter-cli
cargo install fd-find
cargo install ripgrep

echo -e "\033[1;32m==> Preparing Lazy setup...\033[0m"
lvim --headless -c 'quitall'

[ ! -f "$LUNARVIM_CONFIG_DIR/config.lua" ] \
  && cp /usr/share/doc/lunarvim/config.example.lua ~/.config/lvim/config.lua

echo -e "\033[1;32m==> Installing treesitter parsers..\033[0m"
ln -s /usr/share/lunarvim/prebuild/nvim-treesitter/parser/* \
  ~/.local/share/lunarvim/site/pack/lazy/opt/nvim-treesitter/parser/
ln -s /usr/share/lunarvim/prebuild/nvim-treesitter/parser-info/* \
  ~/.local/share/lunarvim/site/pack/lazy/opt/nvim-treesitter/parser-info/

echo -e "\033[1;32m==> Generate the new ftplugin template files..\033[0m"
lvim --headless +LvimUpdate +q

echo -e "\033[1;32m===============================================\033[0m"
echo "lunarvim runtime is inited for $(whoami)"
echo "clean up by:"
echo "    rm -rf ~/.config/lvim ~/.local/share/lunarvim"
echo -e "\033[1;32m===============================================\033[0m"
END
}
