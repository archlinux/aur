# Maintainer: Hanatomizu <chart11from21 at outlook dot com>
# Contributor:  edward-p <edward AT edward-p DOT xyz>

pkgname=lunarvim-git
pkgver=1.4.0.r3.g85ccca97
pkgrel=3
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
  'yarn'
)
makedepends=(
    'git'
    'tree-sitter-cli'
)
optdepends=(
    'ripgrep: optional dependencies for telescope.nvim'
    'lazygit: enables <leader>gg to launch lazygit for intergrated and enhanced Git experience while in lvim'
    )
install=${pkgname}.install
source=("${pkgname}::git+https://github.com/LunarVim/LunarVim.git#branch=master"
  "git+https://github.com/nvim-treesitter/nvim-treesitter.git#branch=master"
  "init-lvim.sh"
  "lvim"
  "langs.lua")
sha256sums=('SKIP'
            'SKIP'
            '292b573c40e8ccad72c70e6602496077835e1370122035685b6a88606004abe0'
            'fe16e9974a8a4ee877d63e15f346c6f886c357e08c08a7e300e29092d5ec732a'
            '165e39c90fb14aa220b7e0c8082e6b95109f4302acede816ef572f9b5f951ff7')



pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/nvim-treesitter"
  runtime="${srcdir}/nvim-treesitter"

  nvim --clean --cmd "set runtimepath+=${runtime}" -l ${srcdir}/langs.lua
  
  langs=$(<langs.txt)

  for lang in ${langs[@]}; do
    if [[ ! -e ${runtime}/parser/${lang}.so ]]; then
      nvim --clean --cmd "set runtimepath+=${runtime}" --headless \
        +"TSUpdateSync ${lang}" +qall
      echo 
    fi
  done
}

package() {
  cd "${srcdir}/${pkgname}"

  mkdir -p "${pkgdir}/usr/share/lunarvim"{,/ftplugin}
  cp -r {lua,snapshots,init.lua} "${pkgdir}/usr/share/lunarvim"

  mkdir -p "${pkgdir}/usr/share/lunarvim/prebuild/nvim-treesitter/parser"{,-info}

  for parser in "${srcdir}/nvim-treesitter/parser/"*.so; do
    install -Dm 755 "${parser}" "${pkgdir}/usr/share/lunarvim/prebuild/nvim-treesitter/parser/${parser##/*/}"
  done

  for info in "${srcdir}/nvim-treesitter/parser-info/"*; do
    install -Dm 755 "${info}" "${pkgdir}/usr/share/lunarvim/prebuild/nvim-treesitter/parser-info/${info##/*/}"
  done

  install -Dm 644 "README.md" "${pkgdir}/usr/share/doc/lunarvim/README.md"
  install -Dm 644 "CONTRIBUTING.md" "${pkgdir}/usr/share/doc/lunarvim/CONTRIBUTING.md"
  install -Dm 644 "utils/installer/config.example.lua" "${pkgdir}/usr/share/doc/lunarvim/config.example.lua"
  install -Dm 755 "${srcdir}/lvim" "${pkgdir}/usr/bin/lvim"
  install -Dm 755 "${srcdir}/init-lvim.sh" "${pkgdir}/usr/share/lunarvim/init-lvim.sh"
}
