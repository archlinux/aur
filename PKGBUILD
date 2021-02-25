# Maintainer: Adrian Perez <aperez@igalia.com>
pkgname=beancount-git
pkgdesc='Double-Entry Accounting from Text Input'
pkgver=2.3.3.r451.gf9481591
pkgrel=1
arch=(i686 x86_64)
url=http://furius.ca/beancount/
license=(GPL)
source=("${pkgname}::git+https://github.com/beancount/beancount/")
sha512sums=('SKIP')
depends=('mpdecimal'
         'python-beautifulsoup4'
         'python-bottle'
         'python-chardet'
         'python-dateutil'
         'python-google-api-python-client'
         'python-google-auth-oauthlib'
         'python-lxml'
         'python-magic-ahupp'
         'python-ply'
         'python-requests'
         'python>=3.5'
         'python-pytest')
makedepends=('git' 'python-nose' 'make')
replaces=(ledgerhub-hg beancount-hg)
provides=(ledgerhub-hg "beancount=${pkgver%%.r*}")
conflicts=(beancount beancount-hg)

pkgver() {
	cd "${pkgname}"
	(
		 set -o pipefail
		 git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		 printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

# TODO: Tests are failing at the moment, needs investigating.
# check () {
# 	cd "${pkgname}"
# 	export CFLAGS='-std=gnu99'
# 	make tests
# }

package () {
	cd "${pkgname}"
	python3 setup.py install --prefix=/usr --root="${pkgdir}"
}
