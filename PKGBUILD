# Maintainer: surefire@cryptomile.net

pkgname=acme-client-git
_pkgname=acme-client
pkgver=0.1.11.r4.ge15995f
pkgrel=1
arch=('x86_64' 'i686')
license=('custom')
pkgdesc="Yet another ACME client, specifically for Let's Encrypt, but one with a strong focus on security. Written in C."
url='https://kristaps.bsd.lv/acme-client/'

_sslver=2.4.2

source=(${pkgname}::'git+https://github.com/kristapsdz/acme-client-portable.git'
        "http://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-${_sslver}.tar.gz"
        'acme@.timer'
        'acme@.service'
        'example.conf')

sha256sums=('SKIP'
            '5f87d778e5d62822d60e38fa9621c1c5648fc559d198ba314bd9d89cbf67d9e3'
            'c7d852229ae8a1b816ec476554c5d703a5513e6578a38672a52f7e7fca653b73'
            '2fbe99262986b4e4d84e659bc868e1e616c3b150190d50994f4184b1d606dc60'
            'b441b83feda96286a932add31237abfccb9f7bed7d13a3c6d85886e6a62fcc8f')

depends=('libbsd')
makedepends=('git')

conflicts=('acme-client')
provides=('acme-client')

options=('emptydirs')

pkgver() {
	cd "${pkgname}"
	git describe --long --tags | sed 's/VERSION_//;s/\([^-]*-g\)/r\1/;s/[-_]/./g'
}

build() {
	pushd "libressl-${_sslver}"
	./configure --disable-shared --disable-static --enable-static=tls,ssl,crypto
	make

	popd

	pushd "${pkgname}"
	make \
		LIBBSD='-Wl,-dy -lbsd' \
		CFLAGS="-g -W -Wall -DHAVE_CONFIG_H -I../libressl-${_sslver}/include" \
		LDFLAGS="-L../libressl-${_sslver}/{tls,ssl,crypto}/.libs -Wl,-dn"
}

package() {
	cd "${pkgname}"

	install -Dm755 -t "${pkgdir}/usr/bin" acme-client
	install -Dm644 -t "${pkgdir}/usr/share/man/man1" acme-client.1
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgname}" LICENSE.md

	install -Dm644 -t "${pkgdir}/usr/lib/systemd/system" ../acme@.{timer,service}
	install -Dm644 -t "${pkgdir}/etc/acme" ../example.conf

	install -dm0755 "${pkgdir}/var/lib/acme/accounts" "${pkgdir}/var/lib/acme/certs"

}
