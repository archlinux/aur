# Maintainer: Sainnhe Park <sainnhe@gmail.com>
pkgname=neovim-coc-master-git
pkgver=0.0.80.r23.ga336a8bc
pkgrel=1
pkgdesc='Intellisense engine for Vim8 & Neovim, full language server protocol support as VSCode (master branch)'
arch=('any')
url='https://github.com/neoclide/coc.nvim'
license=('MIT')
depends=('neovim' 'nodejs')
optdepends=('npm: for installing coc extensions'
            'yarn: for installing coc extensions'
            'neovim-coc-extras-meta: some basic extensions')
makedepends=('git' 'yarn')
provides=('neovim-coc')
conflicts=('neovim-coc')
source=('git+https://github.com/neoclide/coc.nvim.git#branch=master')
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/coc.nvim"
    git describe release --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/coc.nvim"
    yarn install --frozen-lockfile --preferred-cache-folder "${srcdir}/.cache"
    yarn run build
}

package() {
    cd "${srcdir}/coc.nvim"
    nvim -es --cmd ":helptags doc" --cmd ":q"
    find autoload build data doc package.json plugin -type f -exec \
        install -Dm 644 '{}' "${pkgdir}/usr/share/nvim/runtime/pack/coc/start/coc.nvim/{}" \;
    install -Dm 644 "${srcdir}/coc.nvim/LICENSE.md" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
