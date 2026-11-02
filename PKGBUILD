# Maintainer: Markus Hartung <mail@hartmark.se>
# Contributor: Thomas Weißschuh <thomas t-8ch de>

pkgname=nbdkit-git
_pkgname=nbdkit
pkgver=r4338.87172574
pkgrel=3
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

  'libselinux'
)
checkdepends=('qemu')
makedepends=(git)
source=(
  "${pkgname}::git+https://gitlab.com/nbdkit/nbdkit.git"
  "test-ssh-libssh-algos.patch"
)
conflicts=($_pkgname)
provides=($pkgname)

pkgver() {
  cd "${pkgname}"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${pkgname}"

  # test-ssh.sh probes localhost with OpenSSH, but the plugin uses libssh,
  # which lacks e.g. ML-DSA keys. Probe with libssh-supported algorithms
  # only, so the test is skipped instead of failing on such hosts.
  patch -Np1 -i "${srcdir}/test-ssh-libssh-algos.patch"
}

build() {
  cd "${srcdir}/${pkgname}"

  autoreconf -i

  # The torrent plugin does not build with libtorrent-rasterbar 2.1
  # (int -> libtorrent::file_index_t), so it is disabled until fixed upstream:
  # https://gitlab.com/nbdkit/nbdkit/-/work_items/33
  ./configure --prefix=/usr --sbindir=/usr/bin --disable-torrent
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
md5sums=('SKIP'
         '7adf5b1462a7488a0fbb2f6b26cf8801')
