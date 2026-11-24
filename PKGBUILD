# Maintainer: Nils Pukropp <contact@narl.io>
pkgname=proton-stream-git
pkgver=2.4.0.r0.g3552b97
pkgrel=1
pkgdesc="Unofficial media library for Proton Drive: browse and stream public links and your own Drive folders (git main)"
arch=('x86_64')
url="https://github.com/narrrl/proton-stream"
_repo="https://github.com/narrrl/proton-stream"
license=('MIT')
# mpv carries libmpv and its headers. WebKitGTK shows Proton's CAPTCHA at
# sign-in; libsecret keeps share secrets and the session in the keyring.
depends=('mpv' 'libsecret' 'webkit2gtk-4.1' 'libglvnd' 'libxkbcommon' 'libx11'
         'wayland' 'hicolor-icon-theme' 'gcc-libs' 'glibc')
makedepends=('cargo' 'git')
optdepends=('gnome-keyring: credential storage over the Secret Service API'
            'kwallet: credential storage over the Secret Service API')
provides=("${pkgname%-git}=$pkgver" 'pstr')
conflicts=('proton-stream' 'proton-stream-bin')
options=('!lto')
source=("$pkgname::git+$_repo.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --abbrev=7 --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf '0.0.0.r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --bin proton-stream --bin pstr
}

check() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --workspace
}

package() {
  cd "$pkgname"
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
