# Maintainer: chlorine3539 <undecided2448@proton.me>

pkgname=yksresults-git
# Placeholder only: pkgver() computes the real version on every build.
pkgver=0.1.0.r21.g0f6e799
pkgrel=1
pkgdesc='A TUI application to track TYT and AYT rehearsal results imported from Okulizyon HTML exports'
arch=('x86_64' 'aarch64')
url='https://github.com/chlorine3539/yksresults'
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git')
provides=('yksresults')
conflicts=('yksresults')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf '%s.r%s.g%s' \
    "$(sed -n 's/^version = "\(.*\)"/\1/p' Cargo.toml | head -n1)" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"
  cargo fetch --locked
}

build() {
  cd "$srcdir/$pkgname"
  cargo build --release --frozen --all-features
}

check() {
  cd "$srcdir/$pkgname"
  cargo test --frozen --all-features
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 target/release/yksresults "$pkgdir/usr/bin/yksresults"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
