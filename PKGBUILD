# Maintainer: Vaspyyy <lolbautz2 at gmail dot com>
pkgname=fthr-clips-bin
pkgver=1.1.0alpha
pkgrel=2
_upstream_version=1.1.0-alpha
pkgdesc='Instant replay capture and clip management (official Linux binary)'
arch=('x86_64')
url='https://github.com/FTHR-Community/FTHR-Clips'
license=('GPL-3.0-only' 'MIT')
depends=('glibc' 'zlib' 'libglvnd' 'libdrm' 'libxcb' 'wayland')
makedepends=('python' 'squashfs-tools')
optdepends=(
  'pipewire-pulse: desktop audio through PipeWire'
  'pulseaudio: alternative desktop audio server'
  'grim: screenshots on supported Wayland compositors'
  'openbsd-netcat: compositor hotkey socket commands'
  'ffmpeg: clip export and video thumbnails'
  'xorg-xwayland: KDE UI fallback for the upstream native Wayland window bug'
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
sha256sums=('47634819ac68e797ca42e76c9d1fe9f465d817f937a177d75733f4a591086b1a')

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
  echo '943c78b5fd42cf82c035365c24c97faf81736a3959f0b68d1aa7d17621061c0c  squashfs-root/AppRun' | sha256sum -c -
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
  # for a fixed system location and a stable Qt/Wayland desktop identity.
  sed -e 's|^HERE=.*|HERE=/usr/lib/fthr-clips|' \
      -e 's/if \[ -n "${WAYLAND_DISPLAY:-}" \]/if [ -z "${QT_QPA_PLATFORM:-}" ] \&\& [ -n "${WAYLAND_DISPLAY:-}" ]/' \
      -e 's/elif \[ -n "${DISPLAY:-}" \]/elif [ -z "${QT_QPA_PLATFORM:-}" ] \&\& [ -n "${DISPLAY:-}" ]/' \
      -e 's|exec "$HERE/FTHRClips"|exec "$HERE/FTHRClips" -desktopfile fthr-clips|' \
      AppRun > "$pkgdir/usr/bin/fthr-clips"
  # v1.1.0-alpha has an invisible native KWin window (upstream PR #10).
  # UI-only fallback: WAYLAND_DISPLAY remains set for the capture engine.
  sed -i '/^HERE=/a\
# Remove this KDE fallback after upstream fixes its native Wayland window.\
if [ -z "${QT_QPA_PLATFORM:-}" ] \&\& [ -n "${WAYLAND_DISPLAY:-}" ]; then\
    case ":${XDG_CURRENT_DESKTOP:-}:" in\
        *:KDE:*) export QT_QPA_PLATFORM=xcb ;;\
    esac\
fi' "$pkgdir/usr/bin/fthr-clips"
  chmod 755 "$pkgdir/usr/bin/fthr-clips"
  install -Dm644 fthr-clips.desktop "$pkgdir/usr/share/applications/fthr-clips.desktop"
  sed -i -e 's/^Exec=AppRun$/Exec=fthr-clips/' -e 's/^Categories=.*/Categories=AudioVideo;Video;/' -e '/^Icon=/a StartupWMClass=FTHR Clips' "$pkgdir/usr/share/applications/fthr-clips.desktop"
  install -Dm644 fthr-clips.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/fthr-clips.png"
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  cp -a LICENSE THIRD_PARTY_NOTICES.md licenses/. "$pkgdir/usr/share/licenses/$pkgname/"
  find "$pkgdir" -type d -exec chmod 755 {} +
  chmod -R a+rX "$pkgdir/usr/lib/fthr-clips" "$pkgdir/usr/share/licenses/$pkgname"
}
