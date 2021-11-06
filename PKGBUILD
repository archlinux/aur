# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=cargo-binstall-git
pkgver=0.4.1.r5.g8b4e779
pkgrel=1
pkgdesc="Binary installation for Rust projects (git)"
arch=('x86_64')
url="https://github.com/ryankurte/cargo-binstall"
license=('GPL3')
depends=('zlib' 'openssl' 'xz' 'bzip2')
makedepends=('rust' 'git')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("git+${url}"
        "$pkgname-tests.patch::$url/commit/4b38814f8051e4c2f45fe465c8dfbfc338e4375a.patch")
sha256sums=('SKIP'
            '6343be5f8f5d3a8264d2b02787b2107a395c5f6222cd8f06b08e9f81e2d2732c')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  cargo fetch --locked
  patch -Np1 < "../$pkgname-tests.patch"
}

build() {
  cd "${pkgname%-git}"
  cargo build --release --frozen
}

check() {
  cd "${pkgname%-git}"
  cargo test --frozen
}

package() {
  cd "${pkgname%-git}"
  install -Dm 755 "target/release/${pkgname%-git}" -t "${pkgdir}/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
