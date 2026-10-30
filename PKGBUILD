# Maintainer: Vaspyyy <lolbautz2 at gmail dot com>
pkgname=fthr-clips-bin
pkgver=1.1.3alpha
pkgrel=1
_upstream_version=1.1.3-alpha
pkgdesc='Instant replay capture and clip management (official Linux binary)'
arch=('x86_64')
url='https://github.com/FTHR-Community/FTHR-Clips'
license=('GPL-3.0-only' 'MIT')
depends=('glibc' 'gcc-libs' 'zlib' 'libglvnd' 'libdrm' 'libxcb' 'wayland')
makedepends=('python' 'squashfs-tools')
optdepends=(
  'pipewire: ScreenCast portal capture server and runtime library'
  'dbus: ScreenCast portal communication'
  'xdg-desktop-portal: ScreenCast capture broker'
  'xdg-desktop-portal-kde: ScreenCast picker/backend for KDE Plasma'
  'pipewire-pulse: desktop audio through PipeWire'
  'pulseaudio: alternative desktop audio server'
  'grim: screenshots on supported Wayland compositors'
  'openbsd-netcat: compositor hotkey socket commands'
  'ffmpeg: clip export and video thumbnails'
  'xdg-utils: open the clips folder'
  'libva-mesa-driver: AMD VA-API encoding'
  'nvidia-utils: NVIDIA NVENC encoding (upstream unqualified)'
  'xdotool: X11 window detection'
  'xorg-xprop: X11 fullscreen detection'
  'xorg-xrandr: native X11 monitor geometry'
)
provides=("fthr-clips=$pkgver")
conflicts=('fthr-clips')
options=('!strip' '!debug')
source=("FTHRClips-${_upstream_version}-x86_64.AppImage::https://github.com/FTHR-Community/FTHR-Clips/releases/download/v${_upstream_version}/FTHRClips-${_upstream_version}-x86_64.AppImage")
noextract=("FTHRClips-${_upstream_version}-x86_64.AppImage")
sha256sums=('d44ffafcbc30efbd8342c739f699bde711cf2fdef687d6487229cc0bb02ecc33')

prepare() {
  # Read the ELF boundary without executing the downloaded AppImage runtime.
  local _offset
  _offset=$(python - "${noextract[0]}" <<'PY'
import struct, sys
with open(sys.argv[1], 'rb') as f:
    header = f.read(64)
    assert header[:6] == b'\x7fELF\x02\x01' and header[8:11] == b'AI\x02'
    offset = struct.unpack_from('<Q', header, 40)[0]
    size, count = struct.unpack_from('<HH', header, 58)
    offset += size * count
    f.seek(offset)
    assert f.read(4) == b'hsqs', 'AppImage layout changed; review required'
    print(offset)
PY
  )
  rm -rf squashfs-root
  unsquashfs -no-progress -d squashfs-root -o "$_offset" "${noextract[0]}"
  # Fail closed on launcher/layout changes: a new release needs review.
  echo 'faed271eaf6378d98c8bf503a36d20582391e8fb4ba4e11d25557dfc2b4ed185  squashfs-root/AppRun' | sha256sum -c -
  python - <<'PY'
from pathlib import Path
import stat
root = Path('squashfs-root').resolve()
assert {p.name for p in root.iterdir()} == {
    'AppRun', 'FTHRClips', '_internal', 'LICENSE', 'THIRD_PARTY_NOTICES.md',
    'licenses', 'fthr-clips.desktop', 'fthr-clips.png', '.DirIcon'}
for name in ('FTHRClips', '_internal/FTHRclips',
             '_internal/plugin-packages/FTHR-Uploader-linux.fthrplugin',
             'licenses/MIT.txt', 'licenses/FTHR-GENERATED-ASSETS.txt'):
    assert (root / name).is_file(), f'Missing upstream component: {name}'
for p in root.rglob('*'):
    mode = p.lstat().st_mode
    assert not mode & 0o6000, f'Privileged permission: {p}'
    assert stat.S_ISREG(mode) or stat.S_ISDIR(mode) or stat.S_ISLNK(mode), p
    if p.is_symlink():
        assert p.resolve().is_relative_to(root) and p.exists(), f'Unsafe symlink: {p}'
PY
}

package() {
  cd squashfs-root
  install -d "$pkgdir/usr/lib/fthr-clips" "$pkgdir/usr/bin"
  cp -a FTHRClips _internal "$pkgdir/usr/lib/fthr-clips/"
  # Preserve PyInstaller's relative runtime tree. Adapt upstream's tiny launcher
  # (which already honours a preset QT_QPA_PLATFORM) for a fixed system location
  # and a stable Qt/Wayland desktop identity.
  sed -e 's|^HERE=.*|HERE=/usr/lib/fthr-clips|' \
      -e 's|exec "$HERE/FTHRClips"|exec "$HERE/FTHRClips" -desktopfile fthr-clips|' \
      AppRun > "$pkgdir/usr/bin/fthr-clips"
  chmod 755 "$pkgdir/usr/bin/fthr-clips"
  install -Dm644 fthr-clips.desktop "$pkgdir/usr/share/applications/fthr-clips.desktop"
  # Since 1.1.3-alpha upstream ships our former Categories/StartupWMClass fixes.
  sed -i 's/^Exec=AppRun$/Exec=fthr-clips/' "$pkgdir/usr/share/applications/fthr-clips.desktop"
  install -Dm644 fthr-clips.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/fthr-clips.png"
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  cp -a LICENSE THIRD_PARTY_NOTICES.md licenses/. "$pkgdir/usr/share/licenses/$pkgname/"
  find "$pkgdir" -type d -exec chmod 755 {} +
  chmod -R a+rX "$pkgdir/usr/lib/fthr-clips" "$pkgdir/usr/share/licenses/$pkgname"
}
