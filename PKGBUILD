# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=nbdkit
pkgver=1.28.5
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
validpgpkeys=('F7774FB1AD074A7E8C8767EA91738F73E1B768A0' '71C2CC22B1C4602927D2F3AAA7A16B4A2527436A')
_dldir="${pkgver%.*}"
source=(
		"http://download.libguestfs.org/nbdkit/${_dldir}-stable/nbdkit-${pkgver}.tar.gz"
		"http://download.libguestfs.org/nbdkit/${_dldir}-stable/nbdkit-${pkgver}.tar.gz.sig"
)

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  autoreconf -i

  # disable guestfish tests because of https://bugs.archlinux.org/task/71746
  ./configure --prefix=/usr --sbindir=/usr/bin GUESTFISH=no --without-libguestfs
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

sha256sums=('13569dfd0531cc1b494eca902dbe8770d6e85362964e3daa4ceb793583cf86fd'
            'SKIP')
