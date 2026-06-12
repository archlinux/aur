# Maintainer: Donuts Delivery <support@donutsdelivery.online>
pkgname=arbit-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Harmonic composition workstation and MIDI editor"
arch=('x86_64')
url="https://donutsdelivery.online/arbit"
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
install="${pkgname}.install"
source=("Arbit-linux-${pkgver}.zip::https://donutsdelivery.online/download-arbit/files/Arbit-linux.zip")
sha256sums=('105776106d241d36029ed728c48abbcc0a8eb1b4256a12c5d8cd36cb38b84e95')

package() {
  install -dm755 "${pkgdir}/opt/arbit"
  cp -a "${srcdir}/Arbit" "${pkgdir}/opt/arbit/"
  cp -a "${srcdir}/Soundfonts" "${pkgdir}/opt/arbit/"
  install -Dm644 "${srcdir}/ArbitIcon.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/arbit.svg"

  install -dm755 "${pkgdir}/usr/lib/clap"
  install -Dm644 "${srcdir}/Arbit.clap" "${pkgdir}/usr/lib/clap/Arbit.clap"

  install -dm755 "${pkgdir}/usr/lib/vst3"
  cp -a "${srcdir}/Arbit.vst3" "${pkgdir}/usr/lib/vst3/"

  find "${pkgdir}/opt/arbit" -type d -exec chmod 755 {} +
  find "${pkgdir}/opt/arbit" -type f -exec chmod 644 {} +
  chmod 755 "${pkgdir}/opt/arbit/Arbit"

  find "${pkgdir}/usr/lib/vst3/Arbit.vst3" -type d -exec chmod 755 {} +
  find "${pkgdir}/usr/lib/vst3/Arbit.vst3" -type f -exec chmod 644 {} +
  find "${pkgdir}/usr/lib/vst3/Arbit.vst3" -name '*.so' -exec chmod 755 {} +

  install -Dm644 "${srcdir}/PureHarmony.control.js" "${pkgdir}/usr/share/arbit/PureHarmony.control.js"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s /opt/arbit/Arbit "${pkgdir}/usr/bin/arbit"

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
