# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=huniq-git
pkgver=r59.1e4d1f2
pkgrel=1
pkgdesc="Filter out duplicates on the command line (git)"
arch=('x86_64')
url="https://github.com/koraa/huniq"
license=('BSD')
depends=('gcc-libs')
makedepends=('cargo' 'git')
source=("git+${url}"
	"cargo-lock.patch::$url/commit/e4e29e257ea7e4c5800a4980228c36003a2e5f4d.patch")
sha512sums=('SKIP'
            '83f656c63200818a7b3a7d393faf04b656fbeb35ce90524f270c92b17686899d0b851fc15c54ae3edd8ba747e7a1fd07e0a1e104109016b9e4fe6fe7bbc635fc')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${pkgname%-git}"
  patch -Np1 -i ../cargo-lock.patch
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${pkgname%-git}"
  sed -n '/Copyright/,//p' readme.md > LICENSE
  cargo build --release --frozen
}

check() {
  cd "${pkgname%-git}"
  cargo test --frozen
}

package() {
  cd "${pkgname%-git}"
  install -Dm 755 "target/release/${pkgname%-git}" -t "${pkgdir}/usr/bin"
  install -Dm 644 readme.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
