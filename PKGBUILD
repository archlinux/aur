# Maintainer: Jochem Kuipers <jochem@kuipers.cc>

pkgname=ltbox-bin
pkgver=3.2.2
pkgrel=1
pkgdesc='Lenovo tablet firmware tool (region, root, EDL) — binary release'
arch=('x86_64' 'aarch64')
url='https://github.com/miner7222/LTBox'
license=('GPL-3.0-or-later')
depends=('systemd-libs' 'hicolor-icon-theme')
makedepends=('python')
optdepends=(
  'android-tools: optional host adb/fastboot alongside LTBox'
  'polkit: GUI-assisted udev install (not needed; rules are packaged)'
)
provides=('ltbox')
conflicts=('ltbox')
options=('!strip' '!debug')
install=ltbox-bin.install

source=(
  "51-ltbox-qcom.rules::https://raw.githubusercontent.com/miner7222/LTBox/v${pkgver}/misc/udev/51-ltbox-qcom.rules"
)
source_x86_64=(
  "LTBox-linux_x86_64-v${pkgver}.tar.gz::https://github.com/miner7222/LTBox/releases/download/v${pkgver}/LTBox-linux_x86_64-v${pkgver}.tar.gz"
)
source_aarch64=(
  "LTBox-linux_arm64-v${pkgver}.tar.gz::https://github.com/miner7222/LTBox/releases/download/v${pkgver}/LTBox-linux_arm64-v${pkgver}.tar.gz"
)
sha256sums=('0f6346cbba24fd373e3edaefb2a212412517c4f34f7600fe20df432d58acfccb')
sha256sums_x86_64=('b64085ea9fa6f5871126a71e90bdf6a914f63551f5f30eaca5f71c6f915bfb42')
sha256sums_aarch64=('064fec83312cce30ab12de05a18aa5c00e9d1f37ad1966b5480b50a128154b8d')

package() {
  local _srcdir
  case $CARCH in
    x86_64) _srcdir="LTBox-linux_x86_64-v${pkgver}" ;;
    aarch64) _srcdir="LTBox-linux_arm64-v${pkgver}" ;;
  esac

  cd "${srcdir}/${_srcdir}"

  install -Dm755 ltbox "${pkgdir}/usr/bin/ltbox"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "${srcdir}/51-ltbox-qcom.rules" \
    "${pkgdir}/usr/lib/udev/rules.d/51-ltbox-qcom.rules"

  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/io.github.miner7222.LTBox.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=LTBox
GenericName=Lenovo Tablet Flashing Tool
Comment=Region conversion, root, and EDL flashing for Lenovo tablets
Exec=/usr/bin/ltbox
Icon=io.github.miner7222.LTBox
Terminal=false
Categories=Utility;System;
StartupWMClass=io.github.miner7222.LTBox
Keywords=android;lenovo;flash;edl;root;
EOF

  # App icon is embedded in the upstream binary next to the desktop template.
  python - "${pkgdir}" <<'PY'
import sys
from pathlib import Path

pkgdir = Path(sys.argv[1])
binary = Path("ltbox").read_bytes()
start = binary.find(b"<svg")
end = binary.find(b"</svg>", start)
if start < 0 or end < 0:
    raise SystemExit("embedded LTBox SVG icon not found in binary")
icon_path = pkgdir / "usr/share/icons/hicolor/scalable/apps/io.github.miner7222.LTBox.svg"
icon_path.parent.mkdir(parents=True, exist_ok=True)
icon_path.write_bytes(binary[start : end + len(b"</svg>")])
PY
}
