# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>

pkgbase=python-acme-git
pkgname=("python-acme-git" "python2-acme-git")
_reponame="certbot"
pkgver=0.27.0.r30.g06174bc11
pkgrel=1
pkgdesc="ACME protocol implementation for Python"
arch=('any')
license=('Apache')
url="https://github.com/certbot/${_reponame}"
depends=('')
makedepends=('git' 'python-setuptools' 'python2-setuptools' 'python-pyasn1' 'python2-pyasn1'
	'python-cryptography' 'python2-cryptography' 'python-pyopenssl' 'python2-pyopenssl'
	'python-ndg-httpsclient' 'python2-ndg-httpsclient' 'python-pyrfc3339'
	'python2-pyrfc3339' 'python-pytz' 'python2-pytz' 'python-requests'
	'python2-requests' 'python-six' 'python2-six' 'python-werkzeug' 'python2-werkzeug'
	'python-mock' 'python2-mock')
provides=("")
conflicts=("")
source=("${_reponame}"::"git+https://github.com/certbot/${_reponame}")
sha512sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_reponame}"
	( set -o pipefail
	git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
	|| printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

prepare() {
	cp -a "${srcdir}/${_reponame}/acme"{,-py2}
}

build() {
	cd "${srcdir}/${_reponame}/acme"
	python setup.py clean
	rm -rf build dist
	python setup.py build

	cd "${srcdir}/${_reponame}/acme-py2"
	python2 setup.py clean
	rm -rf build dist
	python2 setup.py build
}

package_python-acme-git() {
	depends=('python-setuptools' 'python-pyasn1' 'python-cryptography' 'python-pyopenssl'
		'python-ndg-httpsclient' 'python-pyrfc3339' 'python-pytz' 'python-requests'
		'python-six' 'python-werkzeug' 'python-mock')
	optdepends=("python-dnspython: local validation of dns-01 challenges")
	provides=("python-acme=${pkgver}")
	conflicts=("python-acme")

	cd "${srcdir}/${_reponame}/acme"
	python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-acme-git() {
	depends=('python2-setuptools' 'python2-pyasn1' 'python2-cryptography' 'python2-pyopenssl'
		'python2-ndg-httpsclient' 'python2-pyrfc3339' 'python2-pytz' 'python2-requests'
		'python2-six' 'python2-werkzeug' 'python2-mock')
	optdepends=("python2-dnspython: local validation of dns-01 challenges")
	provides=("python2-acme=${pkgver}")
	conflicts=("python2-acme")

	cd "${srcdir}/${_reponame}/acme-py2"
	python2 setup.py install --root="${pkgdir}" --optimize=1
}
