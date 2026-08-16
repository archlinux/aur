# Maintainer: killab33z <killab33z @ hispagatos-dot-org>
pkgname="veilid"
pkgver=0.5.7
pkgrel=1
pkgdesc="Veilid headless node"
arch=('x86_64')
url="https://veilid.com"
license=('MPL-2.0')
makedepends=('git' 'cargo' 'protobuf')
provides=('veilid')
conflicts=('veilid' 'veilid-git' 'veiled-bin')
options=('!lto') # https://github.com/briansmith/ring/issues/1444

source=("https://gitlab.com/veilid/veilid/-/archive/v$pkgver/veilid-v$pkgver.tar.gz"
        "$pkgname-server.sysusers"
        "$pkgname-server.tmpfiles")
sha512sums=('9ce5ad34c8528783f138f3e38ab4676d5814fbc76e1cd2aa31c45c6f8e1555392a6101fb07dd888fa92bc29f0aadb0331b64053243e86180e5b79d2165040ee5'
            '7ae2ed4eac36a6bcf4ee3c52e4d0a9a331fb678899282934027e0e67765d94a543f7ad190804c771b2180339ac017b85dbc38a9b07c48b625973c53267cad9ec'
            '8e1eadfbadd34c69633388d1b4ff16b7af44bb58097a206df6d058cae2f7566dbfdb41a422b63cbcea5cd6c539f37bdab918cca3186ccfff306f546a4ae40fbd')

prepare() {
  export RUSTUP_TOOLCHAIN=stable
  cd $srcdir/$pkgname-v$pkgver
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR="$srcdir/$pkgname-v$pkgver/target"

  cd $srcdir/$pkgname-v$pkgver
  for component in server cli; do
    (cd "$pkgname-$component"
     cargo build --frozen --release
    )
  done
}

check() {
  export RUSTUP_TOOLCHAIN=stable

  cd $srcdir/$pkgname-v$pkgver
  for component in server cli; do
    (cd "$pkgname-$component"
     cargo test --frozen
    )
  done
}

package() {
  cd $srcdir/$pkgname-v$pkgver
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname-server"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname-cli"

  install -Dm0644 -t "$pkgdir/usr/lib/systemd/system/" "package/systemd/$pkgname-server.service"
  install -Dm0644 -t "$pkgdir/etc/veilid-server/" "package/linux/veilid-server.conf"
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" "LICENSE"
  install -Dm0644 "$srcdir/$pkgname-server.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname-server.conf"
  install -Dm0644 "$srcdir/$pkgname-server.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$pkgname-server.conf"
}
