# Maintainer: Sainnhe Park <sainnhe@gmail.com>
_variant='vim'
_extname=coc-go
_packdir="usr/share/vim/vimfiles/pack/coc/start/${_extname}"
url='https://github.com/josa42/coc-go'
pkgdesc='Go language server extension using gopls for coc.nvim'

pkgname="${_variant}-${_extname}-git"
provides=("${_variant}-${_extname}")
conflicts=("${_variant}-${_extname}")
arch=('any')
depends=("${_variant}-coc" 'gopls')
makedepends=('yarn' 'npm' 'git' 'python')
license=('MIT')
source=("${_extname}::git+${url}.git"
        'patch.py')
pkgver=0.13.3.r6.ga0e68ff
pkgrel=1
sha256sums=('SKIP'
            '64ec60c5df767e4fc0a005c72077a2954183837381efcec2a223abfc3790b0a2')

pkgver() {
    cd "${srcdir}/${_extname}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
