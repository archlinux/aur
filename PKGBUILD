# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=nbdkit
pkgver=1.32.0
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
checkdepends=('qemu')
validpgpkeys=('F7774FB1AD074A7E8C8767EA91738F73E1B768A0' '71C2CC22B1C4602927D2F3AAA7A16B4A2527436A')
_dldir="${pkgver%.*}"
source=(
		"http://download.libguestfs.org/nbdkit/${_dldir}-stable/nbdkit-${pkgver}.tar.gz"
		"http://download.libguestfs.org/nbdkit/${_dldir}-stable/nbdkit-${pkgver}.tar.gz.sig"
		fs74747.patch
)

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p0 < "${srcdir}/fs74747.patch"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  autoreconf -i

  # disable guestfish tests because of https://bugs.archlinux.org/task/71746
  ./configure --prefix=/usr --sbindir=/usr/bin GUESTFISH=no --without-libguestfs --without-rust
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

sha256sums=('867330d9d348feeea588d2bc66a8eea64c4e4f0154bf69a0d89404eeebc537a9'
            'SKIP'
            '4ae58421aa6cc59868f6ca11c82d308ceb5972cbcbd3c09416837bb98377911e')
