# Maintainer: surefire@cryptomile.net
pkgname=acme-client-portable
pkgver=1.1.0
pkgrel=1
arch=('x86_64' 'i686' 'armv7h')
license=('BSD')
pkgdesc="Yet another ACME client, specifically for Let's Encrypt, but one with a strong focus on security. Written in C."
url='https://github.com/graywolf/acme-client-portable'

source=(
	"${pkgname}"::"git+https://github.com/graywolf/acme-client-portable.git#tag=v$pkgver"
	'acme-client.conf'
	'acme-client@.timer'
	'acme-client@.service'
	'example.org.hook'
)

validpgpkeys=('A1EB079B8D3EB92B4EBD3139663AF51BD5E4D8D5')

sha256sums=('SKIP'
            'c526ff508fdd1fce6c42bd9755f2935c6654874557a9e8b93bef4bf6c1fbbbce'
            '4a03a92515cd6e43701d011771be7ce26155c44799f05dcbf715b7e4716ac5de'
            '1ab1b79d27f13ac25b680209de200702245957b56d875b7ff5ce3660cd2081a2'
            '40d7cf2596fdc6f2c94998dd93aba76107828e7cf4dbd77b99fd1b4c36712dc4')

depends=(
	'curl'
	'libbsd'
	'openssl'
)
makedepends=('git')

conflicts=('acme-client')
provides=('acme-client')

backup=('etc/acme-client.conf')

build() {
	cd "${pkgname}"
	autoreconf -i
	./configure --prefix=/usr
	make
}

package() {
	cd "${pkgname}"

	install -Dm755 -t "${pkgdir}/usr/bin" acme-client
	install -Dm644 -t "${pkgdir}/usr/share/man/man1" acme-client.1
	install -Dm644 -t "${pkgdir}/usr/share/man/man5" acme-client.conf.5

	install -Dm644 -t "${pkgdir}/etc"               ../acme-client.conf
	install -Dm755 -t "${pkgdir}/etc/acme-client.d" ../example.org.hook
	install -Dm644 -t "${pkgdir}/usr/lib/systemd/system" ../acme-client@.{timer,service}
}
