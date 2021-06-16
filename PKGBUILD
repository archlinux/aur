# Maintainer: Sainnhe Park <sainnhe@gmail.com>
pkgname='vim-doge-git'
pkgver=3.10.0.r3.g584c2e1
pkgrel=1
pkgdesc='(Do)cumentation (Ge)nerator 10+ languages. Generate proper code documentation skeletons with a single keypress.'
arch=('any')
url='https://github.com/kkoomen/vim-doge'
license=('GPL3')
groups=('vim-plugins')
provides=('vim-doge')
conflicts=('vim-doge')
depends=('vim' 'nodejs')
makedepends=('git' 'npm')
source=("git+${url}.git")
sha256sums=('SKIP')
_packdir='usr/share/vim/vimfiles/pack/vim-doge/start/vim-doge'

pkgver() {
    cd "${srcdir}/vim-doge"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/vim-doge"
    npm ci --cache "${srcdir}/.cache"
    npm run build:binary:unix -- vim-doge
}

package() {
    cd "${srcdir}/vim-doge"
    npm pack; tar xvf *.tgz; rm *.tgz
    cd package
    npm install --production --ignore-scripts --prefer-offline --cache "${srcdir}/.cache"
    find autoload build/index.js build/build doc/doge.txt doc/tags ftplugin node_modules package.json plugin -type f -exec \
        install -Dm 644 '{}' "${pkgdir}/${_packdir}/{}" \;
    install -Dm 644 "${srcdir}/vim-doge/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    mkdir "${pkgdir}/${_packdir}/bin"
    sed -i '1i#!/usr/bin/node' "${pkgdir}/${_packdir}/build/index.js"
    chmod +x "${pkgdir}/${_packdir}/build/index.js"
    ln -s "/${_packdir}/build/index.js" "${pkgdir}/${_packdir}/bin/vim-doge"
    find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'
    chown -R root:root "${pkgdir}"
    rm -rf "${srcdir}/vim-doge/package"
}

