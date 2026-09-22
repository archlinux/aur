# Maintainer: HttpAnimations
pkgname=devinorium-server-git
_pkgname=devinorium
pkgver=0.85.0.r0.ge3e7ccc
pkgrel=1
pkgdesc="Self-hosted web UI for AI coding agents - server (git build)"
arch=('x86_64')
url="https://gitlab.com/HttpAnimations/devinorium"
license=('AGPL-3.0-only')
options=('!lto')
depends=('glibc' 'gcc-libs' 'git')
makedepends=('cargo' 'git' 'unzip' 'zip' 'curl')
optdepends=('openssh: clone repositories over SSH')
provides=('devinorium-server')
conflicts=('devinorium-server')
backup=('etc/devinorium/devinorium.env')
_flutterver=3.44.9
source=("git+https://gitlab.com/HttpAnimations/devinorium.git"
        "flutter_linux_${_flutterver}-stable.tar.xz::https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_${_flutterver}-stable.tar.xz"
        "devinorium.service"
        "devinorium.sysusers"
        "devinorium.env")
sha256sums=('SKIP'
            'a9120fa4a01048bdef438ddc3a2d4b7389662ea98a95db86eeaf10382bc4efcb'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd "$_pkgname"
  local ver
  ver=$(git describe --long --tags 2>/dev/null || true)
  if [ -n "$ver" ]; then
    printf '%s' "$ver" | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  else
    printf '0.0.0.r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  fi
}

build() {
  export PATH="$srcdir/flutter/bin:$PATH"
  export PUB_CACHE="$srcdir/pub-cache"
  export CARGO_HOME="$srcdir/cargo-home"
  flutter config --no-analytics >/dev/null 2>&1 || true
  flutter precache --web >/dev/null

  cd "$_pkgname/flutter"
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
  cd "$_pkgname"
  install -Dm755 target/release/devinorium "$pkgdir/usr/bin/devinorium-server"
  install -Dm644 "$srcdir/devinorium.service" "$pkgdir/usr/lib/systemd/system/devinorium.service"
  install -Dm644 "$srcdir/devinorium.sysusers" "$pkgdir/usr/lib/sysusers.d/devinorium.conf"
  install -Dm600 "$srcdir/devinorium.env" "$pkgdir/etc/devinorium/devinorium.env"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
