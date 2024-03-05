# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=nbdkit
pkgver=1.36.4
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

  'libtorrent-rasterbar: for libtorrent support'
  'boost: for libtorrent support'

  'libselinux'
)
checkdepends=('qemu')
validpgpkeys=('F7774FB1AD074A7E8C8767EA91738F73E1B768A0' '71C2CC22B1C4602927D2F3AAA7A16B4A2527436A')
_dldir="${pkgver%.*}"
source=(
		"http://download.libguestfs.org/nbdkit/${_dldir}-stable/nbdkit-${pkgver}.tar.gz"
		"http://download.libguestfs.org/nbdkit/${_dldir}-stable/nbdkit-${pkgver}.tar.gz.sig"
		broken-file.patch
)

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # https://github.com/file/file/pull/137
  patch -p1 < "${srcdir}/broken-file.patch"
}

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

sha256sums=('70720bc67a2404d4e50ca75afe49e07352686327f428f4c7706a9b55229b0e8e'
            'SKIP'
            '7150a8b5849ef48c7e60a93cd461ee658df02a4184c182df305b2cd16371473e')
