# Maintainer: Sasha Romijn <arch at mxsasha.eu>

pkgname=rpki-client
pkgver="7.0"
pkgrel=1
pkgdesc="Implementation of RPKI for Relying Parties to facilitate ROA validation"
arch=('x86_64' 'aarch64')
url="https://rpki-client.org"
license=('ISC')
depends=('glibc' 'rsync' 'libressl')
source=("https://cdn.openbsd.org/pub/OpenBSD/${pkgname}/${pkgname}-${pkgver}.tar.gz"{,.asc}
	"sysusers-rpki-client.conf"
	"tmpfiles-rpki-client.conf")
sha512sums=('40a23207e79ab6995f08d25beadf9035a9acde38ec56e6b90f7ee7ab337e318d6dc2a6f954e83f9239fddc83b331ceea7615269b1ff7ae85dd5aec101b402412'
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

  # /var directories should not be in package,
  # they will be installed by systemd
  rm -rf "${pkgdir}/var"

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  install -D -m644 README.md "${pkgdir}/usr/share/doc/$pkgname/README.md"
  install -D -m644 "${srcdir}/sysusers-rpki-client.conf" "${pkgdir}/usr/lib/sysusers.d/rpki-client.conf"
  install -D -m644 "${srcdir}/tmpfiles-rpki-client.conf" "${pkgdir}/usr/lib/tmpfiles.d/rpki-client.conf"
}
