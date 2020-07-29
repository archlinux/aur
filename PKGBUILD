# Maintainer: Sainnhe Park <sainnhe@gmail.com>
_variant='vim'
_extname=coc-rust-analyzer
_packdir="usr/share/vim/vimfiles/pack/coc/start/${_extname}"
url='https://github.com/fannheyward/coc-rust-analyzer'
pkgdesc='rust-analyzer extension for coc.nvim'

pkgname="${_variant}-${_extname}-git"
provides=("${_variant}-${_extname}")
conflicts=("${_variant}-${_extname}")
arch=('any')
depends=("${_variant}-coc" 'rust-analyzer')
makedepends=('yarn' 'npm' 'git')
license=('')
source=("${_extname}::git+${url}.git"
        'serverPath.patch')
pkgver=r464.4b3847f
pkgrel=1
sha256sums=('SKIP'
            '88ba4cda5fb8729d653918a6d9d05161529ba21c7449e08a83507d47f8bcb64d')

pkgver() {
    cd "${srcdir}/${_extname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/${_extname}"
    patch --forward --strip=1 --input="${srcdir}/serverPath.patch"
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
    cd ../
    git checkout -- package.json
}
