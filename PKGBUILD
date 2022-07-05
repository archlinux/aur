# Maintainer: Jakub Jirutka <jakub@jirutka.cz>

pkgname=git-metafile
pkgver=0.2.3
pkgrel=1
pkgdesc="Store and restore files metadata in a git repository"
arch=('x86_64')
url="https://github.com/jirutka/git-metafile"
license=('MIT')
depends=('gcc-libs' 'git')
makedepends=('cargo')
source=("https://github.com/jirutka/$pkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz"
        'post-checkout'
        'pre-commit'
        'git-etc-init'
        'gitignore')
sha512sums=('147568fecd48c9e8a68777792db70c0f7b50aaa0c9d766f96cb22c7ed8f49861212c399abfc9be65e95fa341dabe6ae2bb567eb5e77a74a69db2183d0ad00e2a'
            '4bd2120071e11a8e9005491ad13ef9065cdb295eed11c3d168d511b93e3acabafc47f07b3463dd14ecd7147d41ce24dcc58eee2131c5656e8f2036eb4ab907f2'
            'af36b28793d94e0c4d73020e50346ee3dcc981082b8304a2e224207ed5c0ea6ea8a4c59e2160f20f4d08e1d94104ee102f32d07d75f96ff88454f2fecb49a074'
            'b45f9adf07bfbde958b7bdb8bfa18c18ee1d67110d8a1228c020a94cdcf8bd72e1e85714529968de6dc1a49016b5b31c30c3aff9fbcc1b6d9ccc8bf175369bce'
            '35edd88ec44f3eaadd64cb324e33f443295bf48c32b280f8aaae103c1c00df9d801c277c3987d19dbd5c71893a0504862f4f724251d81d1c404147d7d7c31abe')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked --offline
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 -t "$pkgdir"/usr/bin target/release/git-metafile
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE

  install -Dm755 -t "$pkgdir"/usr/sbin ../git-etc-init

  local sharedir="$pkgdir/usr/share/$pkgname"
  install -Dm644 -t "$sharedir" ../gitignore
  install -Dm755 -t "$sharedir"/hooks ../pre-commit
  install -Dm755 -t "$sharedir"/hooks ../post-checkout
  ln -s post-checkout "$sharedir"/hooks/post-rewrite
}
