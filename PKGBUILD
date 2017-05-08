# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>

pkgbase=certbot-plugins-git
pkgname=("certbot-nginx-git" "certbot-apache-git")
_reponame="certbot"
pkgver=0.14.0.r6.gc6fcb017
pkgrel=1
pkgdesc="Plugins for Certbot"
arch=('any')
license=('Apache')
url="https://github.com/certbot/${_reponame}"
depends=('')
# Most AUR helpers unfortunately do not support versioned deps in the AUR ("certbot=$pkgver" "python2-acme=$pkgver")
makedepends=('git' 'certbot-git' 'python2-acme-git' 'python2-pyopenssl'
	'python2-pyparsing' 'python2-setuptools' 'python2-mock' 'python2-zope-interface'
	'python2-zope-component' 'python2-augeas')
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
	# Most AUR helpers unfortunately do not support versioned deps in the AUR ("certbot=$pkgver" "python2-acme=$pkgver")
	depends=('certbot' 'python2-acme' 'python2-pyopenssl' 'python2-pyparsing'
		'python2-setuptools' 'python2-mock' 'python2-zope-interface')
	provides=("certbot-nginx=${pkgver}" "letsencrypt-nginx=${pkgver}")
	conflicts=("certbot-nginx" "letsencrypt-nginx")

	cd "${srcdir}/${_reponame}/certbot-nginx"
	python2 setup.py install --root="${pkgdir}" --optimize=1
}

package_certbot-apache-git() {
	pkgdesc="Apache plugin for Certbot"
	# Most AUR helpers unfortunately do not support versioned deps in the AUR ("certbot=$pkgver" "python2-acme=$pkgver")
	depends=('certbot' 'python2-acme' 'python2-augeas' 'python2-setuptools'
		'python2-mock' 'python2-zope-component' 'python2-zope-interface')
	provides=("certbot-apache=${pkgver}" "letsencrypt-apache=${pkgver}")
	conflicts=("certbot-apache" "letsencrypt-apache")

	cd "${srcdir}/${_reponame}/certbot-apache"
	python2 setup.py install --root="${pkgdir}" --optimize=1
}
