# Maintainer: Donuts Delivery <support@donutsdelivery.online>
pkgname=donutstudio-bin
pkgver=0.5.2
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
# Source: published zip from the project download server (VPS serves
# DonutStudio-linux.zip as a symlink alias for Arbit-linux.zip; same SHA256).
source=("DonutStudio-linux-${pkgver}.zip::https://donutsdelivery.online/download-donutstudio/files/DonutStudio-linux.zip")
sha256sums=('b9250f01d699a1047b720ce86bf9bf748c6c189a56a14c53090ef9676251a140')

package() {
  # Standalone goes to /opt/donutstudio/. The binary inside the zip is still
  # named 'Arbit' (engine-internal codename) — that's the actual ELF executable.
  install -dm755 "${pkgdir}/opt/donutstudio"
  cp -a "${srcdir}/Arbit" "${pkgdir}/opt/donutstudio/"
  cp -a "${srcdir}/Soundfonts" "${pkgdir}/opt/donutstudio/"

  # Sandboxed plugin host (optional, only in full builds)
  if [ -f "${srcdir}/ArbitPluginHost" ]; then
    cp -a "${srcdir}/ArbitPluginHost" "${pkgdir}/opt/donutstudio/"
  fi

  # Video-helper sidecar (GPL FFmpeg/ncnn helper)
  if [ -d "${srcdir}/video-helper" ]; then
    cp -a "${srcdir}/video-helper" "${pkgdir}/opt/donutstudio/"
  fi

  # Icon (zip's icon is still ArbitIcon.svg — engine-internal filename)
  install -Dm644 "${srcdir}/ArbitIcon.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/donutstudio.svg"

  # Plugin bundles. The zip contains 'Arbit.vst3' and 'Arbit.clap' (engine-internal
  # codenames). We rename to DonutStudio.* at install time so DAWs that show the
  # bundle path see the public name, matching the Windows/macOS install scripts.
  install -dm755 "${pkgdir}/usr/lib/clap"
  install -Dm644 "${srcdir}/Arbit.clap" "${pkgdir}/usr/lib/clap/DonutStudio.clap"

  install -dm755 "${pkgdir}/usr/lib/vst3"
  cp -a "${srcdir}/Arbit.vst3" "${pkgdir}/usr/lib/vst3/DonutStudio.vst3"

  # MIDI debug plugin (developer target; same rename for consistency)
  if [ -d "${srcdir}/MIDI Debug.vst3" ]; then
    cp -a "${srcdir}/MIDI Debug.vst3" "${pkgdir}/usr/lib/vst3/MIDI Debug.vst3"
  fi

  # Bundled content (shader packs, mod presets) — placed next to the
  # standalone binary so ShaderPackEnumerator path #2 finds them.
  for content_dir in shader-packs mod-presets; do
    if [ -d "${srcdir}/${content_dir}" ]; then
      cp -a "${srcdir}/${content_dir}" "${pkgdir}/opt/donutstudio/"
    fi
  done

  # Permissions
  find "${pkgdir}/opt/donutstudio" -type d -exec chmod 755 {} +
  find "${pkgdir}/opt/donutstudio" -type f -exec chmod 644 {} +
  chmod 755 "${pkgdir}/opt/donutstudio/Arbit"
  if [ -f "${pkgdir}/opt/donutstudio/ArbitPluginHost" ]; then
    chmod 755 "${pkgdir}/opt/donutstudio/ArbitPluginHost"
  fi
  if [ -f "${pkgdir}/opt/donutstudio/video-helper/arbit-video-helper" ]; then
    chmod 755 "${pkgdir}/opt/donutstudio/video-helper/arbit-video-helper"
  fi

  # VST3 bundle permissions
  find "${pkgdir}/usr/lib/vst3/DonutStudio.vst3" -type d -exec chmod 755 {} +
  find "${pkgdir}/usr/lib/vst3/DonutStudio.vst3" -type f -exec chmod 644 {} +
  find "${pkgdir}/usr/lib/vst3/DonutStudio.vst3" -name '*.so' -exec chmod 755 {} +

  # Bitwig controller script (the zip's filename is still PureHarmony.control.js
  # at the moment; rename to DonutStudio.control.js for consistency with the
  # install scripts on Windows/macOS. The internal OSC protocol namespace stays
  # /arbit/... since the engine's BitwigBridge.cpp uses those addresses.
  install -Dm644 "${srcdir}/PureHarmony.control.js"     "${pkgdir}/usr/share/donutstudio/DonutStudio.control.js"

  # Symlink for CLI
  install -dm755 "${pkgdir}/usr/bin"
  ln -s /opt/donutstudio/Arbit "${pkgdir}/usr/bin/donutstudio"

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
