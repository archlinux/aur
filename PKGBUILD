# Maintainer: LIghtJUNction <https://github.com/LIghtJUNction>
pkgbase=bilibilive-git
pkgname=('bilibilive-git' 'bilibilive-obs-plugin-git')
pkgver=0.1.2.r0.g9c0f2ae
pkgrel=1
pkgdesc='Native Bilibili streaming studio following the latest Project Z sources'
arch=('x86_64' 'aarch64')
url='https://github.com/LIghtJUNction/bilibilive'
license=('GPL-3.0-only')
# Keep aws-lc/zgpui C objects linkable; Cargo retains its own thin LTO.
options=('!lto')
makedepends=('cargo' 'git' 'pkgconf' 'libx11' 'freetype2' 'fontconfig' 'libglvnd'
             'cmake' 'ninja' 'obs-studio' 'qt6-base' 'simde')
source=('bilibilive::git+https://github.com/LIghtJUNction/bilibilive.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/bilibilive"
  if git describe --long --tags --match 'v[0-9]*' >/dev/null 2>&1; then
    git describe --long --tags --match 'v[0-9]*' | sed 's/^v//;s/-/.r/;s/-/./'
  else
    printf '0.1.2.r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  fi
}

prepare() {
  cd "$srcdir/bilibilive"
  cargo update
  cargo fetch --locked
}

build() {
  cd "$srcdir/bilibilive"
  export CARGO_TARGET_DIR="$srcdir/cargo-target"
  cargo build --release --frozen
  cmake -S plugins/obs-bilibilive-pk -B "$srcdir/obs-build" -G Ninja \
    -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib
  cmake --build "$srcdir/obs-build"
}

check() {
  cd "$srcdir/bilibilive"
  export CARGO_TARGET_DIR="$srcdir/cargo-target"
  cargo test --frozen
}

package_bilibilive-git() {
  depends=('libgcc' 'glibc' 'libx11' 'freetype2' 'fontconfig' 'libglvnd')
  provides=('bilibilive')
  conflicts=('bilibilive')
  optdepends=('obs-studio: OBS WebSocket integration'
              'bilibilive-obs-plugin-git: native PK audio/video capture from OBS'
              'libdatachannel: native WebRTC media transport'
              'ffmpeg: camera capture, media decoding and preview'
              'dbus: desktop tray and Secret Service transport'
              'xorg-xwayland: native window under a Wayland desktop'
              'noto-fonts-cjk: Chinese interface glyph coverage'
              'gnome-keyring: Secret Service credential storage'
              'kwallet: alternative Secret Service credential storage')
  cd "$srcdir/bilibilive"
  install -Dm755 "$srcdir/cargo-target/release/bilibilive" "$pkgdir/usr/bin/bilibilive"
  install -Dm644 packaging/bilibilive.desktop "$pkgdir/usr/share/applications/bilibilive.desktop"
  install -Dm644 packaging/bilibilive.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/bilibilive.svg"
  install -Dm644 packaging/bilibilive.1 "$pkgdir/usr/share/man/man1/bilibilive.1"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 NOTICE "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/bilibilive/README.md"
}

package_bilibilive-obs-plugin-git() {
  pkgdesc='Native OBS PK audio/video capture for bilibilive (Git)'
  depends=('obs-studio' 'qt6-base')
  provides=('bilibilive-obs-plugin')
  conflicts=('bilibilive-obs-plugin')
  optdepends=('bilibilive-git: Bilibili PK control and native media transport')
  DESTDIR="$pkgdir" cmake --install "$srcdir/obs-build"
  install -Dm644 "$srcdir/bilibilive/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/bilibilive/NOTICE" "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
}
