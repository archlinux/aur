# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
_variant='vim'
_extname=coc-ltex
_packdir="usr/share/vim/vimfiles/pack/coc/start/${_extname}"
url='https://github.com/valentjn/vscode-ltex'
pkgdesc='LTEX language server extension for coc.nvim'

pkgname="${_variant}-${_extname}-git"
provides=("${_variant}-${_extname}")
conflicts=("${_variant}-${_extname}")
arch=('any')
depends=("${_variant}-coc" 'languagetool')
makedepends=('yarn' 'npm' 'git' 'python')
license=('MIT')
source=("${_extname}::git+${url}.git")
pkgver=nightly.r0.g74484ff
pkgrel=1
sha256sums=('SKIP')

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
    chown -R root:root "${pkgdir}"
}

