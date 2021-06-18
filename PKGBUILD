# Maintainer: Sainnhe Park <sainnhe@gmail.com>
pkgname=vim-coc-git
pkgver=0.0.80.r44.g67fb4d13
pkgrel=1
pkgdesc='Intellisense engine for Vim8 & Neovim, full language server protocol support as VSCode'
arch=('any')
url='https://github.com/neoclide/coc.nvim'
license=('MIT')
depends=('vim' 'nodejs')
optdepends=('npm: for installing coc extensions'
            'yarn: for installing coc extensions'
            'watchman: for workspace_didChangeWatchedFiles feature')
makedepends=('git' 'yarn')
provides=('vim-coc')
conflicts=('vim-coc')
source=('git+https://github.com/neoclide/coc.nvim.git#branch=master')
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/coc.nvim"
    git describe release --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/coc.nvim"
    yarn install --frozen-lockfile --preferred-cache-folder "${srcdir}/.cache"
}

package() {
    cd "${srcdir}/coc.nvim"
    vim -es --cmd ":helptags doc" --cmd ":q"
    find autoload build data doc package.json plugin -type f -exec \
        install -Dm 644 '{}' "${pkgdir}/usr/share/vim/vimfiles/pack/coc/start/coc.nvim/{}" \;
    install -Dm 644 "${srcdir}/coc.nvim/LICENSE.md" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
