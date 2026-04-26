# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=pijul
pkgver=1.0.0.beta.11
_pkgver=${pkgver/.beta/-beta}
pkgrel=1
pkgdesc='A sound and fast distributed version control system'
arch=(x86_64)
url='https://pijul.org'
license=(GPL-2.0-or-later)
depends=(
  glibc
  libgcc
  zstd
  openssl
  libgit2
  libsodium
  dbus
)
makedepends=(
  rust
  clang
)
options=(!lto)
source=(
  "$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$_pkgver.crate"
  fix-rand-0.9-sanakirja-imports.patch
  fix-deprecated-function-warning.patch
)
sha512sums=('272e9c7f036ad53da0026d480189b403b0590be27a0e0be96d4935910bbbe1fe4c55f7b4ead4cf3ff4d5f3da3dacfedb120d6c8f5b612cf15e03900e0992581c'
            '8fd87cb72233735cf899625f526ec48a63b14a93bed23d1c3d034c4b718fbbdd3028c0b3b8897284379daefea81e59390aee6370260c80212a1481fb6c1713c1'
            '312908dddf9a261674a2d0fe9c1b92de993bd78195d206bf5830c58dea6f410bb34aa1cec118b977d24b3edcb2c6b01223cab009ab4037b06edc0d235e02a2af')
b2sums=('0c8cae11d452a03e957ca3202ef5126a7c8a468d831e5334fa694f100ce4d0c899596e2106080c627f559be62a3887c8e47e7a3ca2873bc3b03fb8aa567837b6'
        '14c5ac8ba10dfa435c47c425136b56ba141ddcc4a9b1780e5ac2227ac525794cafa55db01fee7b8e527046793f3d39a96aec4135cb62c9ec98f153480260ba31'
        '4c13f3941d84a87ddf28df776e1d6cf34be8a865b0bb9b89829904b737032b0291713ff74949cc18671dbb52aac783abe149d11a6a3ea947e515bee34b310a85')

prepare() {
  cd "$pkgname-$_pkgver"

  # beta9 -> beta11
  patch -p1 -i "$srcdir/fix-rand-0.9-sanakirja-imports.patch"

  patch -p1 -i "$srcdir/fix-deprecated-function-warning.patch"

  cargo fetch --locked --target host-tuple
}

build() {
  cd "$pkgname-$_pkgver"

  cargo build --release --frozen --all-features
}

package() {
  cd "$pkgname-$_pkgver"

  install -vDm755 -t "$pkgdir/usr/bin" "target/release/$pkgname"
}
