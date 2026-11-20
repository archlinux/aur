# Maintainer: Yuval Adam <aur@yuv.al>
pkgname=spill-git
pkgver=0.7.5.r0.g40e95c4
pkgrel=1
pkgdesc='BitTorrent client and daemon with a web interface (development version)'
arch=('x86_64' 'aarch64')
url='https://github.com/spillrs/spill'
license=('Apache-2.0')
depends=('glibc' 'libgcc' 'sqlite')
makedepends=('cargo' 'git' 'pkgconf')
provides=("spill=$pkgver")
conflicts=('spill')
# GCC LTO objects from ring cannot link with Rust's LLVM linker.
options=('!lto')
backup=('etc/spill/spill.toml')
source=("spill::git+$url.git#branch=main"
        'spill-system.service' 'spill-user.service' 'spill.sysusers'
        'spill.toml' 'spill-user.toml')
sha256sums=('SKIP'
            'fb1ad0e724ad411a5a1c7e7b9cbda8d0ea125bdcaac6c05aac0083d4c8701ce3'
            '5b65f6a5750a05135483e3d6c07ff0fa2396805c1824b7ce6b27d146b5ab16b1'
            '48eff72045dc86fc4a8ab0e45186aadef232d03a71029e74ac42b272824968e1'
            '89810c573543fc97c8fba68727f28525a112e69b0262b959e2953e98b8904d31'
            '04c011998e62b90637c6ee93fba9d235953cdf36b6a9566aad3773adf8e874c8')

pkgver() {
  cd spill
  git describe --long --tags --match 'v[0-9]*' --abbrev=7 |
    sed -E 's/^v//; s/-([0-9]+)-(g[0-9a-f]+)$/\.r\1.\2/; s/-/_/g'
}

prepare() {
  cd spill
  cargo fetch --locked --target host-tuple
}

build() {
  cd spill
  export CARGO_TARGET_DIR=target LIBSQLITE3_SYS_USE_PKG_CONFIG=1
  cargo build --frozen --release --all-features
}

check() {
  cd spill
  export CARGO_TARGET_DIR=target LIBSQLITE3_SYS_USE_PKG_CONFIG=1
  cargo test --frozen --all-features --workspace
}

package() {
  cd spill
  install -Dm755 target/release/spill "$pkgdir/usr/bin/spill"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/spill-system.service" "$pkgdir/usr/lib/systemd/system/spill.service"
  install -Dm644 "$srcdir/spill-user.service" "$pkgdir/usr/lib/systemd/user/spill.service"
  install -Dm644 "$srcdir/spill.sysusers" "$pkgdir/usr/lib/sysusers.d/spill.conf"
  install -Dm644 "$srcdir/spill.toml" "$pkgdir/etc/spill/spill.toml"
  install -Dm644 "$srcdir/spill-user.toml" "$pkgdir/usr/share/spill/spill-user.toml"
}
