#  Maintainer: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgbase=python-acme-git
pkgname=("python-acme-git" "python2-acme-git")
_reponame="letsencrypt"
pkgver=0.5.0.r57.g86e09d5
pkgrel=1
pkgdesc="ACME protocol implementation for Python"
arch=('any')
license=('Apache')
url="https://github.com/letsencrypt/${_reponame}"
depends=('')
makedepends=('git' 'python-setuptools' 'python2-setuptools' 'python-pyasn1' 'python2-pyasn1'
	'python-cryptography' 'python2-cryptography' 'python-pyopenssl' 'python2-pyopenssl'
	'python-ndg-httpsclient' 'python2-ndg-httpsclient' 'python-pyrfc3339'
	'python2-pyrfc3339' 'python-pytz' 'python2-pytz' 'python-requests'
	'python2-requests' 'python-six' 'python2-six' 'python-werkzeug' 'python2-werkzeug'
	'python-mock' 'python2-mock')
provides=("")
conflicts=("")
source=("${_reponame}"::"git+https://github.com/letsencrypt/letsencrypt")
md5sums=('SKIP')

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

build_python-acme-git() {
	cd "${srcdir}/${_reponame}/acme"
	python setup.py clean
	rm -rf build dist
	python setup.py build
}

build_python2-acme-git() {
	cd "${srcdir}/${_reponame}/acme-py2"
	python2 setup.py clean
	rm -rf build dist
	python2 setup.py build
}

package_python-acme-git() {
	depends=('python-setuptools' 'python-pyasn1' 'python-cryptography' 'python-pyopenssl'
		'python-ndg-httpsclient' 'python-pyrfc3339' 'python-pytz' 'python-requests'
		'python-six' 'python-werkzeug' 'python-mock')
	provides=("python-acme")
	conflicts=("python-acme")

	cd "${srcdir}/${_reponame}/acme"
	python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-acme-git() {
	depends=('python2-setuptools' 'python2-pyasn1' 'python2-cryptography' 'python2-pyopenssl'
		'python2-ndg-httpsclient' 'python2-pyrfc3339' 'python2-pytz' 'python2-requests'
		'python2-six' 'python2-werkzeug' 'python2-mock')
	provides=("python2-acme")
	conflicts=("python2-acme")

	cd "${srcdir}/${_reponame}/acme-py2"
	python2 setup.py install --root="${pkgdir}" --optimize=1
	mv "${pkgdir}"/usr/bin/jws{,2}
}
