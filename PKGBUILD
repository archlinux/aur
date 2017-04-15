# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>

pkgbase=python-certbot-plugins-git
pkgname=("python-certbot-nginx-git" "python-certbot-apache-git")
_reponame="certbot"
pkgver=0.11.0.r166.gba0ac032
pkgrel=1
pkgdesc="Plugins for Certbot"
arch=('any')
license=('Apache')
url="https://github.com/certbot/${_reponame}"
depends=('')
# Most AUR helpers unfortunately do not support versioned deps in the AUR ("certbot=$pkgver" "python-acme=$pkgver")
makedepends=('git' 'python-certbot-git' 'python-acme-git' 'python-pyopenssl'
	'python-pyparsing' 'python-setuptools' 'python-mock' 'python-zope-interface'
	'python-zope-component' 'python-augeas')
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
	cd "${srcdir}/${_reponame}"
	# "Pin python-augeas version to avoid error with 1.0.0"
	# augeas 1.x works fine on Arch
	git revert --no-commit 1c51ae25887f2dc3168a38d1f0042363cd7ac1e3
}

build_python-certbot-nginx-git() {
	cd "${srcdir}/${_reponame}/certbot-nginx"
	python setup.py clean
	rm -rf build dist
	python setup.py build
}

build_python-certbot-apache-git() {
	cd "${srcdir}/${_reponame}/certbot-apache"
	python setup.py clean
	rm -rf build dist
	python setup.py build
}

package_python-certbot-nginx-git() {
	pkgdesc="Nginx plugin for Certbot (experimental Python3 variant)"
	# Most AUR helpers unfortunately do not support versioned deps in the AUR ("python-certbot=$pkgver" "python-acme=$pkgver")
	depends=('python-certbot' 'python-acme' 'python-pyopenssl' 'python-pyparsing'
		'python-setuptools' 'python-mock' 'python-zope-interface')
	provides=("certbot-nginx=${pkgver}" "letsencrypt-nginx=${pkgver}")
	conflicts=("certbot-nginx" "letsencrypt-nginx")

	cd "${srcdir}/${_reponame}/certbot-nginx"
	python setup.py install --root="${pkgdir}" --optimize=1
}

package_python-certbot-apache-git() {
	pkgdesc="Apache plugin for Certbot (experimental Python3 variant)"
	# Most AUR helpers unfortunately do not support versioned deps in the AUR ("python-certbot=$pkgver" "python-acme=$pkgver")
	depends=('python-certbot' 'python-acme' 'python-augeas' 'python-setuptools'
		'python-mock' 'python-zope-component' 'python-zope-interface')
	provides=("certbot-apache=${pkgver}" "letsencrypt-apache=${pkgver}")
	conflicts=("certbot-apache" "letsencrypt-apache")

	cd "${srcdir}/${_reponame}/certbot-apache"
	python setup.py install --root="${pkgdir}" --optimize=1
}
