# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=nbdkit
pkgver=1.18.2
pkgrel=1
pkgdesc="NBD server toolkit"
arch=('i686' 'x86_64')
url="https://github.com/libguestfs/nbdkit"
license=('custom: BSD')
depends=()
optdepends=('libvirt' 'lua' 'tcl' 'perl' 'rust' 'libnbd')
validpgpkeys=('F7774FB1AD074A7E8C8767EA91738F73E1B768A0')
_dldir="${pkgver%.*}"
source=(
		"http://download.libguestfs.org/nbdkit/${_dldir}-stable/nbdkit-${pkgver}.tar.gz"
		"http://download.libguestfs.org/nbdkit/${_dldir}-stable/nbdkit-${pkgver}.tar.gz.sig"
)


build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  autoreconf -i

  # https://bugs.archlinux.org/index.php?do=details&task_id=64853
  export GUESTFISH=no
  sed -i 's/HAVE_LIBGUESTFS/HAVE_GUESTFISH/' tests/Makefile.am

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

  # https://bugs.archlinux.org/index.php?do=details&task_id=64853
  TMPPATH="$(mktemp -d --suffix -makepkg-nbdkit)"
  ln -s /usr/bin/false "$TMPPATH"/guestfish
  PATH="$TMPPATH:$PATH" make check
}

sha256sums=('cde090197fa1bc1a911976f6f44931d70efb5b48f5afec239f390716ced034ad'
            'SKIP')
