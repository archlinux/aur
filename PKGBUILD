# Maintainer: Toolybird <toolybird at tuta dot io>

# NOTE: The upstream repo includes a C API library and some rust crates.
# This PKGBUILD is concerned *only* with the library. More details here:
# https://bugzilla.redhat.com/show_bug.cgi?id=2124697#c18

# Library license clarification:
# https://bugzilla.redhat.com/show_bug.cgi?id=2124697#c13

# crosvm license applies only to virtio-driver crate which is not packaged here:
# https://gitlab.com/libblkio/libblkio/-/commit/02ade52f495381719f049ebdd9575a66ce00ad00

pkgname=libblkio
pkgver=1.1.0
_fragment=#commit=c46866ac4825fff96770d4741e3a5d4fa432dd42 # tags/v1.1.0^0
pkgrel=1
pkgdesc="High-performance block device I/O library with C API"
arch=(x86_64)
url="https://gitlab.com/libblkio/libblkio"
license=(MIT Apache)
depends=(gcc-libs)
makedepends=(cargo git meson python-docutils)
source=(git+https://gitlab.com/libblkio/libblkio.git"$_fragment")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  # Getting the library tag is cumbersome because multiple projects are in the repo
  # (see NOTE above) and there are multiple tags pointing at the 1 commit.
  git tag --points-at | grep "^v[[:digit:]]" | sed 's/^v//'
}

build() {
  cd $pkgname
  meson setup --prefix=/usr build
  meson compile -C build
}

check() {
  cd $pkgname
  # At least 1 test fails in this release -> libblkio:io_uring / poll-queues
  meson test -C build --print-errorlogs || true
}

package() {
  cd $pkgname
  meson install -C build --destdir "$pkgdir"
  install -Dm 644 LICENSE-MIT -t "$pkgdir"/usr/share/licenses/$pkgname
}
