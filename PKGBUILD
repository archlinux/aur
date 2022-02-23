# Maintainer: orhun <orhunparmaksiz@gmail.com>
# Contributor: Vlad Frolov <frolvlad@gmail.com>

# https://github.com/orhun/pkgbuilds

pkgname=cargo-workspaces
pkgver=0.2.31
pkgrel=1
pkgdesc="Cargo plugin for managing cargo workspaces and their crates"
url="https://github.com/pksunkara/cargo-workspaces"
depends=('gcc-libs' 'openssl' 'zlib')
makedepends=('cargo')
arch=('x86_64')
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/v$pkgver.tar.gz"
        "${pkgname}-fix-tests.patch::$url/commit/f6a38cdd8f974022d6faf77471f6375fcf165dae.patch"
        "${pkgname}-cargo-lock.patch::$url/commit/84c98f1baedc007e13e39a360a0b1dc6094c8bef.patch")
sha512sums=('ede610ac6ca24b9169dd6c9eb5dcd07c01508e2321947e9b9ceb31fc9ba9de54b6a5bebd4100ca4dbfd7ed225f1329c9546d953caeb3fb277c92ede4f0d33021'
            '9d94f28adcac7aacf51df708279b54b0f5a5a54d8f443267e3f677271c37885f67c35ff2eda600467435596f72b523d50115199c7ac8adca233551b005512329'
            '09b23c6934cd40634e31e8f791d82dfe55ae83f0ffa3b50d21280d0fd1ca1db85513f74735ad685831310df2a3c57b2e66f7290e27f5c6353c1b815f39ce0105')
options=('!lto')

prepare() {
  cd "${pkgname}-${pkgver}"
  patch -Np1 -i "../${pkgname}-fix-tests.patch"
  patch -Np1 -i "../${pkgname}-cargo-lock.patch"

  cd "${pkgname}"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${pkgname}-${pkgver}/${pkgname}"
  cargo build --release --frozen
}

check() {
  cd "${pkgname}-${pkgver}/${pkgname}"
  cargo test --frozen
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm 755 "${pkgname}/target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
