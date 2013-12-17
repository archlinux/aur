# check for new commits:
# https://gitweb.torproject.org/https-everywhere.git/shortlog
# https://github.com/EFForg/https-everywhere/commits/master

pkgbase=https-everywhere
pkgname=${pkgbase}-chrome-git
pkgver=21701.c8d9b3a
pkgrel=1
pkgdesc="Chrome/Chromium extension to use HTTPS whenever possible - git/dev"
arch=('any')
url='https://www.eff.org/https-everywhere'
license=('GPL')
makedepends=(git perl python2-lxml libxml2 vim zip)
source=("git+https://github.com/EFForg/${pkgbase}.git")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgbase}"
	local ver="$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
	printf "%s" "${ver//-/.}"
}

prepare() {
	cd "${srcdir}/${pkgbase}"
	sed -i 's/python\([^2]\)/python2\1/' makecrx.sh
	sed -i 's_/usr/bin/\(\|env \)python\([^2]\|$\)_/usr/bin/\1python2\2_' utils/*.py
}

build() {
	cd "${srcdir}/${pkgbase}"
	./makecrx.sh
}

package() {
	 mkdir -p "${pkgdir}/usr/share/${pkgname}"
	 shopt -s dotglob
	 cp -dr --no-preserve=ownership "${srcdir}/${pkgbase}/pkg/crx"/* "${pkgdir}/usr/share/${pkgname}"
}
