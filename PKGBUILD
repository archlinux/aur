# Maintainer: Yardena Cohen <yardenack at gmail dot com>

# check for new commits:
#   https://gitweb.torproject.org/https-everywhere.git/shortlog
#   https://github.com/EFForg/https-everywhere/commits/master

pkgsubn=https-everywhere
pkgname=${pkgsubn}-chrome-git
pkgver=37236.498bbdb
pkgrel=1
pkgdesc="Chrome/Chromium extension to use HTTPS whenever possible - git/dev"
arch=('any')
url='https://www.eff.org/https-everywhere'
license=('GPL')
makedepends=(git perl python2-lxml libxml2 vim zip)
source=("git+https://github.com/EFForg/${pkgsubn}.git")
sha512sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgsubn}"
	local ver="$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
	printf "%s" "${ver//-/.}"
}
prepare() {
	 cd "${srcdir}/${pkgsubn}"
	 sed -i 's/python\([^2]\)/python2\1/' makecrx.sh utils/merge-rulesets.sh
	 sed -i 's_/usr/bin/\(\|env \)python\([^2]\|$\)_/usr/bin/\1python2\2_' utils/*.py
}
build() {
	cd "${srcdir}/${pkgsubn}"
	./makecrx.sh
}
package() {
	 mkdir -p "${pkgdir}/usr/share/${pkgname}"
	 shopt -s dotglob
	 cp -dr --no-preserve=ownership "${srcdir}/${pkgsubn}/pkg/crx"/* "${pkgdir}/usr/share/${pkgname}"
}
