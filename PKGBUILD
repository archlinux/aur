# Maintainer: Yardena Cohen <yardenack at gmail dot com>

# check for new commits:
#   https://gitweb.torproject.org/https-everywhere.git/shortlog
#   https://github.com/EFForg/https-everywhere/commits/master

pkgsubn=https-everywhere
pkgname=${pkgsubn}-chrome-git
pkgver=67794.c4d4be720e
pkgrel=1
pkgdesc="Chrome/Chromium extension to use HTTPS whenever possible - git/dev"
arch=('any')
url='https://www.eff.org/https-everywhere'
license=('GPL')
makedepends=(git perl python python-lxml libxml2 vim zip rsync)
depends=(chromium)
source=(
    "git+https://github.com/EFForg/${pkgsubn}.git"
    "git+https://github.com/EFForg/${pkgsubn}-lib-wasm.git"
    "git+https://git.torproject.org/translation.git"
)
sha512sums=(SKIP SKIP SKIP)

pkgver() {
    cd "${srcdir}/${pkgsubn}"
    local ver="$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
    printf "%s" "${ver//-/.}"
}
prepare() {
    cd "${srcdir}/${pkgsubn}"
    git submodule init
    git config submodule.lib-wasm.url  "${srcdir}/${pkgsubn}-lib-wasm"
    git config submodule.translate.url "${srcdir}/translation"
    git -c protocol.file.allow=always submodule update
}
build() {
    cd "${srcdir}/${pkgsubn}"
    ./make.sh
}
package() {
    mkdir -p "${pkgdir}/usr/share/chromium/${pkgsubn}"
    shopt -s dotglob
    cp -dr --no-preserve=ownership "${srcdir}/${pkgsubn}/pkg/crx-cws"/* "${pkgdir}/usr/share/chromium/${pkgsubn}"
}
