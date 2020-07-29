# Maintainer: Sainnhe Park <sainnhe@gmail.com>
_variant='neovim'
_extname=coc-vimlsp
_packdir="usr/local/share/nvim/site/pack/coc/start/${_extname}"
url='https://github.com/iamcco/coc-vimlsp'
pkgdesc='VimL support for coc.nvim'

pkgname="${_variant}-${_extname}-git"
provides=("${_variant}-${_extname}")
conflicts=("${_variant}-${_extname}")
arch=('any')
depends=("${_variant}-coc" 'git')
makedepends=('yarn' 'npm')
license=('')
source=("${_extname}::git+${url}.git")
pkgver=v0.8.0.r6.g0b7001d
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
    rm -rf "${srcdir}/${_extname}/package"
}
