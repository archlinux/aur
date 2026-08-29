pkgname=test-yourself
pkgver=4.0.3
pkgrel=1
pkgdesc="A modern, highly-polished quiz and testing application"
arch=('x86_64')
url="https://github.com/albibenni/test-yourself"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'cairo' 'glib2' 'pango' 'gdk-pixbuf2' 'libayatana-appindicator' 'libsodium')
makedepends=('cargo' 'nodejs' 'npm' 'pnpm' 'pkgconf')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://github.com/albibenni/test-yourself/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$pkgname-$pkgver"
  
  # Arch's newest makepkg.conf adds -flto=auto which breaks rustc's LLVM linker.
  export CFLAGS="$(echo $CFLAGS | sed 's/-flto=auto//g' | sed 's/-flto//g')"
  export CXXFLAGS="$(echo $CXXFLAGS | sed 's/-flto=auto//g' | sed 's/-flto//g')"
  export LDFLAGS="$(echo $LDFLAGS | sed 's/-flto=auto//g' | sed 's/-flto//g')"
  
  export CARGO_PROFILE_RELEASE_LTO="false"
  export RUSTUP_TOOLCHAIN=stable
  
  # Force libsodium-sys to dynamically link against Arch's native libsodium!
  export SODIUM_USE_PKG_CONFIG=1
  
  pnpm install
  
  # We append || true because Tauri will panic at the very end when it tries 
  # to sign the auto-updater artifact without your private GitHub keys. 
  # We don't care about the auto-updater in Arch, and the DEB is successfully built before the panic!
  pnpm tauri build -b deb || true
}

package() {
  cd "$pkgname-$pkgver"
  cp -r src-tauri/target/release/bundle/deb/*/data/usr "$pkgdir/"
  
  # Ensure the desktop file passes the URI to the app via %u
  find "$pkgdir/usr/share/applications" -name "*.desktop" -exec sed -i 's/^Exec=\(.*\)$/Exec=\1 %u/' {} +
}
