#  Maintainer: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=letsencrypt-git
_pkgname=letsencrypt
pkgver=6095.86e09d5
pkgrel=1
pkgdesc="A tool to automatically receive and install X.509 certificates to enable TLS on servers. The client will interoperate with the Let’s Encrypt CA which will be issuing browser-trusted certificates for free."
arch=('any')
license=('Apache')
url="https://letsencrypt.org/"
depends=('python2' 'augeas' 'ca-certificates' 'dialog' 'openssl' 'gcc' 'libffi' 'git' 'python-virtualenv' 'pkg-config')
provides=("${_pkgname}" "${_pkgname}-nginx" "${_pkgname}-apache" "letshelp-${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-nginx" "${_pkgname}-apache" "letshelp-${_pkgname}")
source=("${_pkgname}"::"git+https://github.com/letsencrypt/letsencrypt")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
	cd "${srcdir}/${_pkgname}"

	virtualenv -p python2 venv
	./venv/bin/pip install acme/ . certbot-apache/ certbot-nginx/ letshelp-certbot/
	virtualenv -p python2 --relocatable venv
}

package() {
	cd "${srcdir}/${_pkgname}"

	# Moving the complete virtual environment and source to /opt
	mkdir -p "${pkgdir}"/opt/letsencrypt
	cp -dpr --no-preserve=ownership ./* "${pkgdir}"/opt/letsencrypt

	# Link to the executables
	mkdir -p "${pkgdir}"/usr/bin
	ln -s /opt/letsencrypt/venv/bin/letsencrypt "${pkgdir}"/usr/bin/letsencrypt
	ln -s /opt/letsencrypt/venv/bin/letshelp-letsencrypt-apache "${pkgdir}"/usr/bin/letshelp-letsencrypt-apache

	# Create configuration directory, log and lib path
	install -d -m755 "${pkgdir}"/etc
	install -d -m700 "${pkgdir}"/var/log/letsencrypt
	install -d -m755 "${pkgdir}"/var/lib/letsencrypt
}
