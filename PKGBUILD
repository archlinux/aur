# Maintainer: Nova <1367322+l1n@users.noreply.github.com>
pkgname=rgmond
pkgver=0.1.0
pkgrel=1
pkgdesc="Implementation of the Ganglia gmond monitoring agent, with BPF, PSI and cgroup metrics"
arch=('x86_64')
url="https://github.com/l1n/rgmond"
license=('BSD-3-Clause' 'GPL-2.0-only')
depends=('glibc' 'libgcc')
backup=('etc/rgmond/host.toml')
makedepends=('cargo' 'clang' 'libbpf')
optdepends=('ganglia: gmetad, ganglia-web and the gmetric CLI'
            'python: rgmond-import-gmond-conf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('59e64bba68d1d47383c9c3134daf06effd894861fe6c96543ee290bb1a3e981c')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
  cargo test --frozen --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/rgmond "$pkgdir/usr/bin/rgmond"
  install -Dm755 tools/convert_conf.py "$pkgdir/usr/bin/rgmond-import-gmond-conf"
  install -Dm644 packaging/rgmond@.service "$pkgdir/usr/lib/systemd/system/rgmond@.service"
  install -Dm644 examples/host.toml "$pkgdir/etc/rgmond/host.toml"
  install -Dm644 examples/host.toml "$pkgdir/usr/share/doc/rgmond/examples/host.toml"
  install -Dm644 examples/aggregator.toml "$pkgdir/usr/share/doc/rgmond/examples/aggregator.toml"
  install -Dm644 README.md docs/metrics.md -t "$pkgdir/usr/share/doc/rgmond/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
