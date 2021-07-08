# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>

pkgname=certbot-git
_reponame="certbot"
pkgver=1.17.0.r3.g7ede5c348
pkgrel=1
pkgdesc="Tool to automatically receive and install X.509 certificates to enable TLS on servers"
arch=('any')
license=('Apache')
url="https://certbot.eff.org/"
# Most AUR helpers unfortunately do not support versioned deps in the AUR ("python-acme=${pkgver}")
depends=('ca-certificates' 'python-acme-git' 'python-configargparse' 'python-configobj'
	'python-cryptography' 'python-distro' 'python-josepy' 'python-parsedatetime'
	'python-pyrfc3339' 'python-pytz' 'python-setuptools' 'python-zope-component'
	'python-zope-interface')
optdepends=("certbot-apache-git: Apache plugin for Let’s Encrypt client"
	"certbot-nginx-git: Nginx plugin for Let’s Encrypt client")
makedepends=('git')
provides=("certbot=${pkgver}" "letsencrypt=${pkgver}")
conflicts=("certbot" "letsencrypt")
replaces=("letsencrypt-git")
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
	# Enter the directory with the build files
	cd "${srcdir}/${_reponame}/certbot"

	# Clean up build environment
	python setup.py clean
	rm -rf build dist

	# Build the package using python
	python setup.py build
}

package() {
	# Enter the directory with the build files
	cd "${srcdir}/${_reponame}/certbot"

	# Install files
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

	# Create configuration, log and lib directories
	install -d "${pkgdir}"/etc/letsencrypt
	install -d -m700 "${pkgdir}"/var/log/letsencrypt
	install -d "${pkgdir}"/var/lib/letsencrypt
}
