# Maintainer: Sainnhe Park <sainnhe@gmail.com>
pkgname=neovim-coc-highlight-git
_pkgname=neovim-coc-highlight
_extname=coc-highlight
pkgdesc='Document highlight and document colors LSP support for coc.nvim'
arch=('any')
url='https://github.com/neoclide/coc-highlight'
depends=('neovim-coc')
makedepends=('git' 'yarn' 'npm')
_packdir="usr/local/share/nvim/site/pack/coc/start/${_extname}"
license=('MIT')
groups=('neovim-coc-extras-git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_extname}::git+${url}.git")
pkgver=1.2.5.r2.gb4e82eb
pkgrel=1
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_extname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_extname}"
    yarn install --frozen-lockfile --preferred-cache-folder "${srcdir}/.cache/yarn"
    yarn pack
    tar xvf *.tgz
    rm *.tgz
    cd package
    npm install --only=production --no-lockfile --ignore-scripts --cache "${srcdir}/.cache/npm"
}

package() {
    cd "${srcdir}/${_extname}/package"
    find . -type f -exec \
        install -Dm 644 '{}' "${pkgdir}/${_packdir}/{}" \;
    rm -rf "${srcdir}/${_extname}/package"
    find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'
    chown -R root:root "${pkgdir}"
}
