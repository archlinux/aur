# Maintainer: Shabinder Singh <contact at shabinder dot in>
# Repackages the official AppImage (same payload as the .deb/.rpm/.pkg.tar.zst on the release page).
# Updated by scripts/desktop/release/aur-publish.sh (pkgver + sha256sums + .SRCINFO).
pkgname=soundbound-bin
pkgver=2.2.2
pkgrel=1
pkgdesc='SoundBound music player (official binary)'
arch=('x86_64' 'aarch64')
url='https://soundbound.app'
# Every bundled component's license (Arch: list them all). FFmpeg executable GPL-3.0-or-later; VLC a52/mad/faad/dca
# plugins GPL-2.0-or-later; libVLC LGPL-2.1-or-later; libidn LGPL-3.0-or-later OR GPL-2.0-or-later.
license=('LicenseRef-SoundBound-EULA' 'GPL-3.0-or-later' 'LGPL-2.1-or-later' 'GPL-2.0-or-later' 'LGPL-3.0-or-later OR GPL-2.0-or-later')
# From the payload's NEEDED sonames (scripts/desktop/build/native-payload/build-linux-packages.sh, packaging/linux/sonames.tsv).
depends=('alsa-lib' 'dbus' 'fontconfig' 'gcc-libs' 'glib2' 'glibc' 'gtk3' 'lame' 'libglvnd' 'libpulse' 'libsoup3'
         'libvorbis' 'libx11' 'libxext' 'libxi' 'libxrender' 'libxtst' 'openssl-3' 'opus' 'webkit2gtk-4.1' 'zlib')
optdepends=('desktop-file-utils: register the soundbound:// handler'
            'xdg-utils: open links in the browser'
            'mpg123: VLC MP3 decoder' 'faad2: VLC AAC decoder' 'libogg: VLC Ogg demuxer'
            'gnutls: VLC https streams' 'libmatroska: VLC MKV/WebM demuxer' 'libsamplerate: VLC resampler')
provides=('soundbound' 'soundbound-app')
conflicts=('soundbound' 'soundbound-app' 'soundbound-app-bin')
# native-image binary + bundled libVLC: stripping breaks them, there are no debug symbols to split.
options=('!strip' '!debug')
_rel="https://github.com/Shabinder/soundbound-extensions-lib/releases/download/${pkgver}"
source_x86_64=("Soundbound-${pkgver}-linux-x64.AppImage::${_rel}/Soundbound-${pkgver}-linux-x64.AppImage")
source_aarch64=("Soundbound-${pkgver}-linux-arm64.AppImage::${_rel}/Soundbound-${pkgver}-linux-arm64.AppImage")
noextract=("Soundbound-${pkgver}-linux-x64.AppImage" "Soundbound-${pkgver}-linux-arm64.AppImage")
sha256sums_x86_64=('50c6314ab6a7ffeb19dc138d6284f350c48a91a1096cc795655cf279069781fa')
sha256sums_aarch64=('7e9a829da83cd2f8db7785b7733d22a7122bb59d8d4f080d7d8beea02ef3c92d')

_ai() { case "$CARCH" in x86_64) echo x64 ;; aarch64) echo arm64 ;; esac; }

prepare() {
  local ai="Soundbound-${pkgver}-linux-$(_ai).AppImage"
  rm -rf squashfs-root
  chmod +x "$ai"
  # The runtime is static: extracting needs no FUSE. Rosetta/qemu hosts that refuse the AppImage magic can set
  # SB_UNSQUASHFS=1 to use squashfs-tools instead.
  if [ -n "${SB_UNSQUASHFS:-}" ]; then
    local off=$(( $(od -An -tu8 -j40 -N8 "$ai") + $(od -An -tu2 -j58 -N2 "$ai") * $(od -An -tu2 -j60 -N2 "$ai") ))
    unsquashfs -q -n -o "$off" -d squashfs-root "$ai" >/dev/null
  else
    "./$ai" --appimage-extract >/dev/null
  fi
}

package() {
  local r=squashfs-root
  install -d "$pkgdir/opt/soundbound" "$pkgdir/usr/bin"
  cp -a "$r/usr/bin/." "$pkgdir/opt/soundbound/"
  chmod -R u+rwX,go+rX,go-w "$pkgdir/opt/soundbound"
  # Nucleus ExecutableRuntime reads this next to the binary: the app knows pacman owns it (no self-update).
  printf 'pacman\n%s\n' "$pkgver" > "$pkgdir/opt/soundbound/.nucleus-executable-type"
  ln -s /opt/soundbound/Soundbound "$pkgdir/usr/bin/soundbound"
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/soundbound.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=Soundbound
Comment=Music player
Exec=/usr/bin/soundbound %u
Icon=soundbound
Terminal=false
Categories=AudioVideo;Audio;Player;
MimeType=x-scheme-handler/soundbound;
StartupWMClass=in-shabinder-MainKt
EOF
  install -Dm644 "$r/soundbound.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/soundbound.png"
  install -Dm644 "$r/usr/bin/lib/libidn.so.12.copyright" "$pkgdir/usr/share/licenses/$pkgname/libidn.copyright"
  install -Dm644 /dev/stdin "$pkgdir/usr/share/licenses/$pkgname/copyright" <<EOF
SoundBound ${pkgver}
Copyright (c) 2024 Shabinder Singh. All rights reserved.
License: https://soundbound.app/license/  Third-party notices: https://soundbound.app/license/third-party/
Bundled: GNU Libidn (LGPL-3.0-or-later OR GPL-2.0-or-later, see libidn.copyright), libVLC and plugins
(LGPL-2.1-or-later; a52/mad/faad/dca plugins GPL-2.0-or-later), OpenJDK runtime libraries
(GPL-2.0 WITH Classpath-exception-2.0), FFmpeg executable (GPL-3.0-or-later).
EOF
}
