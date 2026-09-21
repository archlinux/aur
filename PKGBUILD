# Maintainer: HttpAnimations
pkgname=devinorium
pkgver=0.83.0
pkgrel=1
pkgdesc="Self-hosted web UI for AI coding agents - desktop client"
arch=('x86_64')
url="https://gitlab.com/HttpAnimations/devinorium"
license=('AGPL-3.0-only')
options=('!lto')
depends=('gtk3' 'glibc' 'gcc-libs' 'git')
makedepends=('cargo' 'git' 'clang' 'cmake' 'ninja' 'pkgconf' 'unzip' 'zip' 'curl')
optdepends=('openssh: clone repositories over SSH'
            'xdg-utils: open URLs from the app'
            'zenity: native file dialogs')
_flutterver=3.44.9
source=("devinorium-v$pkgver.tar.gz::https://github.com/justacalico/devinorium/releases/download/v$pkgver/devinorium-v$pkgver-source.tar.gz"
        "flutter_linux_${_flutterver}-stable.tar.xz::https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_${_flutterver}-stable.tar.xz"
        "devinorium.desktop"
        "devinorium.svg")
sha256sums=('b361a6bafcf02958648a2ac84d24340c91f7ffcd3426ad6e5647ad381d4ce8bc'
            'a9120fa4a01048bdef438ddc3a2d4b7389662ea98a95db86eeaf10382bc4efcb'
            'SKIP'
            'SKIP')

build() {
  export PATH="$srcdir/flutter/bin:$PATH"
  export PUB_CACHE="$srcdir/pub-cache"
  export CARGO_HOME="$srcdir/cargo-home"
  flutter config --no-analytics >/dev/null 2>&1 || true
  flutter precache --linux >/dev/null

  cd "$pkgname-$pkgver"
  cargo build --release --locked

  cd flutter
  flutter pub get
  flutter build linux --release
  install -Dm755 ../target/release/devinorium build/linux/x64/release/bundle/server/devinorium
}

package() {
  cd "$pkgname-$pkgver"
  install -d "$pkgdir/opt/devinorium"
  cp -a flutter/build/linux/x64/release/bundle/. "$pkgdir/opt/devinorium/"

  install -d "$pkgdir/usr/bin"
  ln -s /opt/devinorium/devinorium_frontend "$pkgdir/usr/bin/devinorium"

  install -Dm644 "$srcdir/devinorium.desktop" "$pkgdir/usr/share/applications/devinorium.desktop"
  install -Dm644 "$srcdir/devinorium.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/devinorium.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
