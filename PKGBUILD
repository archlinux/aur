# Maintainer: Donuts Delivery <support@donutsdelivery.online>
pkgname=donutstudio-bin
pkgver=0.5.6
pkgrel=1
pkgdesc="DonutStudio — harmonic composition workstation and MIDI editor (just-intonation native)"
arch=('x86_64')
url="https://donutsdelivery.online/donutstudio"
license=('custom')
depends=(
  'alsa-lib'
  'freetype2'
  'gcc-libs'
  'glibc'
  'hicolor-icon-theme'
  'libx11'
  'libxcursor'
  'libxinerama'
  'libxrandr'
  'mesa'
)
optdepends=(
  'bitwig-studio: use the bundled Bitwig controller script'
  'xdg-utils: desktop integration helpers'
)
options=('!strip')
provides=('donutstudio')
conflicts=('donutstudio')
install="${pkgname}.install"
source=("DonutStudio-linux-${pkgver}.zip::https://donutsdelivery.online/download-donutstudio/files/DonutStudio-linux.zip")
sha256sums=('5ec428fac7804bfb2111247ec334fbf72ee47d436b480cc4ca469e5bf2318d17')

package() {
  install -dm755 "${pkgdir}/opt/donutstudio"
  install -Dm755 "${srcdir}/DonutStudio" "${pkgdir}/opt/donutstudio/DonutStudio"
  install -Dm755 "${srcdir}/DonutStudio Updater" "${pkgdir}/opt/donutstudio/DonutStudio Updater"
  install -Dm755 "${srcdir}/ArbitPluginHost" "${pkgdir}/opt/donutstudio/ArbitPluginHost"
  install -Dm755 "${srcdir}/ArbitPluginScanner" "${pkgdir}/opt/donutstudio/ArbitPluginScanner"
  cp -a "${srcdir}/Soundfonts" "${pkgdir}/opt/donutstudio/"
  cp -a "${srcdir}/video-helper" "${pkgdir}/opt/donutstudio/"

  for content_dir in shader-packs mod-presets example-projects; do
    cp -a "${srcdir}/${content_dir}" "${pkgdir}/opt/donutstudio/"
  done

  install -Dm644 "${srcdir}/DonutStudio.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/donutstudio.svg"

  install -dm755 "${pkgdir}/usr/lib/clap"
  install -Dm755 "${srcdir}/DonutStudio.clap" "${pkgdir}/usr/lib/clap/DonutStudio.clap"

  install -dm755 "${pkgdir}/usr/lib/vst3"
  cp -a "${srcdir}/DonutStudio.vst3" "${pkgdir}/usr/lib/vst3/DonutStudio.vst3"

  # MIDI debug plugin (developer target; same rename for consistency)
  if [ -d "${srcdir}/MIDI Debug.vst3" ]; then
    cp -a "${srcdir}/MIDI Debug.vst3" "${pkgdir}/usr/lib/vst3/MIDI Debug.vst3"
  fi

  # Permissions
  find "${pkgdir}/opt/donutstudio" -type d -exec chmod 755 {} +
  find "${pkgdir}/opt/donutstudio" -type f -exec chmod 644 {} +
  chmod 755 "${pkgdir}/opt/donutstudio/DonutStudio"
  chmod 755 "${pkgdir}/opt/donutstudio/DonutStudio Updater"
  chmod 755 "${pkgdir}/opt/donutstudio/ArbitPluginHost"
  chmod 755 "${pkgdir}/opt/donutstudio/ArbitPluginScanner"
  chmod 755 "${pkgdir}/opt/donutstudio/video-helper/arbit-video-helper"

  # VST3 bundle permissions
  find "${pkgdir}/usr/lib/vst3/DonutStudio.vst3" -type d -exec chmod 755 {} +
  find "${pkgdir}/usr/lib/vst3/DonutStudio.vst3" -type f -exec chmod 644 {} +
  find "${pkgdir}/usr/lib/vst3/DonutStudio.vst3" -name '*.so' -exec chmod 755 {} +

  install -Dm644 "${srcdir}/DonutStudio.control.js" "${pkgdir}/usr/share/donutstudio/DonutStudio.control.js"
  install -Dm644 "${srcdir}/THIRD_PARTY_LICENSES.md" "${pkgdir}/usr/share/licenses/${pkgname}/THIRD_PARTY_LICENSES.md"

  # Symlink for CLI
  install -dm755 "${pkgdir}/usr/bin"
  ln -s /opt/donutstudio/DonutStudio "${pkgdir}/usr/bin/donutstudio"

  # Desktop file
  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/donutstudio.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=DonutStudio
Comment=DonutStudio — harmonic composition workstation and MIDI editor
Exec=donutstudio
Icon=donutstudio
Categories=AudioVideo;Audio;Midi;Music;
Terminal=false
StartupNotify=true
EOF

  # License
  install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" <<'EOF'
DonutStudio is proprietary closed-source software by Donuts Delivery.

This package installs the official binary open beta distributed from:
https://donutsdelivery.online/download-donutstudio/

Use of DonutStudio is governed by the license terms presented by Donuts Delivery
and by any license terms displayed by the application or official website.
EOF
}
