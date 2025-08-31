# Maintainer: konyogony <dev@wayclip.com>
pkgname=wayclip-cli
pkgver=0.1.8
pkgrel=1
pkgdesc="The CLI interface for Wayclip, an instant replay tool built for the Linux community."
arch=('x86_64')
url="https://github.com/wayclip/cli"
license=('MIT')
depends=('bzip2' 'elfutils' 'gstreamer' 'glib2' 'libffi' 'libunwind' 'openssl' 'pcre2' 'util-linux-libs' 'xz' 'zlib' 'zstd')
makedepends=('rust' 'cargo')

source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v$pkgver.tar.gz"
        "wayclip-core.tar.gz::https://github.com/Wayclip/core/releases/download/v0.1.0/wayclip-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
        "wayclip-daemon.service")

sha256sums=('43a9e0c7e472d7026557da401e88142bcb36bc33497c169b708166588107748f'
            '3feeefb691d1e614be8104ce5669e24b27f607aafbea4b8996060a137fca0298'
            'ea6d66b8f244c7a4b602f7e29e4f12090c1346a1e82f31e41899a79e17b55ea9')

prepare() {
  mv "$srcdir/wayclip-binaries/daemon" "$srcdir/"
  mv "$srcdir/wayclip-binaries/trigger" "$srcdir/"

  cd "$srcdir/cli-$pkgver"
}

build() {
  cd "$srcdir/cli-$pkgver"
  export CFLAGS+=" -ffat-lto-objects"
  export CXXFLAGS+=" -ffat-lto-objects"
  export RUSTUP_TOOLCHAIN=stable
  cargo build --release
}

check() {
  cd "$srcdir/cli-$pkgver"
  cargo test
}

package() {
  install -Dm755 "$srcdir/cli-$pkgver/target/release/wayclip_cli" "$pkgdir/usr/bin/wayclip-cli"

  install -Dm755 "$srcdir/daemon" "$pkgdir/usr/bin/wayclip-daemon"
  install -Dm755 "$srcdir/trigger" "$pkgdir/usr/bin/wayclip-trigger"

  install -Dm644 "$srcdir/wayclip-daemon.service" "$pkgdir/usr/lib/systemd/user/wayclip-daemon.service"
}
