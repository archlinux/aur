# Maintainer: Adrien DUARTE <samtroulfion@proton.me>
pkgname=riptide
pkgver=0.6.1
pkgrel=1
pkgdesc='Safe rm with a graveyard (rm, list, prune, resurrect)'
arch=('x86_64' 'aarch64')
url='https://github.com/Samtroulcode/riptide'
license=('MIT' 'Apache-2.0')
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
conflicts=('rip' 'rm-improved' 'rm-improved-git' 'rm-improved-bin' 'rip2-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Samtroulcode/riptide/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7f4e75f753d04c6f006befb2ec02d732e9154a6d2cf0ae7a6e57f5f8fd2a2075')
# b2sums=('SKIP')

prepare() {
  cd "$srcdir/${pkgname}-${pkgver}"
  export CARGO_HOME="$srcdir/cargo-home"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  export CARGO_HOME="$srcdir/cargo-home"
  cargo build --frozen --release
}

check() {
  cd "$srcdir/${pkgname}-${pkgver}"
  export CARGO_HOME="$srcdir/cargo-home"
  # cargo test --frozen --all
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  install -Dm0755 target/release/rip "$pkgdir/usr/bin/rip"
  ln -sr "$pkgdir/usr/bin/rip" "$pkgdir/usr/bin/riptide"

  # Licences (désormais présentes dans l’archive)
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m0644 LICENSE* "$pkgdir/usr/share/licenses/$pkgname/"
}
