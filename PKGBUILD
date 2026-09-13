# Maintainer: HttpAnimations
pkgname=devinorium-server
_pkgname=devinorium
pkgver=0.73.0
pkgrel=1
pkgdesc="Self-hosted web UI for AI coding agents - server"
arch=('x86_64')
url="https://gitlab.com/HttpAnimations/devinorium"
license=('AGPL-3.0-only')
options=('!lto')
depends=('glibc' 'gcc-libs')
makedepends=('cargo' 'clang' 'cmake' 'ninja' 'pkgconf')
backup=('etc/devinorium/devinorium.env')
_flutterver=3.44.9
source=("devinorium-v$pkgver.tar.gz::https://gitlab.com/HttpAnimations/devinorium/-/archive/v$pkgver/devinorium-v$pkgver.tar.gz"
        "flutter_linux_${_flutterver}-stable.tar.xz::https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_${_flutterver}-stable.tar.xz"
        "devinorium.service"
        "devinorium.sysusers"
        "devinorium.env")
sha256sums=('7b5fec0d8da47b5b5b0a32cdad180bff1313d67900212d8ddb6e3163eead0e1f'
            'a9120fa4a01048bdef438ddc3a2d4b7389662ea98a95db86eeaf10382bc4efcb'
            'SKIP'
            'SKIP'
            'SKIP')

build() {
  export PATH="$srcdir/flutter/bin:$PATH"
  export PUB_CACHE="$srcdir/pub-cache"
  export CARGO_HOME="$srcdir/cargo-home"
  flutter config --no-analytics >/dev/null 2>&1 || true
  flutter precache --web >/dev/null

  cd "$_pkgname-v$pkgver/flutter"
  flutter pub get
  flutter build web --release --wasm
  rm -rf build/web/canvaskit

  rm -rf ../frontend/dist
  mkdir -p ../frontend/dist
  cp -r build/web/. ../frontend/dist/

  cd ..
  cargo build --release --locked
}

package() {
  cd "$_pkgname-v$pkgver"
  install -Dm755 target/release/devinorium "$pkgdir/usr/bin/devinorium-server"
  install -Dm644 "$srcdir/devinorium.service" "$pkgdir/usr/lib/systemd/system/devinorium.service"
  install -Dm644 "$srcdir/devinorium.sysusers" "$pkgdir/usr/lib/sysusers.d/devinorium.conf"
  install -Dm600 "$srcdir/devinorium.env" "$pkgdir/etc/devinorium/devinorium.env"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
