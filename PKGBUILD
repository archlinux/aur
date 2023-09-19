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
makedepends=('yarn' 'npm' 'git' 'python')
license=('MIT')
source=("${_extname}::git+${url}.git"
        'patch.py')
pkgver=r1222.dc17ad2
pkgrel=1
sha256sums=('SKIP'
            '5b734b06d80a148fc3b0f5df841c669bc8d82b465e59b222dca9519b0bfc423c')

pkgver() {
    cd "${srcdir}/${_extname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_extname}"
    yarn install --frozen-lockfile --preferred-cache-folder "${srcdir}/.cache"
}

package() {
    cd "${srcdir}/${_extname}"
    yarn pack; tar xvf *.tgz; rm *.tgz
    cd package
    _dependencies=$(grep -Po '"dependencies":' package.json) || _dependencies=""
    if [ -n "${_dependencies}" ]; then
        yarn install --production --no-lockfile --ignore-scripts --prefer-offline --preferred-cache-folder "${srcdir}/.cache"
    fi
    find . -type f -exec \
        install -Dm 644 '{}' "${pkgdir}/${_packdir}/{}" \;
    rm -rf "${srcdir}/${_extname}/package"
    find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'
    "$srcdir/patch.py" "$pkgdir/$_packdir/package.json"
    chown -R root:root "${pkgdir}"
}
