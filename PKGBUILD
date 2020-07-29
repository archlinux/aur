# Maintainer: Sainnhe Park <sainnhe@gmail.com>
_variant='neovim'
_extname=coc-sh
_packdir="usr/local/share/nvim/site/pack/coc/start/${_extname}"
url='https://github.com/josa42/coc-sh'
pkgdesc='SH language server extension using bash-language-server for coc.nvim.'

pkgname="${_variant}-${_extname}-git"
provides=("${_variant}-${_extname}")
conflicts=("${_variant}-${_extname}")
arch=('any')
depends=("${_variant}-coc")
makedepends=('yarn' 'npm' 'git')
license=('')
source=("${_extname}::git+${url}.git")
pkgver=v0.5.1.r0.g179138e
pkgrel=1
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_extname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_extname}"
    yarn install --frozen-lockfile
    yarn pack
    tar xvf *.tgz
    rm *.tgz
    cd package
    npm install --only=production --no-lockfile --ignore-scripts
}

package() {
    cd "${srcdir}/${_extname}/package"
    find . -type f -exec \
        install -Dm 644 '{}' "${pkgdir}/${_packdir}/{}" \;
    chmod +x "${pkgdir}/${_packdir}/node_modules/bash-language-server/bin/main.js"
    rm -rf "${srcdir}/${_extname}/package"
}
