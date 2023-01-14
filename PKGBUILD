# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=nbdkit
pkgver=1.32.5
pkgrel=1
pkgdesc="NBD server toolkit"
arch=('x86_64')
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
		clippy.patch
		0001-data-don-t-ignore-SIGPIPE.patch
)

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p1 < "${srcdir}"/clippy.patch
  patch -p1 < "${srcdir}"/0001-data-don-t-ignore-SIGPIPE.patch
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

sha256sums=('07921293f22bfaa121cff1ba3f13d75243f5cd4864abbb20aa9686ed5649dbf4'
            'SKIP'
            '3d26e9fab4bb240dcb5e19da9f9f7c74027de9ae486001a7d927fcf7be681be5'
            'cafec77dd3e32567dd6aed27733a4fe84787751d805d27471eba66b438fa2396')
