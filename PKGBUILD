# Maintainer: Markus Hartung <mail@hartmark.se>
# Contributor: Thomas Weißschuh <thomas t-8ch de>

pkgname=nbdkit-git
_pkgname=nbdkit
pkgver=r4865.0614f178
pkgrel=1
pkgdesc="NBD server toolkit"
arch=('x86_64')
url="https://gitlab.com/nbdkit/nbdkit/"
license=('BSD-3-Clause')
depends=(
  'glibc'
  'gnutls'
  'libbsd'
  # Libraries linked by filters and plugins that are always built
  'bzip2'
  'e2fsprogs'
  'libgcc'
  'libstdc++'
  'xz'
  'zlib'
  'zlib-ng'
  'zstd'
)
optdepends=(
  'curl: for the curl plugin'
  'libnbd: for the nbd plugin'
  'libssh: for the ssh plugin'
  'libvirt: for the libvirt plugin'
  'lua: for the lua plugin'
  'perl: for the perl plugin'
  'python: for the python, S3 and gcs plugins'
  'python-boto3: for the S3 plugin'
  'tcl: for the tcl plugin'
  'go: for writing plugins in Go'
  'rust: for writing plugins in Rust'
)
checkdepends=('qemu')
makedepends=(git)
source=(
  "${pkgname}::git+https://gitlab.com/nbdkit/nbdkit.git"
  'indexed-gzip-fix.patch'
)
conflicts=($_pkgname)
provides=("$_pkgname")

pkgver() {
  cd "${pkgname}"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${pkgname}"

  # Start from a clean tree. Build output from earlier runs survives in a
  # reused $srcdir, e.g. a stale plugins/torrent/.libs/*.so that the plugin
  # tests then try to load even though torrent is now disabled.
  git clean -fdxq

  patch -Np1 -i "${srcdir}/indexed-gzip-fix.patch"
}

build() {
  cd "${srcdir}/${pkgname}"

  autoreconf -i

  # The torrent plugin does not build with libtorrent-rasterbar 2.1
  # (int -> libtorrent::file_index_t), so it is disabled until fixed upstream:
  # https://gitlab.com/nbdkit/nbdkit/-/work_items/33
  ./configure --prefix=/usr --sbindir=/usr/bin --disable-torrent
  # libtool puts -shared before LDFLAGS, which defeats -Wl,--as-needed and
  # overlinks every plugin/filter against libz, libgnutls and libm.
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
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
sha256sums=('SKIP'
            'ff8db2d363a7a5af73fdada2f8a756f2f4adb804c74b675dd96dcf6ceb64f62d')
