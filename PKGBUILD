# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=nbdkit
pkgver=1.16.2
pkgrel=1
pkgdesc="NBD server toolkit"
arch=('i686' 'x86_64')
url="https://github.com/libguestfs/nbdkit"
license=('custom: BSD')
depends=()
optdepends=('libvirt' 'lua' 'tcl' 'perl' 'rust')
validpgpkeys=('F7774FB1AD074A7E8C8767EA91738F73E1B768A0')
source=(
		"http://download.libguestfs.org/nbdkit/1.16-stable/nbdkit-${pkgver}.tar.gz"
		"http://download.libguestfs.org/nbdkit/1.16-stable/nbdkit-${pkgver}.tar.gz.sig"
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

sha256sums=('0267e3a3dbf1b2eff343c0cef16697db8e8777bd869eb6c75e60842516a5aa01'
            'SKIP')
