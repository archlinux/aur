# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=nbdkit
pkgver=1.32.3
pkgrel=2
pkgdesc="NBD server toolkit"
arch=('i686' 'x86_64')
url="https://gitlab.com/nbdkit/nbdkit/"
license=('custom: BSD')
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
  'libtorrent-rasterbar' 'boost'
  'libselinux'
)
checkdepends=('qemu')
validpgpkeys=('F7774FB1AD074A7E8C8767EA91738F73E1B768A0' '71C2CC22B1C4602927D2F3AAA7A16B4A2527436A')
_dldir="${pkgver%.*}"
source=(
		"http://download.libguestfs.org/nbdkit/${_dldir}-stable/nbdkit-${pkgver}.tar.gz"
		"http://download.libguestfs.org/nbdkit/${_dldir}-stable/nbdkit-${pkgver}.tar.gz.sig"
		0001-rust-prevent-dead_code-warning.patch
)

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p1 < "${srcdir}"/0001-rust-prevent-dead_code-warning.patch
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  autoreconf -i

  ./configure --prefix=/usr --sbindir=/usr/bin
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

sha256sums=('5ef9627be6831977fc30d6808e12e01a3bb22a2805f0a250a4320f0360b9d01d'
            'SKIP'
            'e65e11e122e8ae2b7f93f33f42cdbd3e619f02a36038dbab4dc42c5c3e403008')
