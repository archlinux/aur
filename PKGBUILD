# Maintainer: Hashim Karim <hashimkarim168@gmail.com>
pkgname=android-agent-lab-bin
pkgver=0.3.1
pkgrel=1
pkgdesc='Shared Android devices, scrcpy video, and visible agent cursors'
arch=('x86_64' 'aarch64')
url='https://github.com/Hashim-K/android-agent-lab'
license=('MIT')
depends=('python' 'android-tools' 'avahi' 'gtk3' 'nss' 'libxss' 'libxtst' 'xdg-utils'
         'at-spi2-core' 'util-linux-libs' 'libsecret' 'libglvnd' 'mesa' 'alsa-lib')
optdepends=('docker: bundled Android 16 emulator on x86_64'
            'docker-compose: bundled emulator orchestration')
provides=('android-agent-lab')
conflicts=('android-agent-lab')
options=('!strip' '!debug')
source_x86_64=("$url/releases/download/v$pkgver/Android-Agent-Lab-$pkgver-x64.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/Android-Agent-Lab-$pkgver-arm64.tar.gz")
sha256sums_x86_64=('13151507dee42a57470372ed4be5800637d621e80afcb8ca4a6ef689caaa5749')
sha256sums_aarch64=('ad75aa95f685a420596a67b7f39775a73ec82e3ebe577312c8e2b70f594418b3')

package() {
  local release_arch=x64
  [[ $CARCH == aarch64 ]] && release_arch=arm64
  local bundle="$pkgdir/usr/lib/android-agent-lab"
  install -d "$bundle" "$pkgdir/usr/bin"
  cp -a "Android-Agent-Lab-$pkgver-$release_arch/." "$bundle/"
  cat > "$pkgdir/usr/bin/android-agent-lab" <<'LAUNCHER'
#!/bin/sh
unset ELECTRON_RUN_AS_NODE
exec /usr/lib/android-agent-lab/android-agent-lab "$@"
LAUNCHER
  chmod 755 "$pkgdir/usr/bin/android-agent-lab"
  chmod 4755 "$bundle/chrome-sandbox"
  install -d "$pkgdir/usr/share/applications"
  cat > "$pkgdir/usr/share/applications/android-agent-lab.desktop" <<'DESKTOP'
[Desktop Entry]
Type=Application
Name=Android Agent Lab
Comment=Shared Android devices, scrcpy video, and visible agent cursors
Exec=android-agent-lab %U
Icon=android-agent-lab
Terminal=false
StartupWMClass=android-agent-lab
Categories=Development;Utility;
Keywords=Android;ADB;Emulator;scrcpy;Codex;Claude;
DESKTOP
  # Read the bundled icon without executing the release or adding an npm dependency.
  python - "$bundle/resources/app.asar" "$pkgdir" <<'PY'
import json, struct, sys
from pathlib import Path
with open(sys.argv[1], 'rb') as stream:
    stream.seek(4); data_offset = 8 + struct.unpack('<I', stream.read(4))[0]
    stream.seek(12); header_length = struct.unpack('<I', stream.read(4))[0]
    header = json.loads(stream.read(header_length))
    icon = header['files']['app']['files']['icon.png']
    stream.seek(data_offset + int(icon['offset']))
    dest = Path(sys.argv[2]) / 'usr/share/icons/hicolor/256x256/apps/android-agent-lab.png'
    dest.parent.mkdir(parents=True, exist_ok=True)
    dest.write_bytes(stream.read(icon['size']))
PY
  install -Dm644 "$bundle/resources/runtime/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
