

pkgname=uutils-sed
pkgver=0.1.1
pkgrel=1
pkgdesc="Rust implementation of sed"
arch=('x86_64')
url=https://github.com/uutils/sed
license=('MIT')
depends=(gcc-libs)
makedepends=(rust)
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('4e8d6c2254b783d7995e9aae67e553d9cfbe11b6d391f8b32fe60b8381e9da61b2f3a83072d57159fe20676f0b4adc11e0bd26946cf04e25c618bc1fbc0aeb06')

build(){
  cd sed-$pkgver
  export RUSTFLAGS="${RUSTFLAGS} -C force-unwind-tables=no"
  [ $RUSTC_BOOTSTRAP = 1 ] && export CARGOFLAGS='-Zbuild-std=std,panic_abort --config=profile.release.panic=\"immediate-abort\" -Zpanic-immediate-abort'
  cargo build --profile=release-fast
}

package() {
  cd sed-$pkgver
  install -Dm755 target/release-fast/sed "$pkgdir"/usr/bin/uu-sed
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
