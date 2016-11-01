# Maintainer: surefire@cryptomile.net

pkgname=acme-client-git
_pkgname=acme-client
pkgver=0.1.12.r0.g2d209d4
pkgrel=1
arch=('x86_64' 'i686')
license=('BSD')
pkgdesc="Yet another ACME client, specifically for Let's Encrypt, but one with a strong focus on security. Written in C."
url='https://kristaps.bsd.lv/acme-client/'

_sslver=2.4.3

source=(${pkgname}::'git+https://github.com/kristapsdz/acme-client-portable.git'
        "http://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-${_sslver}.tar.gz"
        'acme@.timer'
        'acme@.service'
        'example.conf'
        'bsd-cdefs.patch')

sha256sums=('SKIP'
            'bd5726f3e247e7a7d30ce69946d174b8fb92d999d22710c65f176c969812960e'
            'c7d852229ae8a1b816ec476554c5d703a5513e6578a38672a52f7e7fca653b73'
            'd6e274929979a385308f29b4f15a923ce888b57faca9925b6f46a995b2bfd662'
            '297cf2592b1baed8da591136334ab7fc1f4f64a6a093a1ac657ceaae45aa8583'
            '0336ab833dc0332bbeaacf952d2dba41614de2cbc9f129b85334206ddb5082cd')

depends=('libbsd')
makedepends=('git')

conflicts=('acme-client' 'letskencrypt')
provides=('acme-client' 'letskencrypt')

options=('emptydirs')

pkgver() {
	cd "${pkgname}"
	git describe --long --tags | sed 's/VERSION_//;s/\([^-]*-g\)/r\1/;s/[-_]/./g'
}

prepare() {
	cd "${pkgname}"
	patch -Np1 <../bsd-cdefs.patch
}

build() {
	cd "libressl-${_sslver}"
	./configure --disable-shared --enable-static
	make

	cd "../${pkgname}"
	make \
		CPPFLAGS="-I../libressl-${_sslver}/include" \
		LDFLAGS="-L../libressl-${_sslver}/{tls,ssl,crypto}/.libs"
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
