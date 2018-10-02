# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>

pkgname=certbot-git
_reponame="certbot"
pkgver=0.27.0.r30.g06174bc11
pkgrel=1
pkgdesc="A tool to automatically receive and install X.509 certificates to enable TLS on servers. The client will interoperate with the Let’s Encrypt CA which will be issuing browser-trusted certificates for free."
arch=('any')
license=('Apache')
url="https://certbot.eff.org/"
# Most AUR helpers unfortunately do not support versioned deps in the AUR ("python-acme=${pkgver}")
depends=('ca-certificates' 'python-acme-git' 'python-configargparse' 'python-configobj'
	'python-cryptography' 'python-pyopenssl' 'python-mock' 'python-parsedatetime'
	'python-psutil' 'python-pyrfc3339' 'python-pythondialog' 'python-pytz'
	'python-requests' 'python-setuptools' 'python-six' 'python-zope-component'
	'python-zope-interface')
optdepends=("certbot-apache-git: Apache plugin for Let’s Encrypt client"
	"certbot-nginx-git: Nginx plugin for Let’s Encrypt client"
	"letshelp-certbot-git: Let's help Certbot client")
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
	cd "${srcdir}/${_reponame}"

	# Clean up build environment
	python setup.py clean
	rm -rf build dist

	# Build the package using python
	python setup.py build
}

package() {
	# Enter the directory with the build files
	cd "${srcdir}/${_reponame}"

	# Install files
	python setup.py install --root="${pkgdir}" --optimize=1

	# Create configuration, log and lib directories
	install -d "${pkgdir}"/etc/letsencrypt	# TODO: someday this will probably change
	install -d -m700 "${pkgdir}"/var/log/letsencrypt	# TODO: someday this will probably change
	install -d "${pkgdir}"/var/lib/letsencrypt	# TODO: someday this will probably change
}
