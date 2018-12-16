# Maintainer: surefire@cryptomile.net
pkgname=acme-client-git
pkgver=0.1.16+14+gba153da
pkgrel=1
arch=('x86_64' 'i686' 'armv7h')
license=('custom:ISC')
pkgdesc="Yet another ACME client, specifically for Let's Encrypt, but one with a strong focus on security. Written in C."
url='https://kristaps.bsd.lv/acme-client/'

_sslver=2.8.3

source=(${pkgname}::'git+https://github.com/kristapsdz/acme-client-portable.git'
        "https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-${_sslver}.tar.gz"{,.asc}
        'acme@.timer'
        'acme@.service'
        'example.conf'
        'example.hook')

validpgpkeys=('A1EB079B8D3EB92B4EBD3139663AF51BD5E4D8D5')

sha256sums=('SKIP'
            '9b640b13047182761a99ce3e4f000be9687566e0828b4a72709e9e6a3ef98477'
            'SKIP'
            'c7d852229ae8a1b816ec476554c5d703a5513e6578a38672a52f7e7fca653b73'
            'a5bed5c3ef2e0be2faf160132972d7d948810a3c3aae262ab65fe251a0a24746'
            '8a14e7904ba3dfa65f30890c8c563b15597d4e60c39f42c9c79f52db80b8ee90'
            '40d7cf2596fdc6f2c94998dd93aba76107828e7cf4dbd77b99fd1b4c36712dc4')

depends=('libbsd')
makedepends=('git')

conflicts=('acme-client' 'letskencrypt')
provides=('acme-client' 'letskencrypt')

options=('emptydirs')

pkgver() {
	cd "${pkgname}"
	git describe --long --tags | sed 's/^VERSION_//; s/_/./g; s/-/+/g'
}

build() {
	cd "$srcdir/libressl-${_sslver}"
	./configure --disable-shared --enable-static
	make

	cd "$srcdir/$pkgname"
	make \
		CPPFLAGS="-I../libressl-${_sslver}/include -pthread" \
		LDFLAGS="-L../libressl-${_sslver}/{tls,ssl,crypto}/.libs -pthread"
}

package() {
	cd "${pkgname}"

	install -Dm755 -t "${pkgdir}/usr/bin" acme-client
	install -Dm644 -t "${pkgdir}/usr/share/man/man1" acme-client.1
	install -Dm644 -t "${pkgdir}/usr/share/licenses/acme-client" LICENSE.md

	install -Dm644 -t "${pkgdir}/usr/lib/systemd/system" ../acme@.{timer,service}
	install -Dm644 -t "${pkgdir}/etc/acme" ../example.conf
	install -Dm755 -t "${pkgdir}/etc/acme" ../example.hook

	install -dm755 "${pkgdir}/var/lib/acme"/{accounts,certs}
}
