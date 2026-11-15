pkgname=rauthy
pkgver=0.37.2
pkgrel=2
pkgdesc="Single Sign-On Identity & Access Management via OpenID Connect, OAuth 2, and PAM"
arch=('x86_64' 'aarch64')
url="https://github.com/sebadob/rauthy"
license=('Apache-2.0')
depends=('argon2' 'gcc-libs' 'glibc')
makedepends=('cargo' 'cmake' 'perl')
options=('!lto' '!debug')
install=rauthy.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        'rauthy.service'
        'rauthy.sysusers'
        'rauthy.tmpfiles'
        'fido-mds-blob.jwt::https://mds.fidoalliance.org/')
sha256sums=('7623784ebaf5db642af063b7837a2341c002d595b9a54fd445e0dd556de72226'
            'a35639593940ea726dbedd774b33ef1b6bb765f58aff5d4ffbc9777df07b85a7'
            '0eea8a7bd6627522e8253d2971f01c4ddf6213e1d3b276eb9fee552fc5bdd90f'
            '9e36bd02fdb6a3a1413b83c2a0a156d34bcc87d5e43a46db01ae370339628a15'
            'SKIP')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"

  tar -xzf assets/static_html/static_v1.tar.gz
  tar -xzf assets/static_html/templates_html.tar.gz
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  if [[ $CARCH == aarch64 ]]; then
    export JEMALLOC_SYS_WITH_LG_PAGE=16
  fi
  # rauthy-data refuses release builds without the dataset and prep tool must be a debug build
  cargo run --frozen --bin fido-mds-prep -- --source "$srcdir/fido-mds-blob.jwt" --out assets/fido_mds/dataset.bin
  cargo build --frozen --release -p rauthy --bin rauthy
}

package() {
  install -Dm644 rauthy.service "$pkgdir/usr/lib/systemd/system/rauthy.service"
  install -Dm644 rauthy.sysusers "$pkgdir/usr/lib/sysusers.d/rauthy.conf"
  install -Dm644 rauthy.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/rauthy.conf"

  cd "$pkgname-$pkgver"
  install -Dm755 target/release/rauthy "$pkgdir/usr/bin/rauthy"
  install -Dm644 config.toml "$pkgdir/usr/share/doc/rauthy/config.toml.example"
}
