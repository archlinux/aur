# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=nbdkit
pkgver=1.48.0
pkgrel=1
pkgdesc="NBD server toolkit"
arch=('x86_64')
url="https://gitlab.com/nbdkit/nbdkit/"
license=(BSD-3-Clause)
depends=()
optdepends=(
  'lua'
  'tcl'
  'perl'
  'rust'
  'go'
  'python'
  'ocaml'

  'libnbd'
  'libvirt'
  'curl'
  'libguestfs'
  'libssh'

  'libtorrent-rasterbar: for libtorrent support'
  'boost: for libtorrent support'

  'libselinux'
)
checkdepends=('qemu')
validpgpkeys=('F7774FB1AD074A7E8C8767EA91738F73E1B768A0' '71C2CC22B1C4602927D2F3AAA7A16B4A2527436A')
_dldir="${pkgver%.*}"
source=("http://download.libguestfs.org/nbdkit/${_dldir}-stable/nbdkit-${pkgver}.tar.gz"
	"http://download.libguestfs.org/nbdkit/${_dldir}-stable/nbdkit-${pkgver}.tar.gz.sig"
)
sha256sums=('5b90ed8277c514889e54e2b703ccf85086015d7174bbf10dd16e16f5e35d9cef'
            'SKIP')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	autoreconf -i

	# The plugin does not compile against latest libtorrent
	LIBTORRENT_ARGS=--disable-torrent

	./configure --prefix=/usr --sbindir=/usr/bin $LIBTORRENT_ARGS
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	install -m644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	make DESTDIR="$pkgdir" install
}

check() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	make check
}
