# Maintainer

pkgname=fungen-bin
_pkgname=fungen
pkgver=2.2.0beta
_upstream_ver=2.2.0-beta
pkgrel=1
pkgdesc="AI-powered funscript generator"
arch=('x86_64' 'aarch64')
url="https://github.com/ack00gar/FunGen"
license=('custom')
depends=(
  'glibc'
  'gcc-libs'
  'ffmpeg4.4'
)
optdepends=(
  'ffmpeg: video/audio processing tools'
)
provides=('fungen')
conflicts=('fungen')
options=('!strip')

source_x86_64=(
  "${_pkgname}-${_upstream_ver}-linux-x86_64.tar.gz::${url}/releases/download/v${_upstream_ver}/fungen-linux-x86_64.tar.gz"
)
source_aarch64=(
  "${_pkgname}-${_upstream_ver}-linux-aarch64.tar.gz::${url}/releases/download/v${_upstream_ver}/fungen-linux-aarch64.tar.gz"
)

package() {
  local appdir="${pkgdir}/opt/fungen"

  install -d "${appdir}"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/share/pixmaps"

  # Copy extracted release contents.
  cp -a "${srcdir}/." "${appdir}/"

  # Remove makepkg source archive copies if they ended up in appdir.
  find "${appdir}" -maxdepth 1 -type f -name '*.tar.gz' -delete

  # Find the main executable robustly because upstream tar layout may change.
  local exe
  exe="$(
    find "${appdir}" -maxdepth 3 -type f -perm -111 \
      \( -iname 'fungen' -o -iname 'FunGen' -o -iname 'fungen-bin' \) |
      head -n1
  )"

  if [[ -z "${exe}" ]]; then
    echo "ERROR: Could not find FunGen executable in extracted archive." >&2
    echo "Executable files found:" >&2
    find "${appdir}" -maxdepth 3 -type f -perm -111 -print >&2
    return 1
  fi

  chmod +x "${exe}"

  # Wrapper keeps cwd near the bundled files, which many binary GUI apps expect.
  cat >"${pkgdir}/usr/bin/fungen" <<EOF
#!/usr/bin/env bash
cd "/opt/fungen"
exec "${exe#${pkgdir}}" "\$@"
EOF
  chmod 755 "${pkgdir}/usr/bin/fungen"

  # Desktop entry.
  cat >"${pkgdir}/usr/share/applications/fungen.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=FunGen
Comment=AI-powered funscript generator
Exec=fungen
Icon=fungen
Terminal=false
Categories=AudioVideo;Video;
StartupNotify=true
EOF

  # Best-effort icon install if the archive includes one.
  local icon
  icon="$(
    find "${appdir}" -maxdepth 4 -type f \
      \( -iname 'fungen.png' -o -iname 'icon.png' -o -iname '*.png' \) |
      head -n1
  )"

  if [[ -n "${icon}" ]]; then
    install -Dm644 "${icon}" "${pkgdir}/usr/share/pixmaps/fungen.png"
  fi
}
sha256sums_x86_64=('d7d3c1d233f13635abddaf5f228cb8a55ea0726b3a75077b66e4a1e3e4c3ddca')
sha256sums_aarch64=('31ce6f77f57dc9457f146367525c57e0733c26531dd6201b367dced2f0f4f4d6')
