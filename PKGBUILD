# Maintainer: alexytomi <alexytomi101@gmail.com>
pkgname=jas-git
pkgver=0.1.0.r17.gb8613f1
pkgrel=1
pkgdesc="JAS — Jackson's App Sensei: self-hosted iOS IPA signing + install server (Leptos fullstack)"
arch=('x86_64')
url="https://github.com/jkcoxson/jas"
license=('custom:jas-noncommercial')
depends=('libimobiledevice' 'libplist')
makedepends=( 'rustup' 'openssl' 'pkgconf' 'git') # Refer to the README if you can't have OpenSSL for some reason
provides=('jas')
conflicts=('jas')

backup=('etc/jas/jas.toml')
install=jas.install

source=(
  "git+https://github.com/jkcoxson/jas.git"
  "jas_wrapper.sh"
  "jas.service"
  "jas.sysusers"
  "jas.toml"
  "jas.install"
  "LICENSE" 
)
sha512sums=(
  'SKIP'
  'aa9d0fb8d968b61b5a40bc3cfdff5b4effb3cb54c338e2bb441098de9477ae9aa03884b33686eee3bd75ed578057663765bafc4537a69e4cb35df930cac65d4b'
  'b2a8e94eba060b16bfb7d7ba0f320bd2dd2b7e6c17df6f62291e3eba94518a1b2b0a780d521796c85e42bf2af9b0b3057fb02c68b3bc83dc3389afe237b840f6'
  '00462b92cca78f67c4ee72c014547fdfeae87405a08365e6aac0560b3c868ef2deffeb3f87d473841ad26a731092952b96abd5e562f6ff141dfbd794ca133b1d'
  '4913c387c3dcc3c1f269dabd6781c9775cc827ca138b340d24204f20e77dbbeae0aacb1bc52770fa696faf75d66e45647038d7d4ca94e43b768985a4acc6ed59'
  '0725634b179b663cded9feac3791bb18f6419744e30f6f010a09e3b62b52da82c7402e95b858165efecc384509e1541d0766163893235a096e4428c9809ab3fe'
  'd3cd4f1214e92bc6f1940fdd357750791c456557abc88d2750bacb5ad30779ae0c916a66673076f035b00ab28b147571a851f387c6869f545c3f5ed73c6cfccc'
)

pkgver() {
    cd "$srcdir/jas" || exit
    local ver
    ver=$(awk -F'"' '/^version = / { print $2; exit }' Cargo.toml)
    printf "%s.r%s.g%s" \
        "$ver" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

# We don't need to use the RUSTUP_HOME, rustup's wrapper prioritized RUSTUP_HOME already but just to be safe
prepare() {
  export RUSTUP_HOME="$srcdir/rustup"
  export CARGO_HOME="$srcdir/cargo"
  rustup toolchain install stable --profile minimal
  rustup target add wasm32-unknown-unknown
  $RUSTUP_HOME/toolchains/stable-x86_64-unknown-linux-gnu/bin/cargo install --locked cargo-leptos
}

build() {
  cd "$srcdir/jas" || exit
  $RUSTUP_HOME/toolchains/stable-x86_64-unknown-linux-gnu/bin/cargo leptos build --release
}

package() {
  cd "$srcdir/jas" || exit

  install -Dm755 "$srcdir/jas_wrapper.sh" "$pkgdir/usr/bin/jas"
  install -Dm755 "$srcdir/jas/target/release/jas" "$pkgdir/usr/lib/jas/jas-bin"
  install -Dm644 "$srcdir/jas.service" "$pkgdir/usr/lib/systemd/system/jas.service"
  install -Dm644 "$srcdir/jas.sysusers" "$pkgdir/usr/lib/sysusers.d/jas.conf"
  install -Dm644 "$srcdir/jas.toml" "$pkgdir/etc/jas/jas.toml"

  install -d "$pkgdir/usr/share/jas"
  cp -ra target/site "$pkgdir/usr/share/jas/site"

  if [ -f LICENSE ]; then
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi
  if [ -f README.md ]; then
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  fi
}
