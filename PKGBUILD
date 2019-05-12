## Contributor: jlhs
pkgname=python-greendns
pkgver=0.9.12
pkgrel=1
pkgdesc="A non-poisonous and CDN-friendly recursive DNS resolver written in Python"
arch=(any)
url="https://github.com/faicker/greendns"
license=(MIT)
## this program also support python2, but I'm too lazy (and busy actually) to package it with py2 ...
depends=('python-dnslib' 'python-six')
makedepends=('python-setuptools')
conflicts=("${pkgname}-git" "${pkgname#*-}")
install=greendns.install
source=("https://github.com/faicker/greendns/archive/${pkgver}.tar.gz" 'greendns.service' 'greendns.conf')
sha512sums=('3a5d527f46d1cdde3ad2e89f76f059cb7f7704f0088b87c80794170c4e7936b74a76bced8021c892f6e3011c5c2a444c008396447b2fadd3b0efe2b9cc296293' 'SKIP' 'SKIP')

_reponame=${pkgname#*-}

package() {
	cd "${srcdir}/${_reponame}-${pkgver}"
	python setup.py install --root="${pkgdir}/" --optimize=1

	## document
	install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"
	install -pm644 README.md "${pkgdir}/usr/share/doc/${pkgname}"
	install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
	install -pm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"

	## systemd
	install -Dm644 "${srcdir}/greendns.conf" "${pkgdir}/usr/lib/tmpfiles.d/greendns.conf"
	install -Dm644 "${srcdir}/greendns.service" "${pkgdir}/usr/lib/systemd/system/greendns.service"

	## tools
	cp --preserve=timestamps --parents -R tools/scripts -t "${pkgdir}/usr/share/doc/${pkgname}"
}
