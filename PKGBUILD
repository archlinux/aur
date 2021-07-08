# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>

pkgname=python-acme-git
_reponame="certbot"
pkgver=1.17.0.r3.g7ede5c348
pkgrel=1
pkgdesc="ACME protocol implementation for Python"
arch=('any')
license=('Apache')
url="https://github.com/certbot/${_reponame}"
depends=('python-setuptools' 'python-cryptography' 'python-josepy' 'python-pyopenssl'
	'python-pyrfc3339' 'python-pytz' 'python-requests' 'python-requests-toolbelt')
makedepends=('git')
provides=("python-acme=${pkgver}")
conflicts=("python-acme")
source=("${_reponame}"::"git+https://github.com/certbot/${_reponame}")
sha512sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_reponame}"
	( set -o pipefail
	git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
	|| printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd "${srcdir}/${_reponame}/acme"
	python setup.py clean
	rm -rf build dist
	python setup.py build
}

package_python-acme-git() {
	cd "${srcdir}/${_reponame}/acme"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
