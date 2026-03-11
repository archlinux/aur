# Maintainer: RgeditV1 <angelmiguelparedes@gmail.com>

pkgname=yt-dlp-linux-gui
pkgver=1.0.4
pkgrel=2
pkgdesc="A GUI for yt-dlp written in Python with CustomTkinter"
arch=("x86_64")
url="https://github.com/RgeditV1/yt-dlp-linux-gui"
license=("MIT")
depends=("tk")

# cx_Freeze Linux artifact published in GitHub Releases (tag v${pkgver})
source=(
  "YTDLP-GUI-linux.zip::https://github.com/RgeditV1/yt-dlp-linux-gui/releases/download/v${pkgver}/YTDLP-GUI-linux.zip"
  "yt-dlp-linux-gui.desktop"
)
sha256sums=("SKIP" "SKIP")

package() {
  cd "${srcdir}"

  local extract_dir="${srcdir}/_extract"
  rm -rf "${extract_dir}"
  mkdir -p "${extract_dir}"
  bsdtar -xf YTDLP-GUI-linux.zip -C "${extract_dir}"

  install -d "${pkgdir}/usr/share/${pkgname}"
  cp -r "${extract_dir}/." "${pkgdir}/usr/share/${pkgname}/"

  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${pkgname}" <<'EOF'
#!/usr/bin/env bash
set -euo pipefail
export SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt
exec /usr/share/yt-dlp-linux-gui/YTDLP-GUI "$@"
EOF

  install -Dm644 yt-dlp-linux-gui.desktop \
    "${pkgdir}/usr/share/applications/yt-dlp-linux-gui.desktop"

  install -Dm644 "${extract_dir}/img/icon.png" \
    "${pkgdir}/usr/share/pixmaps/yt-dlp-linux-gui.png"
}

