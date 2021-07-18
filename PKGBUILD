# Maintainer: Stephen Gregoratto <dev@sgregoratto.me>
# Contributor: Drew DeVault <sir@cmpwn.com>
pkgname=synapse-bt-git
provides=('synapse-bt')
conflicts=('synapse-bt')
pkgver=1.0.r71.352919b
pkgrel=1
pkgdesc='Lightweight bittorrent daemon'
arch=('x86_64')
url='https://synapse-bt.org'
license=('ISC')
depends=('gcc-libs')
makedepends=('cargo' 'git')
source=("$pkgname::git+https://github.com/Luminarys/synapse" synapse.service)
sha256sums=('SKIP'
            'e21042763f6c56924a3063697d641855a0900285e6c7eacc6253e1c338cb2deb')

pkgver() {
  cd "$pkgname"
  printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "$pkgname"
	RUSTUP_TOOLCHAIN=stable cargo build \
    --release \
    --all \
    --locked \
    --features="autobahn,mmap" \
    --target-dir="target"
}

check() {
  cd "$pkgname"
  RUSTUP_TOOLCHAIN=stable cargo test \
    --locked \
    --target-dir="target"
}

package() {
  install -Dm644 "$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "synapse.service" "$pkgdir/usr/lib/systemd/user/synapse.service"
  install -Dm755 "$pkgname/target/release/synapse" "$pkgdir/usr/bin/synapse"
	install -Dm755 "$pkgname/target/release/sycli" "$pkgdir/usr/bin/sycli"
}
