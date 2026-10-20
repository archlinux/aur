# Maintainer: Lucas Oskorep <lucas.oskorep@gmail.com>
pkgname=insta360-link-controller-bin
_pkgname=insta360-link-controller
pkgver=0.1.0
pkgrel=1
pkgdesc="Pure-Rust cross-platform controller suite (GUI, CLI, HTTP/WS server) for Insta360 Link webcams"
arch=(x86_64 aarch64)
url="https://github.com/lucasoskorep/insta360-link-controller"
license=(MIT Apache-2.0)
depends=(
  glibc
  gcc-libs
  ffmpeg
  libxkbcommon
)
provides=(insta360-link-controller)
conflicts=(insta360-link-controller)
options=(!strip)

source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/lucasoskorep/insta360-link-controller/releases/download/v${pkgver}/insta360-link-controller-v${pkgver}-linux-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/lucasoskorep/insta360-link-controller/releases/download/v${pkgver}/insta360-link-controller-v${pkgver}-linux-arm64.tar.gz")

sha256sums_x86_64=(9e566a07fe5a1874758fe139deea82b54d71b25e4eaa075f8036bab9fa522756)
sha256sums_aarch64=(1d491fd659462e14bbf217a1c870b945bab42b1991425a12cfada7b3b32a5343)

package() {
  local _arch_suffix
  if [[ "${CARCH}" == "aarch64" ]]; then
    _arch_suffix="linux-arm64"
  else
    _arch_suffix="linux-x86_64"
  fi
  local _ extracted_dir="${srcdir}/insta360-link-controller-v${pkgver}-${_arch_suffix}"

  install -Dm755 "${extracted_dir}/insta360-link-gui" "${pkgdir}/usr/bin/insta360-link-gui"
  install -Dm755 "${extracted_dir}/insta360-link-ctl" "${pkgdir}/usr/bin/insta360-link-ctl"
  install -Dm755 "${extracted_dir}/insta360-link-server" "${pkgdir}/usr/bin/insta360-link-server"
  install -Dm644 "${extracted_dir}/udev/99-insta360-link.rules" "${pkgdir}/usr/lib/udev/rules.d/99-insta360-link.rules"
  install -Dm644 "${extracted_dir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -dm755 "${pkgdir}/usr/share/applications"
  cat > "${pkgdir}/usr/share/applications/insta360-link-controller.desktop" << DESKTOP
[Desktop Entry]
Name=Insta360 Link Controller
Comment=Hardware controller and live preview for Insta360 Link webcams
Exec=/usr/bin/insta360-link-gui
Icon=camera-web
Terminal=false
Type=Application
Categories=AudioVideo;Video;HardwareSettings;
DESKTOP
}
