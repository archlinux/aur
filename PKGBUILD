#Maintainer: Zachary Jordan <zacjor1 at gmail dot com>

pkgsubn=AugmentedSteam
pkgname=chromium-extension-augmented-steam-git
pkgver=v1.4.5.r854.gb5999e21
pkgrel=1
pkgdesc="Chrome/Chromium extension for Augmented Steam - git/dev"
arch=('any')
url='https://github.com/tfedor/AugmentedSteam'
license=('GPL3')
makedepends=(git npm)
source=("git+https://github.com/tfedor/AugmentedSteam.git"
         config.js)
sha256sums=('SKIP'
            '7b7e2ad8c1fd886dcf6b83d75bb973f18ee8c973ad43bb70de7dadf7619e655d')
            
pkgver() {
    cd "${srcdir}/${pkgsubn}"
    ( set -o pipefail
      git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
    #cp "config.js" "${srcdir}/${pkgsubn}/src/js/config.js"
    cd "${srcdir}/${pkgsubn}"
    npm install --cache "${srcdir}/npm-cache" 
    npm run build chrome -- --production
}

package() {
    mkdir -p "${pkgdir}/usr/share/${pkgname}"
    shopt -s dotglob
    cp -dr --no-preserve=ownership "${srcdir}/${pkgsubn}/dist/prod.chrome"/* "${pkgdir}/usr/share/${pkgname}"
}