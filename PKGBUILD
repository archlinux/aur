# Maintainer: konyogony <dev@wayclip.com>
pkgname=wayclip-cli
pkgver=0.1.9
pkgrel=1
pkgdesc="The CLI interface for Wayclip, an instant replay tool built for the Linux community."
arch=('x86_64')
url="https://github.com/wayclip/cli"
license=('MIT')
depends=('bzip2' 'elfutils' 'gstreamer' 'glib2' 'libffi' 'libunwind' 'openssl' 'pcre2' 'util-linux-libs' 'xz' 'zlib' 'zstd')
makedepends=('rust' 'cargo')

source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v$pkgver.tar.gz"
        "wayclip-core.tar.gz::https://github.com/Wayclip/core/releases/download/v0.1.1/wayclip-v0.1.1-x86_64-unknown-linux-gnu.tar.gz"
        "wayclip-daemon.service")

sha256sums=('87a26fa7b2144821690d2c59feb7f1a65e59dab6fce2a4b250cd782a1ed0173d'
            'c6e6a209ab3ab1a6478e65bd461c621c1ffb2886ca30fde10f9f313079207a70'
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
