# Maintainer: MLM-stuff <gfxoxinzh@mozmail.com>
pkgname=yadaw-bin
_pkgname=yadaw
pkgver=0.10.5
_tag=v0.10.5
pkgrel=1
pkgdesc="Yet Another mini-DAW - a lightweight sfx tool in pure Rust (binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/mlm-games/yadaw"
license=('GPL3')
depends=('alsa-lib' 'libx11' 'libxcursor' 'libxinerama' 'libxrandr' 'libxi')
optdepends=(
  'pipewire-pulse: for PipeWire audio support'
  'pulseaudio: for PulseAudio audio support'
)
provides=('yadaw' 'clap-host' 'lv2-host')
conflicts=('yadaw')
options=('!strip')

source_x86_64=("${_pkgname}-${pkgver}-x86_64-unknown-linux-gnu.tar.gz::https://github.com/mlm-games/yadaw/releases/download/${_tag}/${_pkgname}-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}-aarch64-unknown-linux-gnu.tar.gz::https://github.com/mlm-games/yadaw/releases/download/${_tag}/${_pkgname}-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")

source=("icon.png::https://raw.githubusercontent.com/mlm-games/yadaw/refs/heads/master/fastlane/metadata/android/en-US/images/icon.png")

sha256sums_x86_64=('a9c8401a54460e9110c6c02c40ed03f7ce0dc5c9ae6e0713de95a3abd9086d04')
sha256sums_aarch64=('042082602339a82bf540163a4986f4591c758ee3cd896ef6f2b70f3ccb59809a')
sha256sums=('SKIP') # for icon.png

package() {
  local target
  if [[ "$CARCH" == "x86_64" ]]; then
    target="x86_64-unknown-linux-gnu"
  else
    target="aarch64-unknown-linux-gnu"
  fi

  local dir="${srcdir}/${_pkgname}-${pkgver}-${target}"
  install -Dm755 "${dir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/${_pkgname}.desktop" << DESKTOP_EOF
[Desktop Entry]
Name=YADAW
Comment=A Sfx creation tool (maybe a little more than that)
Exec=${_pkgname} %F
Icon=${_pkgname}
Terminal=false
Type=Application
Categories=AudioVideo;Audio;
MimeType=audio/midi;audio/x-midi;application/x-midi;audio/x-wav;audio/wav;audio/flac;audio/mpeg;audio/ogg;
StartupNotify=true
DESKTOP_EOF

  install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
  install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"
}
