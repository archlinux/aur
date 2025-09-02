# Maintainer: konyogony <dev@wayclip.com>
pkgname=wayclip-cli
pkgver=0.1.24
pkgrel=1
pkgdesc="The CLI interface for Wayclip, an instant replay tool built for the Linux community."
arch=('x86_64')
url="https://github.com/wayclip/cli"
license=('MIT')
depends=('bzip2' 'elfutils' 'gstreamer' 'glib2' 'libffi' 'libunwind' 'openssl' 'pcre2' 'util-linux-libs' 'xz' 'zlib' 'zstd')
makedepends=('rust' 'cargo')
provides=('wayclip-cli')
conflicts=('wayclip-cli')

source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v$pkgver.tar.gz"
        "wayclip-core.tar.gz::https://github.com/Wayclip/core/releases/download/v0.1.1/wayclip-v0.1.1-x86_64-unknown-linux-gnu.tar.gz")

prepare() {
  tar -xzf "$srcdir/$pkgname-$pkgver.tar.gz" -C "$srcdir/"
  tar -xzf "$srcdir/wayclip-core.tar.gz" -C "$srcdir/"
  cd "$srcdir/cli-$pkgver"
  cargo fetch
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  cd "$srcdir/cli-$pkgver"
  cargo build --release --frozen
}

package() {
  install -Dm755 "$srcdir/cli-$pkgver/target/release/wayclip_cli" "$pkgdir/usr/bin/wayclip-cli"
  install -Dm755 "$srcdir/wayclip-binaries/daemon" "$pkgdir/usr/bin/wayclip-daemon"
  install -Dm755 "$srcdir/wayclip-binaries/trigger" "$pkgdir/usr/bin/wayclip-trigger"
  install -Dm644 "$srcdir/cli-$pkgver/assets/wayclip-daemon.service" "$pkgdir/usr/lib/systemd/user/wayclip-daemon.service"
}
sha256sums=('f99e8bee144f35ee125da3c7b17ffcc72fb45ba3a6a44b1824e90842e03f6399'
            'bed1151125a7906749eaec504ea085d2406e1022dd26ca49ccb416a4cb88daa8')
