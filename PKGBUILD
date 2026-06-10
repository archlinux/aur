# Maintainer: KeychainPGP Contributors

pkgname=keychainpgp
pkgver=0.2.3
pkgrel=1
pkgdesc='Clipboard-first PGP encryption for desktop & Android'
arch=('x86_64')
url='https://github.com/KeychainPGP/keychainpgp'
license=('MIT' 'Apache-2.0')
depends=('webkit2gtk-4.1' 'gtk3' 'libsecret' 'openssl' 'libsoup3' 'glibc' 'gcc-libs' 'hicolor-icon-theme' 'glib2')
makedepends=('cargo' 'npm' 'pkgconfig' 'git')
options=('!lto')
source=("git+https://github.com/KeychainPGP/keychainpgp.git#tag=v$pkgver"
        "keychainpgp.desktop")
sha256sums=('SKIP'
            '0c592d63855dc2d45ea3f103c0245597b2cd1fe15e378580124d001b200e6bc8')

prepare() {
  cd "$pkgname"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
  
  # Install frontend dependencies
  cd crates/keychainpgp-ui/frontend
  npm ci
}

build() {
  cd "$pkgname"
  
  # Build frontend
  cd crates/keychainpgp-ui/frontend
  npm run build
  
  # Build binaries
  cd ../../..
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release -p keychainpgp-cli -p keychainpgp-ui
}

package() {
  cd "$pkgname"
  
  # Install binaries
  install -Dm0755 target/release/keychainpgp "$pkgdir/usr/bin/keychainpgp"
  install -Dm0755 target/release/keychainpgp-ui "$pkgdir/usr/bin/keychainpgp-ui"
  
  # Install desktop entry
  install -Dm0644 ../keychainpgp.desktop "$pkgdir/usr/share/applications/keychainpgp.desktop"
  
  # Install icons
  install -Dm0644 crates/keychainpgp-ui/icons/icon.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/keychainpgp.png"
  install -Dm0644 crates/keychainpgp-ui/icons/128x128.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/keychainpgp.png"
  install -Dm0644 crates/keychainpgp-ui/icons/64x64.png "$pkgdir/usr/share/icons/hicolor/64x64/apps/keychainpgp.png"
  install -Dm0644 crates/keychainpgp-ui/icons/32x32.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/keychainpgp.png"
  
  # Install licenses
  install -Dm0644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
  install -Dm0644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
