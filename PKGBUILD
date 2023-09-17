# Maintainer: Sainnhe Park <sainnhe@gmail.com>
pkgname=vim-coc-git-git
_pkgname=vim-coc-git
_extname=coc-git
pkgdesc='Git integration of coc.nvim'
arch=('any')
url='https://github.com/neoclide/coc-git'
depends=('vim-coc' 'git')
makedepends=('yarn' 'npm')
_packdir="usr/share/vim/vimfiles/pack/coc/start/${_extname}"
license=('MIT')
groups=('vim-coc-extras-git')
provides=("${_pkgname}-git")
conflicts=("${_pkgname}-git")
source=("${_extname}::git+${url}.git")
pkgver=1.8.1.r0.g691870e
pkgrel=1
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_extname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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
    chown -R root:root "${pkgdir}"
}
