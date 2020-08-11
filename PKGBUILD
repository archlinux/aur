# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=pngcrypt
pkgver=0.1.0+r4+ge3c04ee
_commit=e3c04eec83858bb614f3213fcff49e9c55f7bb75
pkgrel=1
pkgdesc='Utility to store encrypted data inside a PNG'
arch=(x86_64)
url=https://github.com/youssefhabri/pngcrypt
license=(custom)
depends=(gcc-libs)
makedepends=(git cargo)
source=(git+$url#commit=$_commit)
sha512sums=('SKIP')

pkgver() {
  cd $pkgname
  echo $(grep '^version =' Cargo.toml | head -n1 | cut -d\" -f2 | sed s/-/+/)+r$(git rev-list --count HEAD)+g$(git describe --always)
}

build() {
  cd $pkgname
  sed '13a\    #[macro_export]' -i src/lib.rs
  cargo build --release --locked
}

package() {
  cd $pkgname
  install -D target/release/encrypt "$pkgdir"/usr/bin/pngencrypt
  install -D target/release/decrypt "$pkgdir"/usr/bin/pngdecrypt
}
