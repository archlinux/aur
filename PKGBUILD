# Maintainer: Donuts Delivery <support@donutsdelivery.online>
pkgname=arbit-bin
pkgver=0.5.6
pkgrel=1
pkgdesc="DonutStudio (legacy codename: Arbit) — harmonic composition workstation and MIDI editor"
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
provides=('arbit' 'donutstudio')
conflicts=('donutstudio-bin')
install="${pkgname}.install"
source=("DonutStudio-linux-${pkgver}.zip::https://donutsdelivery.online/download-donutstudio/files/DonutStudio-linux.zip")
sha256sums=('5ec428fac7804bfb2111247ec334fbf72ee47d436b480cc4ca469e5bf2318d17')

package() {
  install -dm755 "${pkgdir}/opt/arbit"
  install -Dm755 "${srcdir}/DonutStudio" "${pkgdir}/opt/arbit/DonutStudio"
  install -Dm755 "${srcdir}/DonutStudio Updater" "${pkgdir}/opt/arbit/DonutStudio Updater"
  install -Dm755 "${srcdir}/ArbitPluginHost" "${pkgdir}/opt/arbit/ArbitPluginHost"
  install -Dm755 "${srcdir}/ArbitPluginScanner" "${pkgdir}/opt/arbit/ArbitPluginScanner"
  cp -a "${srcdir}/Soundfonts" "${pkgdir}/opt/arbit/"
  cp -a "${srcdir}/video-helper" "${pkgdir}/opt/arbit/"
  for content_dir in shader-packs mod-presets example-projects; do
    cp -a "${srcdir}/${content_dir}" "${pkgdir}/opt/arbit/"
  done
  install -Dm644 "${srcdir}/DonutStudio.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/arbit.svg"

  install -dm755 "${pkgdir}/usr/lib/clap"
  install -Dm755 "${srcdir}/DonutStudio.clap" "${pkgdir}/usr/lib/clap/DonutStudio.clap"

  install -dm755 "${pkgdir}/usr/lib/vst3"
  cp -a "${srcdir}/DonutStudio.vst3" "${pkgdir}/usr/lib/vst3/"

  find "${pkgdir}/opt/arbit" -type d -exec chmod 755 {} +
  find "${pkgdir}/opt/arbit" -type f -exec chmod 644 {} +
  chmod 755 "${pkgdir}/opt/arbit/DonutStudio"
  chmod 755 "${pkgdir}/opt/arbit/DonutStudio Updater"
  chmod 755 "${pkgdir}/opt/arbit/ArbitPluginHost"
  chmod 755 "${pkgdir}/opt/arbit/ArbitPluginScanner"
  chmod 755 "${pkgdir}/opt/arbit/video-helper/arbit-video-helper"

  find "${pkgdir}/usr/lib/vst3/DonutStudio.vst3" -type d -exec chmod 755 {} +
  find "${pkgdir}/usr/lib/vst3/DonutStudio.vst3" -type f -exec chmod 644 {} +
  find "${pkgdir}/usr/lib/vst3/DonutStudio.vst3" -name '*.so' -exec chmod 755 {} +

  install -Dm644 "${srcdir}/DonutStudio.control.js" "${pkgdir}/usr/share/arbit/DonutStudio.control.js"
  install -Dm644 "${srcdir}/THIRD_PARTY_LICENSES.md" "${pkgdir}/usr/share/licenses/${pkgname}/THIRD_PARTY_LICENSES.md"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s /opt/arbit/DonutStudio "${pkgdir}/usr/bin/arbit"

  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/arbit.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=Arbit
Comment=Harmonic composition workstation and MIDI editor
Exec=arbit
Icon=arbit
Categories=AudioVideo;Audio;Midi;Music;
Terminal=false
StartupNotify=true
EOF

  install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" <<'EOF'
Arbit is proprietary closed-source software by Donuts Delivery.

This package installs the official binary open beta distributed from:
https://donutsdelivery.online/download-arbit/

Use of Arbit is governed by the license terms presented by Donuts Delivery
and by any license terms displayed by the application or official website.
EOF
}
