# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=nbdkit
pkgver=1.24.4
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
  'libtorrent-rasterbar'
  'libselinux'
)
checkdepends=('qemu-headless')
validpgpkeys=('F7774FB1AD074A7E8C8767EA91738F73E1B768A0')
_dldir="${pkgver%.*}"
source=(
		"http://download.libguestfs.org/nbdkit/${_dldir}-stable/nbdkit-${pkgver}.tar.gz"
		"http://download.libguestfs.org/nbdkit/${_dldir}-stable/nbdkit-${pkgver}.tar.gz.sig"
		"https://gitlab.com/nbdkit/nbdkit/-/commit/e29a0c0a2fb725ea0c3e4f363a77b2964ecea7ec.patch"
)

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p1 < "${srcdir}"/e29a0c0a2fb725ea0c3e4f363a77b2964ecea7ec.patch

  rm tests/test-ssh.sh
  touch tests/test-ssh.sh
  chmod +x tests/test-ssh.sh
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

sha256sums=('e3368c51d3f08b0001af6a6d3751cb6177b6db0ca2f3d0ac8e1ed2eeb5d1b54d'
            'SKIP'
            'a161ec4bfcc772d90a07b92a387c00b5e1602c819ab6c87e13d6fbec1ef759ce')
