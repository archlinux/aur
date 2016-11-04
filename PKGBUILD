# Author: Adrian Perez de Castro <aperez@igalia.com>
pkgname='signify'
pkgver='20'
pkgrel='1'
pkgdesc='OpenBSD tool to signs and verify signatures on files. Portable version.'
url='https://github.com/aperezdc/signify'
license=('custom:BSD')
arch=('i686' 'x86_64' 'arm')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/aperezdc/${pkgname}/archive/v${pkgver}.tar.gz" LICENSE)
sha512sums=('993f02b10ef9c74a98455e2c93e094de40a40710c38ff35752decb87430895bd276cb5e6a46b5f7cf3f098d66562f1f0e134158d221a87fb33cfff09199a8773'
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
