# Maintainer: surefire@cryptomile.net

pkgname=acme-client-git
pkgver=0.1.15.r2.g1613a32
pkgrel=1
arch=('x86_64' 'i686' 'armv7h')
license=('BSD')
pkgdesc="Yet another ACME client, specifically for Let's Encrypt, but one with a strong focus on security. Written in C."
url='https://kristaps.bsd.lv/acme-client/'

_sslver=2.5.0

source=(${pkgname}::'git+https://github.com/kristapsdz/acme-client-portable.git'
        "http://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-${_sslver}.tar.gz"
        'acme@.timer'
        'acme@.service'
        'example.conf')

sha256sums=('SKIP'
            '8652bf6b55ab51fb37b686a3f604a2643e0e8fde2c56e6a936027d12afda6eae'
            'c7d852229ae8a1b816ec476554c5d703a5513e6578a38672a52f7e7fca653b73'
            'd6e274929979a385308f29b4f15a923ce888b57faca9925b6f46a995b2bfd662'
            '7ba2721a5eba7eaa10b5fdc1dea213f6e08ab29f3b69c49a2310c7a9a349bc9d')

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

	# Disable libseccomp
	sed -i GNUmakefile -e '/pkg-config --exists libseccomp/ s/echo 1/echo 0/'
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
	install -Dm644 -t "${pkgdir}/usr/share/licenses/acme-client" LICENSE.md

	install -Dm644 -t "${pkgdir}/usr/lib/systemd/system" ../acme@.{timer,service}
	install -Dm644 -t "${pkgdir}/etc/acme" ../example.conf

	install -dm0755 "${pkgdir}/var/lib/acme"/{accounts,certs}
}
