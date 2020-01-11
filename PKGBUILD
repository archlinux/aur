# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>

pkgname=python-acme-git
_reponame="certbot"
pkgver=1.0.0.r23.gceea41c1e
pkgrel=1
pkgdesc="ACME protocol implementation for Python"
arch=('any')
license=('Apache')
url="https://github.com/certbot/${_reponame}"
depends=('python-setuptools' 'python-pyasn1' 'python-cryptography' 'python-pyopenssl'
	'python-ndg-httpsclient' 'python-pyrfc3339' 'python-pytz' 'python-requests'
	'python-six' 'python-werkzeug' 'python-mock')
optdepends=("python-dnspython: local validation of dns-01 challenges")
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
