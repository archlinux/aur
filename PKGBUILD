# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>

pkgname=certbot-git
_reponame="certbot"
pkgver=2.8.0.r6.g926d0c7e0
pkgrel=1
pkgdesc="Tool to automatically receive and install X.509 certificates to enable TLS on servers"
arch=('any')
license=('Apache')
url="https://certbot.eff.org/"
# Most AUR helpers unfortunately do not support versioned deps in the AUR ("python-acme=${pkgver}")
depends=('ca-certificates' 'python-acme-git' 'python-configargparse' 'python-configobj'
	'python-cryptography' 'python-distro' 'python-josepy' 'python-parsedatetime'
	'python-pyrfc3339' 'python-pytz')
optdepends=("certbot-apache-git: Apache plugin for Let’s Encrypt client"
	"certbot-nginx-git: Nginx plugin for Let’s Encrypt client")
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'python-sphinx' 'python-sphinx_rtd_theme')
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

prepare() {
	git -C "${srcdir}/${_reponame}" clean -dfx
}

build() {
	cd "${srcdir}/${_reponame}/certbot"
	python -m build --wheel --no-isolation
	make -C docs man  # man pages
}

package() {
	# Enter the directory with the build files
	cd "${srcdir}/${_reponame}/certbot"

	python -m installer --destdir="${pkgdir}" dist/*.whl

	chmod 755 "${pkgdir}"/usr/bin/*

	install -vDm644 -t "${pkgdir}/usr/share/man/man1" docs/_build/man/*.1
	install -vDm644 -t "${pkgdir}/usr/share/man/man7" docs/_build/man/*.7

	# Create configuration, log and lib directories
	install -d "${pkgdir}"/etc/letsencrypt
	install -d -m700 "${pkgdir}"/var/log/letsencrypt
	install -d "${pkgdir}"/var/lib/letsencrypt
}
