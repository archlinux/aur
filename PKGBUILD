# Maintainer: Sasha Romijn <arch at mxsasha.eu>
# Contributor: T.J. Townsend <blakkheim@archlinux.org>

pkgname=rpki-client
pkgver=8.9
pkgrel=1
pkgdesc="Implementation of RPKI for Relying Parties to facilitate ROA validation"
arch=('x86_64')
url="https://rpki-client.org"
license=('ISC')
depends=('glibc' 'expat' 'rsync' 'libressl')
source=("https://cdn.openbsd.org/pub/OpenBSD/${pkgname}/${pkgname}-${pkgver}.tar.gz"{,.asc}
	"sysusers-rpki-client.conf"
	"tmpfiles-rpki-client.conf")
sha512sums=('75b6bcd3916d24698715414371219769822a01b4573a8827fd9e95491fc357b0dbc64dc4fd4dfd4a8bb3a6773f202a1d82f6ab7a4dfdcc44110e242e434bde20'
            'SKIP'
            '13603ff4fe582a07984dd8a2a0704c8795f5d604a9b2afee43278169d9e187300a349d2629bea0d64f0ff6a3d6347ad2a9d9010ae96d440b07ec1a1f869c0891'
            'd51b0464399d4a36af4353dd99492eff6a99d1bcb6bd95b8602c8c0c23af18e278c41b9a081b84bbd97e84e9f18917e1e0d70a3ff897bd3e261796b292f72826')
validpgpkeys=('B5B6416FEA6DDA05EA562A9FCB987F2783972FF9') # Sebastian Benoit

install="rpki-client.install"

build() {
  cd "${pkgname}-${pkgver}"

  CFLAGS+=' -I/usr/include/libressl -L/usr/lib/libressl -Wl,-rpath=/usr/lib/libressl' \
  ./configure \
  --prefix=/usr \
  --sbindir=/usr/bin \
  --sysconfdir=/etc \
  --localstatedir=/var \
  --with-user=rpki-client

  make
}

package() {
  cd "${pkgname}-${pkgver}"

  make DESTDIR="$pkgdir" install

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  install -D -m644 README.md "${pkgdir}/usr/share/doc/$pkgname/README.md"
  install -D -m644 "${srcdir}/sysusers-rpki-client.conf" "${pkgdir}/usr/lib/sysusers.d/rpki-client.conf"
  install -D -m644 "${srcdir}/tmpfiles-rpki-client.conf" "${pkgdir}/usr/lib/tmpfiles.d/rpki-client.conf"
}
