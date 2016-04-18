#  Maintainer: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgbase=certbot-plugins-git
pkgname=("certbot-nginx-git" "certbot-apache-git")
_reponame="letsencrypt"
pkgver=0.5.0.r57.g86e09d5
pkgrel=1
pkgdesc="Plugins for Certbot"
arch=('any')
license=('Apache')
url="https://github.com/letsencrypt/${_reponame}"
depends=('')
makedepends=('git' "certbot=$pkgver" "python2-acme=$pkgver" 'python2-pyopenssl'
	'python2-pyparsing' 'python2-setuptools' 'python2-mock' 'python2-zope-interface'
	'python2-zope-component' 'python2-augeas')
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

build_certbot-nginx-git() {
	cd "${srcdir}/${_reponame}/certbot-nginx"
	python2 setup.py clean
	rm -rf build dist
	python2 setup.py build
}

build_certbot-apache-git() {
	cd "${srcdir}/${_reponame}/certbot-apache"
	python2 setup.py clean
	rm -rf build dist
	python2 setup.py build
}

package_certbot-nginx-git() {
	pkgdesc="Nginx plugin for Certbot"
	depends=("certbot=$pkgver" "python2-acme=$pkgver" 'python2-pyopenssl' 'python2-pyparsing'
		'python2-setuptools' 'python2-mock' 'python2-zope-interface')
	provides=("certbot-nginx=${pkgver}" "letsencrypt-nginx=${pkgver}")
	conflicts=("certbot-nginx" "letsencrypt-nginx")

	cd "${srcdir}/${_reponame}/certbot-nginx"
	python2 setup.py install --root="${pkgdir}" --optimize=1
}

package_certbot-apache-git() {
	pkgdesc="Apache plugin for Certbot"
	depends=("certbot=$pkgver" "python2-acme=$pkgver" 'python2-augeas' 'python2-setuptools'
		'python2-mock' 'python2-zope-component' 'python2-zope-interface')
	provides=("certbot-apache=${pkgver}" "letsencrypt-apache=${pkgver}")
	conflicts=("certbot-apache" "letsencrypt-apache")

	cd "${srcdir}/${_reponame}/certbot-apache"
	python2 setup.py install --root="${pkgdir}" --optimize=1
}
