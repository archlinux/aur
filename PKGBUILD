# Maintainer: Psychotoxic <psychotoxic@gmx.de>
pkgname=psysonic
pkgver=1.52.0
pkgrel=1
pkgdesc="Desktop music player for Subsonic API-compatible servers (Navidrome, Gonic, etc.)"
arch=('x86_64')
url="https://github.com/Psysonic/psysonic"
license=('GPL-3.0-only')
depends=(
  'webkit2gtk-4.1'
  'gtk3'
  'openssl'
  'alsa-lib'
  # Internet radio is the one playback path that does not go through the Rust
  # audio engine: it plays in a WebView <audio> element, so WebKitGTK decodes it
  # through GStreamer. webkit2gtk-4.1 lists these only as optdepends, which
  # pacman does not install, and without them there is no autoaudiosink at all —
  # playing a station blanks the whole window.
  'gst-plugins-good'  # autodetect (autoaudiosink) + mpg123 (MP3 stations)
  'gst-plugins-bad'   # faad (AAC / HE-AAC stations)
)
optdepends=(
  'gst-libav: additional codecs for internet radio stations'
)
makedepends=(
  'npm'
  'rust'
  'cargo'
  'clang'
  'nasm'
  'cmake'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Psysonic/psysonic/archive/refs/tags/app-v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "psysonic-app-v$pkgver"

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
  cd "psysonic-app-v$pkgver"

  # Binary (in /usr/lib to make room for the wrapper)
  install -Dm755 "src-tauri/target/release/psysonic" "$pkgdir/usr/lib/psysonic/psysonic"

  # Wrapper: thin exec (path hygiene only); GDK/session + WebKit mitigations come from main.rs / quirk (no GDK pin).
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/psysonic" <<EOF
#!/bin/sh
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
