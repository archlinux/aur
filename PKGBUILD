# Maintainer: Naho <naho@users.noreply.github.com>
pkgname=flux-downloader-bin
pkgver=0.1.3
pkgrel=1
pkgdesc="A modern, fast YouTube downloader built with Tauri"
arch=('x86_64')
url="https://github.com/eoNaho/flux-downloader"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'libsoup3' 'libappindicator-gtk3' 'ffmpeg' 'yt-dlp')
provides=('flux-downloader')
conflicts=('flux-downloader')
source=("https://github.com/eoNaho/flux-downloader/releases/download/v${pkgver}/fluxdownloader_${pkgver}_amd64.deb")
sha256sums=('b23bab18a3e79cfd1a981c2f6998793b8c91a6b1469e8527c5c5d7af8da03761')

package() {
  bsdtar -xf "${srcdir}/data.tar"* -C "${pkgdir}/"

  # Remove bundled binaries that conflict with system packages
  rm -f "${pkgdir}/usr/bin/ffmpeg"
  rm -f "${pkgdir}/usr/bin/ffprobe"
  rm -f "${pkgdir}/usr/bin/yt-dlp"

  # Rename the original binary
  mv "${pkgdir}/usr/bin/flux-downloader" "${pkgdir}/usr/bin/flux-downloader.bin"

  # Create wrapper script that handles Wayland/NVIDIA compatibility
  cat > "${pkgdir}/usr/bin/flux-downloader" << 'EOF'
#!/bin/bash
# Workaround for WebKitGTK blank screen on Wayland + NVIDIA
if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
  export WEBKIT_DISABLE_DMABUF_RENDERER=1
fi
exec /usr/bin/flux-downloader.bin "$@"
EOF
  chmod 755 "${pkgdir}/usr/bin/flux-downloader"
}
