# Maintainer: Markus Hartung <mail@hartmark.se>
# Contributor: Thomas Weißschuh <thomas t-8ch de>

pkgname=nbdkit-git
_pkgname=nbdkit
pkgver=r4338.87172574
pkgrel=2
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
makedepends=(git)
source=(
  "${pkgname}::git+https://gitlab.com/nbdkit/nbdkit.git"
)
conflicts=($_pkgname)
provides=($pkgname)

pkgver() {
  cd "${pkgname}"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${pkgname}"

}

build() {
  cd "${srcdir}/${pkgname}"

  autoreconf -i

  # libtorrent requires boost as a build dependency
  if ! pacman -Qi boost >/dev/null 2>&1; then
    LIBTORRENT_ARGS=--disable-torrent
  fi

  ./configure --prefix=/usr --sbindir=/usr/bin $LIBTORRENT_ARGS
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  install -m644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  make DESTDIR="$pkgdir" install
}

check() {
  cd "${srcdir}/${pkgname}"
  make check
}
md5sums=('SKIP')
