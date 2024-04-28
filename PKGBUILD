# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=nbdkit
pkgver=1.38.1
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
		0001-tests-gcs-skip-tests-without-google-cloud-module.patch
)

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # https://github.com/file/file/pull/137
  patch -p1 < "${srcdir}/broken-file.patch"
  patch -p1 < "${srcdir}/0001-tests-gcs-skip-tests-without-google-cloud-module.patch"

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

sha256sums=('c6ee1d73fe033fff1168b61f64e03d796a0dfd4d5e81537069dd174cecdc78b3'
            'SKIP'
            '7150a8b5849ef48c7e60a93cd461ee658df02a4184c182df305b2cd16371473e'
            'e76cb0a6dfdd444689f957d56b0a5b07178f015d909418e1d859d04aaaf466e2')
