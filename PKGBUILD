# Maintainer:  edward-p <edward AT edward-p DOT xyz>

pkgname=lunarvim-git
pkgver=1.2.0.r57.gb661efb3
pkgrel=1
pkgdesc="An IDE layer for Neovim with sane defaults. Completely free and community driven."
arch=('any')
url='https://github.com/LunarVim/LunarVim'
license=('GPL3')
depends=(
  'neovim'
  'lua'
  'git'
  'fzf'
  'neovim-remote'
  'tree-sitter'
  'python-pynvim'
  'nodejs'
  'yarn')
makedepends=('git')
optdepends=('ripgrep: optional dependencies for telescope.nvim')
install=${pkgname}.install
langs=(bash beancount bibtex
  c c_sharp clojure cmake comment commonlisp cpp css cuda
  dart devicetree dockerfile dot
  elixir erlang
  fennel fish
  go gomod graphql
  hcl heex html
  java javascript jsdoc json json5 julia
  kotlin
  latex ledger lua
  nix
  ocaml ocaml_interface ocamllex
  perl php pioasm python
  ql
  Tree-sitterquerylanguage
  r regex rst ruby rust
  scala scss sparql supercollider surface svelte
  teal tlaplus toml tsx turtle typescript
  verilog vim vue
  yaml yang
  zig)
source=("${pkgname}::git+https://github.com/LunarVim/LunarVim.git#branch=release-1.2/neovim-0.8"
  "git+https://github.com/nvim-treesitter/nvim-treesitter.git#branch=0.5-compat"
  "init-lvim.sh"
  "lvim")
sha256sums=('SKIP'
            'SKIP'
            '64474d473e462cea404b14cf15d0c9582d2c65be99443c8128a8d9bb0e2b6a41'
            'fe16e9974a8a4ee877d63e15f346c6f886c357e08c08a7e300e29092d5ec732a')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/nvim-treesitter"
  runtime="${srcdir}/nvim-treesitter"

  for lang in ${langs[@]}; do
    if [[ ! -e ${runtime}/parser/${lang}.so ]]; then
      nvim --cmd "set runtimepath+=${runtime}" --headless \
        +"TSUpdateSync ${lang}" +qall
    fi
  done
}

package() {
  cd "${srcdir}/${pkgname}"

  mkdir -p "${pkgdir}/usr/share/lunarvim"{,/ftplugin}
  cp -r {ftdetect,lua,snapshots,init.lua} "${pkgdir}/usr/share/lunarvim"

  mkdir -p "${pkgdir}/usr/share/lunarvim/prebuild/nvim-treesitter/parser"{,-info}

  for parser in "${srcdir}/nvim-treesitter/parser/"*.so; do
    install -Dm 755 "${parser}" "${pkgdir}/usr/share/lunarvim/prebuild/nvim-treesitter/parser/${parser##/*/}"
  done

  for info in "${srcdir}/nvim-treesitter/parser/"*; do
    install -Dm 755 "${info}" "${pkgdir}/usr/share/lunarvim/prebuild/nvim-treesitter/parser/${info##/*/}"
  done

  install -Dm 644 "README.md" "${pkgdir}/usr/share/doc/lunarvim/README.md"
  install -Dm 644 "CONTRIBUTING.md" "${pkgdir}/usr/share/doc/lunarvim/CONTRIBUTING.md"
  install -Dm 644 "utils/installer/config.example.lua" "${pkgdir}/usr/share/doc/lunarvim/config.example.lua"
  install -Dm 755 "${srcdir}/lvim" "${pkgdir}/usr/bin/lvim"
  install -Dm 755 "${srcdir}/init-lvim.sh" "${pkgdir}/usr/share/lunarvim/init-lvim.sh"
}
