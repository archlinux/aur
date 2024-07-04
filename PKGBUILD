# Maintainer: Toolybird <toolybird at tuta dot io>

# NOTES:
# 1. The upstream repo includes src for a C API library and some rust crates.
# This PKGBUILD is concerned *only* with the library. However, the crates are
# also built here and linked into the library. More details here:
# https://bugzilla.redhat.com/show_bug.cgi?id=2124697#c18

# 2. Library license clarification:
# https://bugzilla.redhat.com/show_bug.cgi?id=2124697#c13

# 3. crosvm license applies only to virtio-driver crate. See:
# https://gitlab.com/libblkio/libblkio/-/commit/02ade52f495381719f049ebdd9575a66ce00ad00

# 4. This pkg uses Meson and a shell script to build Rust code. Try to follow the ArchWiki
# Rust package guidelines.

pkgname=libblkio
pkgver=1.5.0
pkgrel=2
pkgdesc="High-performance block device I/O library with C API"
arch=(x86_64)
url="https://gitlab.com/libblkio/libblkio"
license=(
  'Apache-2.0 OR MIT'                                   # main
  '(MIT OR Apache-2.0) AND BSD-3-Clause'                # virtio-driver
  'Apache-2.0 OR Apache-2.0 WITH LLVM-exception OR MIT' # linux-raw-sys, rustix
  'Apache-2.0 OR BSD-3-Clause'                          # virtio-bindings
)
depends=(gcc-libs glibc)
makedepends=(cargo git jq meson python-docutils)
# Use this to get licensing info for all crates depended upon
makedepends+=(cargo-license)
((_ARCH_TEST_EXTRA)) && checkdepends=(qemu-img)
source=("git+$url#tag=v$pkgver")
sha256sums=('7eb1292a4630d6f9aed782d06491c70d8958d1909058ea2f63d8cbbc39b64ff3')

prepare() {
  cd $pkgname
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
  cargo-license --color never
  sed -i -e 's/--locked/--frozen/' -e 's/--color always/--color auto/' src/cargo-build.sh
}

build() {
  cd $pkgname
  meson setup --prefix=/usr build
  meson compile -C build
}

check() {
  # Refer to "tests/meson.build" for the list of test suites.
  # The following suites cannot be run because:
  #   'virtio-blk-vhost-vdpa' -> requires kernel modules pre-loaded
  #   'nvme-io_uring' -> requires a character device corresponding to an NVMe namespace
  #   'nvme-io_uring-zoned' -> ditto
  #   'virtio-blk-vfio-pci' -> requires access to e.g. /sys/bus/pci/devices/0000:00:01.0
  # Upstream provide a script to run these tests inside a VM. See "run-test-suites-in-vm.sh".

  cd $pkgname
  meson test -C build --suite generic --suite io_uring+parallel --suite examples --print-errorlogs

  # Don't run the 'virtio-blk-vhost-user' test suite by default, because running a daemon
  # inside a PKGBUILD is a bit iffy. Pass _ARCH_TEST_EXTRA=1 into the build environment if
  # you want it to run.

  if ((_ARCH_TEST_EXTRA)); then
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
  # meson install -C build --destdir "$pkgdir" # Doesn't work here. Work around it by calling ninja directly.
  DESTDIR="$pkgdir" ninja install -C build
  install -vDm 644 LICENSE{-MIT,.crosvm} -t "$pkgdir/usr/share/licenses/$pkgname"

  # Install the required "uncommon" license from the rustix crate.
  local _rustix_ver
  _rustix_ver=$(cargo metadata --format-version=1 | jq -r '.packages[] | select(.name == "rustix") | .version')
  install -vDm 644 "$(find "$HOME/.cargo/registry/src" -path "*rustix-$_rustix_ver/*LLVM-exception")" \
    -t "$pkgdir/usr/share/licenses/$pkgname"
}
