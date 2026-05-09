# Maintainer: George Sofianos <george at sofianos dot dev>

# Release notes https://github.com/lemonade-sdk/lemonade/releases/tag/v10.4.0
pkgname=lemonade-desktop
pkgdesc="Lemonade: Local LLM Serving with GPU and NPU acceleration (GUI)"
pkgver=10.4.0
pkgrel=4
arch=('x86_64')
url='https://github.com/lemonade-sdk/lemonade/'
license=('Apache-2.0')
makedepends=('npm' 'cargo')
depends=('webkit2gtk-4.1')
optdepends=('lemonade-server')
provides=('lemonade-desktop')
options=('!strip' '!debug')

source=(
"${pkgname}-${pkgver}.tar.gz::https://github.com/lemonade-sdk/lemonade/archive/refs/tags/v${pkgver}.tar.gz"
"$pkgname.sh"
"$pkgname.desktop"
)

sha256sums=(
'55c41cbad71251d5d50b11e27cf810f641b74e16e401a6a4d06e5c3a8d77f5e6'
'e232749150095212ea3b74b798a81a16eb409443a4b57dca670cd4f38caa9f2b'
'd79018cd17fd8524f45f336d63ec86b39f3d3a8e75736cecec9f495ebdce20fa'
)

_npmargs="--cache '$srcdir/npm-cache' --no-audit --no-fund"


prepare() {
  #export RUSTUP_TOOLCHAIN=nightly
  cd $srcdir/lemonade-$pkgver/src/app  
  npm $_npmargs ci
}

build() {
  #export RUSTUP_TOOLCHAIN=nightly
  cd $srcdir/lemonade-$pkgver/src/app
  #sed -i '1i cargo-features = ["profile-rustflags", "trim-paths"]' src-tauri/Cargo.toml
  #sed -i '$a trim-paths = "all"' src-tauri/Cargo.toml
  #sed -i '$a rustflags = ["-Cdebuginfo=0", "-Zthreads=8"]' src-tauri/Cargo.toml 
  npm run tauri build -- --no-bundle
}

package() {  
  install -Dm0644 -t "$pkgdir/usr/share/applications/" "$pkgname.desktop"

  cd $srcdir/lemonade-$pkgver/src/app/
  install -Dm0755 src-tauri/target/release/lemonade-app "$pkgdir/usr/bin/$pkgname"
  install -Dm0644 assets/logo.svg "$pkgdir/usr/share/icons/$pkgname.svg"
}
