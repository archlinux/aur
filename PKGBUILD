# Maintainer: surefire@cryptomile.net
pkgname=acme-client-git
pkgver=0.1.16+2+g94f9e1e
pkgrel=1
arch=('x86_64' 'i686' 'armv7h')
license=('custom:ISC')
pkgdesc="Yet another ACME client, specifically for Let's Encrypt, but one with a strong focus on security. Written in C."
url='https://kristaps.bsd.lv/acme-client/'

_sslver=2.5.1

source=(${pkgname}::'git+https://github.com/kristapsdz/acme-client-portable.git'
        "http://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-${_sslver}.tar.gz"
        'acme@.timer'
        'acme@.service'
        'example.conf'
        'example.hook')

sha256sums=('SKIP'
            'f71ae0a824b78fb1a47ffa23c9c26e9d96c5c9b29234eacedce6b4c7740287cd'
            'c7d852229ae8a1b816ec476554c5d703a5513e6578a38672a52f7e7fca653b73'
            'ddaccc43724be3b89d154aced64c6b04089047345c71dcbd60dc41719faae1f6'
            'd9716504c4c8eb9f1e238ecca6e691cb645657ae0bc32621e9ff10c6791dc978'
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
		CPPFLAGS="-I../libressl-${_sslver}/include" \
		LDFLAGS="-L../libressl-${_sslver}/{tls,ssl,crypto}/.libs"
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
