# Maintainer: Sainnhe Park <sainnhe@gmail.com>
_variant='vim'
_extname=coc-java
_packdir="usr/share/vim/vimfiles/pack/coc/start/${_extname}"
url='https://github.com/neoclide/coc-java'
pkgdesc='Java extension for coc.nvim'

pkgname="${_variant}-${_extname}-git"
provides=("${_variant}-${_extname}")
conflicts=("${_variant}-${_extname}")
arch=('any')
depends=("${_variant}-coc" 'java-runtime-headless')
makedepends=('yarn' 'npm' 'git')
license=('EPL')
source=("${_extname}::git+${url}.git"
        'package.json.patch')
pkgver=1.5.3.r2.g64ab35d
pkgrel=1
sha256sums=('SKIP'
            '013e5a469c6cada8baca2bf7feca967faeb7aac043c919332959e816e16634a5')

pkgver() {
    cd "${srcdir}/${_extname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_extname}"
    yarn install --ignore-scripts --frozen-lockfile --preferred-cache-folder "${srcdir}/.cache"
    yarn run build
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
