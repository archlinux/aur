# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=nbdkit
pkgver=1.22.3
pkgrel=1
pkgdesc="NBD server toolkit"
arch=('i686' 'x86_64')
url="https://github.com/libguestfs/nbdkit"
license=('custom: BSD')
depends=()
optdepends=('libvirt' 'lua' 'tcl' 'perl' 'rust' 'libnbd')
checkdepends=('qemu')
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

  # the provided 1.2.8 plugins link to libselinux which we do not have on Arch
  rm tests/old-plugins/x86_64/Linux/v1.2.8/nbdkit-file-plugin.so
  rm tests/old-plugins/i686/Linux/v1.2.8-2-gd2d934df/nbdkit-file-plugin.so
  # sed -i '/test-old-plugins-.*-v1.2.8-.*\.sh/d' tests/Makefile.am

  make check
}

sha256sums=('2dc7c814a2c484cd107d438dc39c73a67a187189f36a410d9e661bcbaca894d4'
            'SKIP')
