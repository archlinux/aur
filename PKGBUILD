# Maintainer: Toolybird <toolybird at tuta dot io>

# NOTES:
# 1. The upstream repo includes src for a C API library and some rust crates.
# This PKGBUILD is concerned *only* with the library. More details here:
# https://bugzilla.redhat.com/show_bug.cgi?id=2124697#c18

# 2. Library license clarification:
# https://bugzilla.redhat.com/show_bug.cgi?id=2124697#c13

# 3. crosvm license applies only to virtio-driver crate which is not built here. See:
# https://gitlab.com/libblkio/libblkio/-/commit/02ade52f495381719f049ebdd9575a66ce00ad00

# 4. This pkg uses Meson and a shell script to build Rust code. Not sure if the ArchWiki
# Rust package guidelines are applicable here or not, but try to follow them anyway.

pkgname=libblkio
pkgver=1.2.2
_fragment=#commit=896397e44daf2bbe3df32717ee15f49fe1a072a3 # tags/v1.2.2^0
pkgrel=1
pkgdesc="High-performance block device I/O library with C API"
arch=(x86_64)
url="https://gitlab.com/libblkio/libblkio"
license=(MIT Apache)
depends=(gcc-libs)
makedepends=(cargo git meson python-docutils)
(( _ARCH_TEST_EXTRA )) && checkdepends=(qemu-img)
source=(git+https://gitlab.com/libblkio/libblkio.git"$_fragment")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  # Getting the library tag is cumbersome because the repo houses multiple projects
  # (see NOTE 1. above) and there are multiple tags pointing at the 1 commit.
  git tag --points-at | grep "^v[[:digit:]]" | sed 's/^v//'
}

prepare() {
  cd $pkgname
  cargo fetch --locked --target "$CARCH"-unknown-linux-gnu
  sed -i 's/--locked/--frozen/' src/cargo-build.sh
}

build() {
  cd $pkgname
  meson setup --prefix=/usr build
  meson compile -C build
}

check() {
  # Refer to tests/meson.build for the list of test suites. We cannot run the
  # 'virtio-blk-vhost-vdpa' test suite because it requires kernel modules pre-loaded.

  cd $pkgname
  meson test -C build --suite generic --suite io_uring --suite examples --print-errorlogs

  # Don't run the 'virtio-blk-vhost-user' test suite by default, because running a daemon
  # inside a PKGBUILD is a bit iffy. Pass _ARCH_TEST_EXTRA=1 into the build environment if
  # you want it to run.

  if (( _ARCH_TEST_EXTRA )); then
    # Set up the test suite.
    local _test_file=/tmp/libblkio-vhost-user-tests.qcow2
    local _test_socket=/tmp/libblkio-vhost-user-tests.sock
    qemu-img create -f qcow2 $_test_file 1M
    qemu-storage-daemon \
      --blockdev file,filename=$_test_file,node-name=file \
      --blockdev qcow2,file=file,node-name=qcow2 \
      --export type=vhost-user-blk,id=export,addr.type=unix,addr.path=$_test_socket,node-name=qcow2,writable=on,num-queues=2 &
    local _qsd_pid=$!

    meson test -C build --suite virtio-blk-vhost-user --print-errorlogs

    # Clean up.
    kill $_qsd_pid
    rm -v $_test_file
  fi
}

package() {
  cd $pkgname
  meson install -C build --destdir "$pkgdir"
  install -Dm 644 LICENSE-MIT -t "$pkgdir"/usr/share/licenses/$pkgname
}
