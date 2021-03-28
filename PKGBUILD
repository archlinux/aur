# Maintainer: Sainnhe Park <sainnhe@gmail.com>
_variant='neovim'
_extname=coc-rust-analyzer
_packdir="usr/share/nvim/runtime/pack/coc/start/${_extname}"
url='https://github.com/fannheyward/coc-rust-analyzer'
pkgdesc='rust-analyzer extension for coc.nvim'

pkgname="${_variant}-${_extname}-git"
provides=("${_variant}-${_extname}")
conflicts=("${_variant}-${_extname}")
arch=('any')
depends=("${_variant}-coc" 'rust-analyzer')
makedepends=('yarn' 'git')
license=('MIT')
source=("${_extname}::git+${url}.git"
        'package.json.patch')
pkgver=r865.8eba9cf
pkgrel=1
sha256sums=('SKIP'
            '3f5fdb4c82e98bff76a2241ae21d9a9da4b146f5bcd6a5cf110a8953260dc098')

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
    patch "$pkgdir/$_packdir/package.json" <"$srcdir/package.json.patch"
    chown -R root:root "${pkgdir}"
}
