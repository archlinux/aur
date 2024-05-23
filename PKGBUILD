# Maintainer: Thomas Schneider <thomas.aur@brainfuck.space>

pkgname=pg_vectorize
pkgver=0.15.0
pkgrel=1
pkgdesc="A Postgres extension that automates the transformation and orchestration of text to embeddings and provides hooks into the most popular LLMs."
arch=('x86_64')
url="https://github.com/tembo-io/pg_vectorize"
license=('MIT')
depends=('postgresql' 'pg_cron' 'pgvecto.rs-bin' 'pgmq')
makedepends=('cargo' 'postgresql-libs' 'cargo-pgrx')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6577218f9e30d37625f4f153b2fa2b18fef43fea9cd0cc328ad95cd7735add3f')

build() {
    cd "$srcdir/pg_vectorize-$pkgver/extension"
      cargo pgrx init --pg16 /usr/bin/pg_config
    cargo build --release --features pg16 --no-default-features
}

package() {
    cd "$srcdir/pg_vectorize-$pkgver/extension"

    install -Dm755 target/release/libvectorize.so "$pkgdir/usr/lib/postgresql/vectorize.so"
    install -Dm644 vectorize.control "$pkgdir/usr/share/postgresql/extension/vectorize.control"
    install -Dm644 sql/vectorize*.sql "$pkgdir/usr/share/postgresql/extension/"
}

# vim:set ts=2 sw=2 et:

