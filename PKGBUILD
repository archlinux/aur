# Maintainer: Adrian Perez <aperez@igalia.com>
pkgname=beancount-git
pkgdesc='Double-Entry Accounting from Text Input'
pkgver=2.3.0.r173.g13746c29
pkgrel=1
arch=(i686 x86_64)
url=http://furius.ca/beancount/
license=(GPL)
source=("${pkgname}::git+https://github.com/beancount/beancount/")
sha512sums=('SKIP')
depends=('python>=3.5' 'mpdecimal' 'python-ply' 'python-dateutil'
		 'python-magic-ahupp' 'python-beautifulsoup4' 'python-chardet'
		 'python-bottle' 'python-lxml' 'python-google-api-python-client')
makedepends=('mercurial' 'python-nose' 'make')
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
