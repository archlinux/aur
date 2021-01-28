#Maintainer: Zachary Jordan <zacjor at protronmail dot com>
#PKGBUILD based off https-everywhere-chrome-git from Yardena Cohen <yardenack at gmail dot com>

pkgsubn=Tab-Session-Manager
pkgname=chromium-extension-tab-session-manager-git
pkgver=6.4.0.r13.g36f06d1d
pkgrel=2
pkgdesc="Chrome/Chromium extension for Tab Session Manager - git/dev"
arch=('any')
url='https://github.com/sienori/Tab-Session-Manager'
license=('MPL2')
makedepends=(git nodejs npm unzip)
source=("git+https://github.com/sienori/Tab-Session-Manager.git"
		credentials.js)
sha256sums=('SKIP'
			'e6dfe1439052821b474c45e0fe473029c84b57f95ef9fca6db7f552e967350ee')

pkgver() {
  cd "${srcdir}/${pkgsubn}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}
build() {
	cp "credentials.js" "${srcdir}/${pkgsubn}/src/credentials.js"
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
