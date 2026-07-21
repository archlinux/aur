# Maintainer: ~grassblock <i [at] gb0 [dot] dev>

pkgname=xsz
pkgver=0.5.2
pkgrel=1
pkgdesc="a compsize rewrite with multithread support"
url="https://github.com/SaltyKitkat/xsz"
arch=(x86_64)
license=(GPL-2.0)
provides=(xsz)
replaces=(xsz)
conflicts=(xsz)
depends=(libgcc # libgcc_s.so
         glibc # libc.so libm.so
         )
makedepends=(cargo)
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('f30b1035963aa3d3b82ffc3d833275e4d3a8825b0a25f6cd4922d4d4fda1e4a7')
b2sums=('54967f9c2661024590cf26ca5fb3f4d836d163ee56fa2b1a9759c04494c9fd634f588b2ecd3258b49eea8b72461f3cb449a899ea7f7658dbcc9da7bbe6808015')

prepare() {
  cd "${pkgname}-${pkgver}"
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "${pkgname}-${pkgver}"
  CFLAGS+=' -ffat-lto-objects'
  cargo build --frozen --release
}

check() {
  cd "${pkgname}-${pkgver}"
  cargo test --frozen
}


package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

# vim: ts=2 sw=2 et:
