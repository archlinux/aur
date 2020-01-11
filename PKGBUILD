# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>

pkgbase=certbot-plugins-git
pkgname=("certbot-nginx-git" "certbot-apache-git")
_reponame="certbot"
pkgver=1.0.0.r23.gceea41c1e
pkgrel=1
pkgdesc="Plugins for Certbot"
arch=('any')
license=('Apache')
url="https://github.com/certbot/${_reponame}"
# Most AUR helpers unfortunately do not support versioned deps in the AUR ("certbot=$pkgver" "python-acme=$pkgver")
makedepends=('git' 'certbot-git' 'python-acme-git' 'python-pyopenssl'
	'python-pyparsing' 'python-setuptools' 'python-mock' 'python-zope-interface'
	'python-zope-component' 'python-augeas')
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
	cd "${srcdir}/${_reponame}/certbot-nginx"
	python setup.py clean
	rm -rf build dist
	python setup.py build

	cd "${srcdir}/${_reponame}/certbot-apache"
	python setup.py clean
	rm -rf build dist
	python setup.py build
}

package_certbot-nginx-git() {
	pkgdesc="Nginx plugin for Certbot"
	# Most AUR helpers unfortunately do not support versioned deps in the AUR ("certbot=$pkgver" "python-acme=$pkgver")
	depends=('certbot' 'python-acme' 'python-pyopenssl' 'python-pyparsing'
		'python-setuptools' 'python-mock' 'python-zope-interface')
	provides=("certbot-nginx=${pkgver}" "letsencrypt-nginx=${pkgver}")
	conflicts=("certbot-nginx" "letsencrypt-nginx")

	cd "${srcdir}/${_reponame}/certbot-nginx"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

package_certbot-apache-git() {
	pkgdesc="Apache plugin for Certbot"
	# Most AUR helpers unfortunately do not support versioned deps in the AUR ("certbot=$pkgver" "python-acme=$pkgver")
	depends=('certbot' 'python-acme' 'python-augeas' 'python-setuptools'
		'python-mock' 'python-zope-component' 'python-zope-interface')
	provides=("certbot-apache=${pkgver}" "letsencrypt-apache=${pkgver}")
	conflicts=("certbot-apache" "letsencrypt-apache")

	cd "${srcdir}/${_reponame}/certbot-apache"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
