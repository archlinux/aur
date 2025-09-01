# Maintainer: konyogony <dev@wayclip.com>
pkgname=wayclip-cli
pkgver=0.1.12
pkgrel=1
pkgdesc="The CLI interface for Wayclip, an instant replay tool built for the Linux community."
arch=('x86_64')
url="https://github.com/wayclip/cli"
license=('MIT')
depends=('bzip2' 'elfutils' 'gstreamer' 'glib2' 'libffi' 'libunwind' 'openssl' 'pcre2' 'util-linux-libs' 'xz' 'zlib' 'zstd')
makedepends=('rust' 'cargo')
provides=('wayclip')
conflicts=('wayclip')

source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v$pkgver.tar.gz"
        "wayclip-core.tar.gz::https://github.com/Wayclip/core/archive/refs/tags/v0.1.1.tar.gz"
        "wayclip-daemon.service")

sha256sums=('25c905d9896db818ebd3d49fb2d85bad65c11432c0b31bccf198f578c4947adb'
            'bed1151125a7906749eaec504ea085d2406e1022dd26ca49ccb416a4cb88daa8'
            'ea6d66b8f244c7a4b602f7e29e4f12090c1346a1e82f31e41899a79e17b55ea9')

prepare() {
  tar -xzf "$srcdir/$pkgname-$pkgver.tar.gz" -C "$srcdir/"
  tar -xzf "$srcdir/wayclip-core.tar.gz" -C "$srcdir/"
}

build() {
  local core_dir="core-v0.1.1"

  export CFLAGS+=" -ffat-lto-objects"
  export CXXFLAGS+=" -ffat-lto-objects"
  export RUSTUP_TOOLCHAIN=stable

  cd "$srcdir/$core_dir"
  cargo build --release --locked
  mv target/release/daemon "$srcdir/daemon"
  mv target/release/trigger "$srcdir/trigger"

  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release --locked
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo test
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/wayclip" "$pkgdir/usr/bin/wayclip"

  install -Dm755 "$srcdir/daemon" "$pkgdir/usr/bin/wayclip-daemon"
  install -Dm755 "$srcdir/trigger" "$pkgdir/usr/bin/wayclip-trigger"

  install -Dm644 "$srcdir/wayclip-daemon.service" "$pkgdir/usr/lib/systemd/user/wayclip-daemon.service"
}
