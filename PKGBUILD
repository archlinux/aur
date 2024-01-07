# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>

pkgbase=certbot-plugins-git
pkgname=("certbot-nginx-git" "certbot-apache-git")
_reponame="certbot"
pkgver=2.8.0.r6.g926d0c7e0
pkgrel=1
pkgdesc="Plugins for Certbot"
arch=('any')
license=('Apache')
url="https://github.com/certbot/${_reponame}"
# Most AUR helpers unfortunately do not support versioned deps in the AUR ("certbot=$pkgver" "python-acme=$pkgver")
makedepends=('git' 'certbot-git' 'python-acme-git' 'python-pyopenssl' 'python-pyparsing' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'python-sphinx' 'python-sphinx_rtd_theme')
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
	git -C "${srcdir}/${_reponame}" clean -dfx
}

build() {
	cd "${srcdir}/${_reponame}/certbot-nginx"
	python -m build --wheel --no-isolation

	cd "${srcdir}/${_reponame}/certbot-apache"
	python -m build --wheel --no-isolation
}

package_certbot-nginx-git() {
	pkgdesc="Nginx plugin for Certbot"
	# Most AUR helpers unfortunately do not support versioned deps in the AUR ("certbot=$pkgver" "python-acme=$pkgver")
	depends=('certbot' 'python-acme' 'python-pyopenssl' 'python-pyparsing')
	provides=("certbot-nginx=${pkgver}" "letsencrypt-nginx=${pkgver}")
	conflicts=("certbot-nginx" "letsencrypt-nginx")

	cd "${srcdir}/${_reponame}/certbot-nginx"
	python -m installer --destdir="${pkgdir}" dist/*.whl
}

package_certbot-apache-git() {
	pkgdesc="Apache plugin for Certbot"
	# Most AUR helpers unfortunately do not support versioned deps in the AUR ("certbot=$pkgver" "python-acme=$pkgver")
	depends=('certbot' 'python-acme' 'python-augeas')
	provides=("certbot-apache=${pkgver}" "letsencrypt-apache=${pkgver}")
	conflicts=("certbot-apache" "letsencrypt-apache")

	cd "${srcdir}/${_reponame}/certbot-apache"
	python -m installer --destdir="${pkgdir}" dist/*.whl
}
