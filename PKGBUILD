# Maintainer: Yardena Cohen <yardenack at gmail dot com>

# check for new commits:
#   https://github.com/gorhill/uBlock/commits/master

gitname=pdf.js
pkgname=chromium-pdfjs-git
pkgver=4.3.136.35.g341ff40e7
pkgrel=1
nodever=21.7.3
pkgdesc="PDF viewer in Javascript, packaged as a Chromium extension"
arch=('any')
url="https://github.com/mozilla/${gitname}"
license=('GPL3')
depends=(pixman cairo)
makedepends=(git nvm) # gulp
source=("git+${url}.git")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/${gitname}"
    local ver="$(git describe --tags | sed 's|-|\.|g')"
    ver=${ver//-/.}
    printf "%s" "${ver#v}"
}
build() {
    cd "${srcdir}/${gitname}"
    . /usr/share/nvm/init-nvm.sh
    nvm install $nodever
    nvm use $nodever
    npm install -g gulp
    npm install
    gulp chromium
}
package() {
   mkdir -p "${pkgdir}/usr/share/chromium/${gitname}"
   cp -dr --no-preserve=ownership "${srcdir}/${gitname}/build/chromium"/* "${pkgdir}/usr/share/chromium/${gitname}/"
}
