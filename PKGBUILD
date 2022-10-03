# Maintainer: Marshmallow <marshycity@gmail.com>
pkgname=candyvim-git
pkgver=0.1.0.r0.g1fa5a54
pkgrel=2
pkgdesc="CandyVim WIP"
arch=('any')
url='https://github.com/mrshmllow/CandyVim'
license=()
depends=(
  'neovim'
  'lua'
  'git'
  'fzf'
  'npm'
  'cargo')
makedepends=('git')
optdepends=()
# install=${pkgname}.install
source=("${pkgname}::git+https://github.com/mrshmllow/CandyVim.git"
  "git+https://github.com/wbthomason/packer.nvim")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/${pkgname}"

  mkdir -p "${pkgdir}/usr/share/candyvim/cvim"
  cp -r {lua,snapshots,init.lua} "${pkgdir}/usr/share/candyvim/cvim"
  
  mkdir -p "${pkgdir}/usr/share/candyvim/site/pack/packer/start/"
  cp -r "${srcdir}/packer.nvim" "${pkgdir}/usr/share/candyvim/site/pack/packer/start/"

  sed -e s"#RUNTIME_DIR_VAR#\"${pkgdir}/usr/share/candyvim\"#"g \
    "utils/bin/cvim.template" \
    | tee "cvim" > /dev/null

  install -Dm 755 "cvim" "${pkgdir}/usr/bin/cvim"

  "${pkgdir}/usr/bin/cvim" --headless -c "autocmd User PackerComplete quitall" -c PackerSync &> /dev/null
}

