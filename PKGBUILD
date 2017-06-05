# Author: Adrian Perez de Castro <aperez@igalia.com>
pkgname='signify'
pkgver='21'
pkgrel='1'
pkgdesc='OpenBSD tool to signs and verify signatures on files. Portable version.'
url='https://github.com/aperezdc/signify'
license=('custom:BSD')
arch=('i686' 'x86_64' 'arm')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/aperezdc/${pkgname}/archive/v${pkgver}.tar.gz" LICENSE)
sha512sums=('eb341d4808da9d8aa783cb339136e5aa059c13ebf4398102056938aa11d3a1276dc60a4b63728dbf0e8afe1359c42edd84b83b4af729ddc1ed09bccde7a511b8'
            'a587ef19d5481a81945475a2c1dde0fbf8022e0a28db06389c73df1b7118fb94399f5e4523b91df3d846707dcaffff482ae6e58902b6620bf7b2019a8e15efec')
depends=('libbsd>=0.8')

build () {
	cd "${srcdir}/${pkgname}-${pkgver}"
	if [ -r /etc/makepkg.conf ] ; then
		eval "$(sed -e '/^CFLAGS=/s/^/EXTRA_/p' -e d /etc/makepkg.conf)"
		eval "$(sed -e '/^LDFLAGS=/s/^/EXTRA_/p' -e d /etc/makepkg.conf)"
	fi
	make PREFIX='/usr' LTO=1 \
		EXTRA_CFLAGS="${EXTRA_CFLAGS}" EXTRA_LDFLAGS="${EXTRA_LDFLAGS}"
}

package () {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make PREFIX='/usr' DESTDIR="${pkgdir}" install
	install -Dm644 "${srcdir}/LICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
