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
pkgver=1.1.1
_fragment=#commit=d056f92019b42b76a6ed0934e47f8b2d73beb007 # tags/v1.1.1^0
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
  # Getting the library tag is cumbersome because the repo houses multiple projects
  # (see NOTE 1. above) and there are multiple tags pointing at the 1 commit.
  git tag --points-at | grep "^v[[:digit:]]" | sed 's/^v//'
}

prepare() {
  cd $pkgname
  cargo fetch --locked --target "$CARCH"-unknown-linux-gnu
  sed -i 's/\(^    --locked\)/\1 --offline/' src/cargo-build.sh # XXX fragile!
}

build() {
  cd $pkgname
  meson setup --prefix=/usr build
  meson compile -C build
}

check() {
  cd $pkgname
  meson test -C build --print-errorlogs
}

package() {
  cd $pkgname
  meson install -C build --destdir "$pkgdir"
  install -Dm 644 LICENSE-MIT -t "$pkgdir"/usr/share/licenses/$pkgname
}
