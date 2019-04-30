#Maintainer: Zachary Jordan <zacjor1 at gmail dot com>
#PKGBUILD based off https-everywhere-chrome-git from Yardena Cohen <yardenack at gmail dot com>

pkgsubn=Tab-Session-Manager
pkgname=chromium-extension-tab-session-manager-git
pkgver=4.5.2.r1.g20557f7a
pkgrel=1
pkgdesc="Chrome/Chromium extension for Tab Session Manager - git/dev"
arch=('any')
url='https://github.com/sienori/Tab-Session-Manager'
license=('MPL2')
makedepends=(git nodejs npm unzip)
source=("git+https://github.com/sienori/Tab-Session-Manager.git")
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
	npm install --cache "${srcdir}/npm-cache" 
	npm run build
	cd dist/
	mkdir chrome
	unzip "*chrome*.zip" -d chrome
}
package() {
	 mkdir -p "${pkgdir}/usr/share/${pkgname}"
	 shopt -s dotglob
	 cp -dr --no-preserve=ownership "${srcdir}/${pkgsubn}/dist/chrome"/* "${pkgdir}/usr/share/${pkgname}"
}
