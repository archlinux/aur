# Maintainer: Gabriel <horizzon3507>
pkgname=opt
pkgver=0.1.4
pkgrel=1
_sdkver=0.1.6
pkgdesc='Option family CLI: dispatch, doctor, install and system utilities'
arch=('x86_64')
url='https://github.com/fireflylabss/optioncli'
license=('Apache-2.0')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
options=('!lto')
source=("optioncli-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "optionSDK-$_sdkver.tar.gz::https://github.com/fireflylabss/optionSDK/archive/refs/tags/v$_sdkver.tar.gz")
sha256sums=('11434c3345a7df0e5aab3c4a4d3d8db24fcf9925302edaab02a27ff57963ee8c'
            '0b1ca7a784519f1a61656fd154eb731b27b245d41bac5de5e6dd51539dd4bdc7')

prepare() {
  # Cargo.toml depends on optionSDK via path "../optionSDK".
  ln -sfn "optionSDK-$_sdkver" optionSDK
  cd "optioncli-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "optioncli-$pkgver"
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "optioncli-$pkgver"
  install -Dm755 target/release/opt "$pkgdir/usr/bin/opt"
  install -Dm644 LICENSE                    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md                  "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 CHANGELOG.md               "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}
