# Maintainer: Hewel <13846369+hewel@users.noreply.github.com>

pkgname=jellypilot
pkgver=2.2.0
pkgrel=1
pkgdesc='Jellyfin and Emby companion app with embedded MPV from the pinned mpv fork'
arch=('x86_64')
url='https://github.com/hewel/jellypilot'
license=('MIT')
# makepkg's default LTOFLAGS (-flto=auto) compile aws-lc-sys's C objects into
# GCC fat-LTO bitcode that rust-lld cannot link; keep the build non-LTO.
options=('!lto')
depends=(
  'gtk3'
  'libxkbcommon'
  'wayland'
  'ffmpeg'
  'libplacebo'
  'libass'
  'vulkan-icd-loader'
)
optdepends=(
  'mpv: External MPV Playback'
)
makedepends=(
  'git'
  'rust'
  'bun'
  'meson'
  'ninja'
  'pkgconf'
  'vulkan-headers'
  'ffmpeg'
  'libplacebo'
  'libass'
  'shaderc'
  'lcms2'
)
conflicts=('jellypilot-bin')
source=(
  "git+https://github.com/hewel/jellypilot.git#tag=v$pkgver"
  'top.pigfun.jellypilot.desktop'
)
sha256sums=(
  'SKIP'
  '24b41b6713ba0b61c5b451dedd08b3ebb72b1eda4d49eadfadffe313d9dcc0be'
)

build() {
  cd "$srcdir/$pkgname"

  bun install --frozen-lockfile
  bun run task mpv build
  bun run task iced build --release
}

package() {
  cd "$srcdir/$pkgname"

  install -Dm755 "target/release/jellypilot" "$pkgdir/usr/bin/jellypilot"
  install -Dm755 "target/embedded-mpv/lib/jellypilot/libmpv.so" \
    "$pkgdir/usr/lib/jellypilot/libmpv.so"
  install -Dm644 "target/embedded-mpv/share/jellypilot/mpv-baseline.conf" \
    "$pkgdir/usr/share/jellypilot/mpv-baseline.conf"
  install -Dm644 "$srcdir/top.pigfun.jellypilot.desktop" \
    "$pkgdir/usr/share/applications/top.pigfun.jellypilot.desktop"
  install -Dm644 "assets/icons/128x128.png" \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/top.pigfun.jellypilot.png"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
