#Maintainer: Zachary Jordan <zacjor1 at gmail dot com>
#PKGBUILD based off https-everywhere-chrome-git from Yardena Cohen <yardenack at gmail dot com>

pkgsubn=Reddit-Enhancement-Suite
pkgname=chromium-extension-reddit-enhancement-suite-git
pkgver=v5.22.6.r47.g6ec112ceb
pkgrel=1
pkgdesc="Chrome/Chromium extension for Reddit Enhancement Suite - git/dev"
arch=('any')
url='https://github.com/honestbleeps/Reddit-Enhancement-Suite'
license=('GPL3')
makedepends=(git nodejs yarn)
source=("git+https://github.com/honestbleeps/Reddit-Enhancement-Suite.git")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgsubn}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}
build() {
	cd "${srcdir}/${pkgsubn}"
  yarn --cache-folder "${srcdir}/npm-cache"
  yarn build --env browsers=chrome
}
package() {
  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  shopt -s dotglob
  cp -dr --no-preserve=ownership "${srcdir}/${pkgsubn}/dist/chrome"/* "${pkgdir}/usr/share/${pkgname}"
}
