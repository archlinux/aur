# Maintainer: Gabriel <horizzon3507>
pkgname=opt
pkgver=0.1.5
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
sha256sums=('7e94a76062664925e05bb5322bb4f7f46bc30d3944ada497bd2a40368cf6a81d'
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
