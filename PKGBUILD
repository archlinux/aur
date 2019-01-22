#Maintainer: Zachary Jordan <zacjor1 at gmail dot com>
#PKGBUILD based off https-everywhere-chrome-git from Yardena Cohen <yardenack at gmail dot com>

pkgsubn=darkreader
pkgname=chromium-extension-dark-reader-git
pkgver=r1034.3e92871
pkgrel=1
pkgdesc="Chrome/Chromium extension for Dark Reader - git/dev"
arch=('any')
url='https://github.com/darkreader/darkreader'
license=('MIT')
makedepends=(git nodejs unzip)
source=("git+https://github.com/darkreader/darkreader.git")
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
	npm run release
	mkdir chrome
	unzip "*build*.zip" -d chrome
}
package() {
	 mkdir -p "${pkgdir}/usr/share/${pkgname}"
	 shopt -s dotglob
	 cp -dr --no-preserve=ownership "${srcdir}/${pkgsubn}/chrome"/* "${pkgdir}/usr/share/${pkgname}"
}
