# Maintainer: Psychotoxic <psychotoxic@gmx.de>
pkgname=psysonic
pkgver=1.34.10
pkgrel=1
pkgdesc="Desktop music player for Subsonic API-compatible servers (Navidrome, Gonic, etc.)"
arch=('x86_64')
url="https://github.com/Psychotoxical/psysonic"
license=('GPL-3.0-only')
depends=(
  'webkit2gtk-4.1'
  'gtk3'
  'openssl'
  'alsa-lib'
)
makedepends=(
  'npm'
  'rust'
  'cargo'
  'clang'
  'nasm'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Psychotoxical/psysonic/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "psysonic-$pkgver"

  export CARGO_HOME="$srcdir/cargo-home"
  export npm_config_cache="$srcdir/npm-cache"

  # ring (used by reqwest → rustls-tls) ships C/asm objects whose
  # symbols (ring_core_*) lld cannot resolve.  On Arch/CachyOS, -fuse-ld=lld
  # is hardcoded into rustc itself (not just makepkg.conf RUSTFLAGS), so a
  # string substitution is a no-op.  Appending -C link-arg=-fuse-ld=bfd works
  # because the last -fuse-ld=* flag passed to cc wins.
  export RUSTFLAGS="${RUSTFLAGS} -C link-arg=-fuse-ld=bfd"

  # CachyOS sets -flto=auto in CFLAGS.  ring compiles its C/asm objects via the
  # cc crate and picks up CFLAGS, producing fat-LTO objects.  bfd cannot resolve
  # symbols from fat-LTO objects when linking against non-LTO Rust rlibs, causing
  # "undefined reference to ring_core_*" even though the symbols exist in the .a.
  # Strip CFLAGS/CXXFLAGS entirely so ring builds plain ELF objects.
  unset CFLAGS CXXFLAGS

  npm install
  npm run tauri:build -- --no-bundle
}

package() {
  cd "psysonic-$pkgver"

  # Binary (in /usr/lib to make room for the wrapper)
  install -Dm755 "src-tauri/target/release/psysonic" "$pkgdir/usr/lib/psysonic/psysonic"

  # Wrapper script that sets necessary env vars for WebKitGTK on Wayland
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/psysonic" <<EOF
#!/bin/sh
export GDK_BACKEND=x11
export WEBKIT_DISABLE_COMPOSITING_MODE=1
export WEBKIT_DISABLE_DMABUF_RENDERER=1
exec /usr/lib/psysonic/psysonic "\$@"
EOF

  # Desktop entry
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/psysonic.desktop" <<EOF
[Desktop Entry]
Name=Psysonic
Comment=Desktop music player for Subsonic API-compatible servers
Exec=psysonic
Icon=psysonic
Terminal=false
Type=Application
Categories=AudioVideo;Audio;Music;Player;
EOF

  # Icons
  install -Dm644 "src-tauri/icons/32x32.png"      "$pkgdir/usr/share/icons/hicolor/32x32/apps/psysonic.png"
  install -Dm644 "src-tauri/icons/128x128.png"    "$pkgdir/usr/share/icons/hicolor/128x128/apps/psysonic.png"
  install -Dm644 "src-tauri/icons/128x128@2x.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/psysonic.png"
}
