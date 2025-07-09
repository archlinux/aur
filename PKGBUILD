# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=nbdkit
pkgver=1.44.1
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
sha256sums=('59044ba81b5890f06678ad88e1a0add4feebefc7e354bb023a75048e69759663'
            'SKIP')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	autoreconf -i

	# libtorrent requires boost as a build dependency
	if ! pacman -Qi boost >/dev/null 2>&1; then
		LIBTORRENT_ARGS=--disable-torrent
	fi

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
