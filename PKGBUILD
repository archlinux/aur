# Maintainer: Joe Pizzimenti <joe.pizzimenti2@gmail.com>

_pkgname=eglantine
pkgname="eglantine-pgo-bin"
pkgver=0.1.0_rc4
_tag="v${pkgver//_/-}"
pkgrel=4
pkgdesc="The Eglantine Nintendo Switch 2 emulator binary (PGO build)."
arch=('x86_64')
url="https://github.com/Eglantine-Community/Eglantine"
license=('GPL-3.0-or-later')
depends=('alsa-lib' 'hicolor-icon-theme' 'libdrm' 'libpulse' 'libusb' 'libva' 'libvdpau' 'libxkbcommon' 'libx11' 'opus' 'qt6-base' 'qt6-charts' 'vulkan-icd-loader' 'xcb-util-cursor' 'xcb-util-image' 'xcb-util-keysyms' 'xcb-util-renderutil' 'xcb-util-wm')
makedepends=('boost' 'cmake' 'git' 'glslang' 'nasm' 'ninja' 'patchelf' 'pkgconf' 'qt6-tools' 'spirv-headers' 'spirv-tools' 'vulkan-headers')
conflicts=('eglantine' 'eglantine-bin' 'eglantine-daily-pgo-bin' 'eglantine-git')
provides=('eglantine')
options=(!strip)

_archive="${_pkgname}-linux-x86_64-pgo.tar.gz"
source=(
    "${_archive}::https://github.com/Eglantine-Community/Eglantine/releases/download/${_tag}/${_archive}"
    "dev.eglantine.eglantine.desktop::https://raw.githubusercontent.com/Eglantine-Community/Eglantine/nx2/dist/dev.eglantine.eglantine.desktop"
    "dev.eden_emu.eden.svg::https://raw.githubusercontent.com/Eglantine-Community/Eglantine/nx2/dist/dev.eden_emu.eden.svg"
)
sha256sums=('6751dc2a5fab9ffd43b7c70e38b592662ad95c53b67b12110635041a4b7827df'
            'fc112e7ab1d405045c72ea8ea748c781ab570c82016a733fbd9ccaebf43214b7'
            'cfb13fb470acc7b45bc8708ff2839c9ff85dbf711166b3009d1c3d716b3f8c5a')

package() {
  install -dm755 "${pkgdir}/opt/${pkgname}"
  install -dm755 "${pkgdir}/usr/bin"
  install -dm755 "${pkgdir}/usr/share/applications"
  install -dm755 "${pkgdir}/usr/share/icons/hicolor/scalable/apps"

  install -Dm755 "${srcdir}/eglantine" "${pkgdir}/opt/${pkgname}/eglantine"
  if [ -f "${srcdir}/eden-cli" ]; then
    install -Dm755 "${srcdir}/eden-cli" "${pkgdir}/opt/${pkgname}/eden-cli"
  fi

  # Fix upstream hardcoded GitHub runner RPATH so it looks in system libraries
  if command -v patchelf &>/dev/null; then
    patchelf --set-rpath '/usr/lib' "${pkgdir}/opt/${pkgname}/eglantine"
    [ -f "${pkgdir}/opt/${pkgname}/eden-cli" ] && patchelf --set-rpath '/usr/lib' "${pkgdir}/opt/${pkgname}/eden-cli"
  fi

  ln -s "/opt/${pkgname}/eglantine" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "${srcdir}/dev.eglantine.eglantine.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  sed -i "s|^Exec=.*|Exec=/usr/bin/${_pkgname} %U|" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  install -Dm644 "${srcdir}/dev.eden_emu.eden.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/dev.eglantine.eglantine.svg"
}

post_install() {
  update-desktop-database -q /usr/share/applications
  gtk-update-icon-cache -q -t -f /usr/share/icons/hicolor || true
}

post_upgrade() {
  post_install
}

post_remove() {
  post_install
}
