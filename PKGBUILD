#  Maintainer: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=certbot-git
_reponame="letsencrypt"
pkgver=0.5.0.r57.g86e09d5
pkgrel=1
pkgdesc="A tool to automatically receive and install X.509 certificates to enable TLS on servers. The client will interoperate with the Let’s Encrypt CA which will be issuing browser-trusted certificates for free."
arch=('any')
license=('Apache')
url="https://letsencrypt.org/"
depends=('ca-certificates' "python2-acme=$pkgver" 'python2-configargparse' 'python2-configobj'
	'python2-cryptography' 'python2-pyopenssl' 'python2-mock' 'python2-parsedatetime'
	'python2-psutil' 'python2-pyrfc3339' 'python2-pythondialog' 'python2-pytz'
	'python2-requests' 'python2-setuptools' 'python2-six' 'python2-zope-component'
	'python2-zope-interface')
optdepends=("certbot-apache: Apache plugin for Let’s Encrypt client"
	"certbot-nginx: Nginx plugin for Let’s Encrypt client")
makedepends=('git')
provides=("certbot=${pkgver}" "letsencrypt=${pkgver}")
conflicts=("certbot" "letsencrypt")
source=("${_reponame}"::"git+https://github.com/letsencrypt/letsencrypt")
md5sums=('SKIP')

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
	python2 setup.py clean
	rm -rf build dist

	# Build the package using python2
	python2 setup.py build
}

package() {
	# Enter the directory with the build files
	cd "${srcdir}/${_reponame}"

	# Install files
	python2 setup.py install --root="${pkgdir}" --optimize=1

	# Create configuration, log and lib directories
	install -d "${pkgdir}"/etc/letsencrypt	# TODO: someday this will probably change
	install -d -m700 "${pkgdir}"/var/log/letsencrypt	# TODO: someday this will probably change
	install -d "${pkgdir}"/var/lib/letsencrypt	# TODO: someday this will probably change
}
