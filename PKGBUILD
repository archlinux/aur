# Maintainer: Twilight0 <twilight0@vivaldi.net>

pkgname=pcsx-redux-appimage
pkgver=r568.b0f54520
pkgrel=1
pkgdesc="PlayStation 1 emulator (upstream dev-channel rolling AppImage, x86_64)"
arch=('x86_64')
url="https://github.com/grumpycoders/pcsx-redux"
license=('GPL-3.0-or-later')
depends=('fuse2' 'glibc')
makedepends=('curl')
provides=('pcsx-redux')
conflicts=('pcsx-redux' 'pcsx-redux-git')
options=('!strip' '!debug')

source=("pcsx-redux-manifest.json::https://distrib.app/storage/manifests/pcsx-redux/dev-linux-x64/manifest.json")
sha256sums=('SKIP')

_manifest_base="https://distrib.app/storage/manifests/pcsx-redux/dev-linux-x64"

_latest_build_id() {
  sed -n 's/.*"id": \([0-9][0-9]*\).*/\1/p' "$1" | head -1
}

pkgver() {
  local id ver
  id="$(_latest_build_id "$srcdir/pcsx-redux-manifest.json")"
  ver="$(curl -fsSL "${_manifest_base}/manifest-${id}.json" \
    | sed -n 's/.*"version": "\([^"]*\)".*/\1/p' | head -1)"
  printf 'r%s.%s' "$id" "$ver"
}

prepare() {
  local id bm path sha1
  id="$(_latest_build_id "$srcdir/pcsx-redux-manifest.json")"
  curl -fsSL "${_manifest_base}/manifest-${id}.json" -o "$srcdir/build-${id}.json"
  bm="$srcdir/build-${id}.json"

  path="$(sed -n 's/.*"path": "\([^"]*\)".*/\1/p' "$bm" | head -1)"
  sha1="$(sed -n 's/.*"sha1": "\([^"]*\)".*/\1/p' "$bm" | head -1)"

  curl -fsSL "https://distrib.app${path}" -o "$srcdir/pcsx-redux.zip"
  echo "Verifying PCSX-Redux build ${id} (sha1)..."
  echo "${sha1}  $srcdir/pcsx-redux.zip" | sha1sum -c - >/dev/null

  bsdtar -xf "$srcdir/pcsx-redux.zip" -C "$srcdir"
  rm -f "$srcdir/pcsx-redux.zip"

  # Unpack the AppImage (no FUSE needed) to reuse upstream's icon and desktop
  # entry instead of hand-writing them.
  local appimage
  appimage="$(find "$srcdir" -maxdepth 2 -iname 'PCSX-Redux*.AppImage' | head -1)"
  chmod +x "$appimage"
  (cd "$srcdir" && "./$(basename "$appimage")" --appimage-extract >/dev/null 2>&1) || true
  rm -rf "$srcdir/squashfs-root/usr/bin" 2>/dev/null || true
}

package() {
  local appimage
  appimage="$(find "$srcdir" -maxdepth 2 -iname 'PCSX-Redux*.AppImage' | head -1)"
  if [[ -z "$appimage" ]]; then
    echo "AppImage not found in $srcdir" >&2
    return 1
  fi

  install -Dm755 "$appimage" "$pkgdir/opt/pcsx-redux/PCSX-Redux.AppImage"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/pcsx-redux" <<'EOF'
#!/bin/sh
exec /opt/pcsx-redux/PCSX-Redux.AppImage "$@"
EOF

  install -Dm644 "$srcdir/squashfs-root/pcsx-redux.desktop" \
    "$pkgdir/usr/share/applications/pcsx-redux.desktop"

  # Upstream icon is a symlink into the AppImage's hicolor tree.
  local icon
  icon="$(find "$srcdir/squashfs-root/usr/share/icons" -iname 'pcsx-redux.png' 2>/dev/null | head -1)"
  if [[ -n "$icon" ]]; then
    install -Dm644 "$icon" "$pkgdir/usr/share/icons/hicolor/256x256/apps/pcsx-redux.png"
  else
    install -Dm644 "$srcdir/squashfs-root/pcsx-redux.png" \
      "$pkgdir/usr/share/icons/hicolor/256x256/apps/pcsx-redux.png"
  fi
}
