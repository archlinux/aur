# Maintainer: Nils Pukropp <contact@narl.io>
pkgname=proton-stream
pkgver=2.5.1
pkgrel=1
pkgdesc="Unofficial media library for Proton Drive: browse and stream public links and your own Drive folders"
arch=('x86_64')
url="https://github.com/narrrl/proton-stream"
_repo="https://github.com/narrrl/proton-stream"
license=('MIT')
# mpv carries libmpv and its headers. WebKitGTK shows Proton's CAPTCHA at
# sign-in; libsecret keeps share secrets and the session in the keyring.
depends=('mpv' 'libsecret' 'webkit2gtk-4.1' 'libglvnd' 'libxkbcommon' 'libx11'
         'wayland' 'hicolor-icon-theme' 'gcc-libs' 'glibc')
makedepends=('cargo')
optdepends=('gnome-keyring: credential storage over the Secret Service API'
            'kwallet: credential storage over the Secret Service API')
provides=('pstr')
conflicts=('proton-stream-bin' 'proton-stream-git')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$_repo/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6b544d0de863bc4c3717cab46fdd5d634dd6dea34dfe69842b7bbf96de199325')
_srcname="proton-stream-$pkgver"

prepare() {
  cd "$_srcname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_srcname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --bin proton-stream --bin pstr
}

check() {
  cd "$_srcname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --workspace
}

package() {
  cd "$_srcname"
  install -Dm755 target/release/proton-stream "$pkgdir/usr/bin/proton-stream"
  install -Dm755 target/release/pstr "$pkgdir/usr/bin/pstr"
  install -Dm644 packaging/io.narl.proton-stream.desktop \
    "$pkgdir/usr/share/applications/io.narl.proton-stream.desktop"
  install -Dm644 packaging/io.narl.proton-stream.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.narl.proton-stream.svg"
  install -Dm644 packaging/io.narl.proton-stream.metainfo.xml \
    "$pkgdir/usr/share/metainfo/io.narl.proton-stream.metainfo.xml"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
