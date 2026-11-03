# Maintainer: Markus Hartung <mail@hartmark.se>
# Contributor: Thomas Weißschuh <thomas t-8ch de>

pkgname=nbdkit-git
_pkgname=nbdkit
pkgver=r4859.42f73ac8
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
  "test-ssh-libssh-algos.patch"
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
            'd4867774c73c3fc1039b9a0e8aa42f478bf6c3a55ba16205a993ecb97cb76bef')
