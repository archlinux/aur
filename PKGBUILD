# Maintainer: Yuval Adam <aur@yuv.al>
pkgname=spill
pkgver=0.7.5
pkgrel=1
pkgdesc='BitTorrent client and daemon with a web interface'
arch=('x86_64' 'aarch64')
url='https://github.com/spillrs/spill'
license=('Apache-2.0')
depends=('glibc' 'libgcc' 'sqlite')
makedepends=('cargo' 'pkgconf')
# GCC LTO objects from ring cannot link with Rust's LLVM linker.
options=('!lto')
backup=('etc/spill/spill.toml')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        'spill-system.service' 'spill-user.service' 'spill.sysusers'
        'spill.toml' 'spill-user.toml')
sha256sums=('4b2165157632cc338b3a7f20014a8d60e899eed976375fd1960b42a6b5326ff4'
            'fb1ad0e724ad411a5a1c7e7b9cbda8d0ea125bdcaac6c05aac0083d4c8701ce3'
            '5b65f6a5750a05135483e3d6c07ff0fa2396805c1824b7ce6b27d146b5ab16b1'
            '48eff72045dc86fc4a8ab0e45186aadef232d03a71029e74ac42b272824968e1'
            '89810c573543fc97c8fba68727f28525a112e69b0262b959e2953e98b8904d31'
            '04c011998e62b90637c6ee93fba9d235953cdf36b6a9566aad3773adf8e874c8')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target host-tuple
}

build() {
  cd "$pkgname-$pkgver"
  export CARGO_TARGET_DIR=target LIBSQLITE3_SYS_USE_PKG_CONFIG=1
  cargo build --frozen --release --all-features
}

check() {
  cd "$pkgname-$pkgver"
  export CARGO_TARGET_DIR=target LIBSQLITE3_SYS_USE_PKG_CONFIG=1
  cargo test --frozen --all-features --workspace
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/spill "$pkgdir/usr/bin/spill"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/spill-system.service" "$pkgdir/usr/lib/systemd/system/spill.service"
  install -Dm644 "$srcdir/spill-user.service" "$pkgdir/usr/lib/systemd/user/spill.service"
  install -Dm644 "$srcdir/spill.sysusers" "$pkgdir/usr/lib/sysusers.d/spill.conf"
  install -Dm644 "$srcdir/spill.toml" "$pkgdir/etc/spill/spill.toml"
  install -Dm644 "$srcdir/spill-user.toml" "$pkgdir/usr/share/spill/spill-user.toml"
}
