# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=nbdkit
pkgver=1.28.0
pkgrel=1
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
  'libtorrent-rasterbar'
  'libselinux'
)
checkdepends=('qemu-headless')
validpgpkeys=('F7774FB1AD074A7E8C8767EA91738F73E1B768A0')
_dldir="${pkgver%.*}"
source=(
		"http://download.libguestfs.org/nbdkit/${_dldir}-stable/nbdkit-${pkgver}.tar.gz"
		"http://download.libguestfs.org/nbdkit/${_dldir}-stable/nbdkit-${pkgver}.tar.gz.sig"
)

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  autoreconf -i

  # disable guestfish tests because of https://bugs.archlinux.org/task/71746
  ./configure --prefix=/usr --sbindir=/usr/bin GUESTFISH=no
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -m644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  make DESTDIR="$pkgdir" install
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  mkdir -p bin

  echo -e "#!/bin/sh\nexec false" > bin/guestfish
  chmod +x bin/guestfish
  export PATH="$(realpath bin):$PATH"

  make check
}

sha256sums=('46f589d9f336d1244c244718ae4b737b4f2710fec7e0a0d2ffdfec211782e7b0'
            'SKIP')
