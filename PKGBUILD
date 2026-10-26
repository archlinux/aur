# Maintainer: faceless33
pkgname=cranamp
pkgver=0.1.92
pkgrel=1
pkgdesc='Music player in Rust with WSZ skins and an agent-connected Skin Studio'
arch=('x86_64' 'aarch64')
url='https://github.com/samoylenkodmitry/cranamp'
license=('Apache-2.0')
options=('!debug' '!lto')
depends=('alsa-lib' 'libgcc' 'glibc' 'hicolor-icon-theme' 'libx11' 'libxi' 'libxkbcommon-x11' 'wayland' 'vulkan-icd-loader')
optdepends=('vulkan-driver: GPU rendering' 'xdg-desktop-portal: file dialogs')
makedepends=('cargo' 'git' 'pkgconf')
source=("https://github.com/samoylenkodmitry/cranamp/releases/download/v$pkgver/cranamp-$pkgver-source.tar.gz")
sha256sums=('40f8c4396726b0ff29448a080a612eb536509bc38c2f0ca0532bc5b44238d471')
prepare() {
  cd "cranamp-$pkgver"
  cargo fetch --locked
}
build() {
  cd "cranamp-$pkgver"
  # AWS-LC compiles jitterentropy with -O0; makepkg's -O2 would override it.
  # Keep the remaining C flags, including hardening flags.
  local flag
  local native_cflags=""
  for flag in $CFLAGS; do
    case "$flag" in
      -O*) ;;
      *) native_cflags+="$flag " ;;
    esac
  done
  export CFLAGS="$native_cflags"
  cargo build --frozen --release --features store
}
package() {
  cd "cranamp-$pkgver"
  install -Dm755 target/release/cranamp "$pkgdir/usr/bin/cranamp"
  install -Dm644 platform/linux/io.cranamp.app.desktop "$pkgdir/usr/share/applications/io.cranamp.app.desktop"
  install -Dm644 assets/icon/icon-512.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/io.cranamp.app.png"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/cranamp/LICENSE"
  install -Dm644 docs/third-party/THIRD-PARTY.html "$pkgdir/usr/share/licenses/cranamp/THIRD-PARTY.html"
  install -Dm644 docs/third-party/LiberationSans-OFL-1.1.txt "$pkgdir/usr/share/licenses/cranamp/LiberationSans-OFL-1.1.txt"
}
