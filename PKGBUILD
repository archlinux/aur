# Maintainer: Joe Pizzimenti <joe.pizzimenti2@gmail.com>

_pkgname=eglantine
pkgname="eglantine-pgo-bin"
pkgver=0.1.0_rc4
_tag="v${pkgver//_/-}"
pkgrel=2
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
source=("${_archive}::https://github.com/Eglantine-Community/Eglantine/releases/download/${_tag}/${_archive}")
sha256sums=('6751dc2a5fab9ffd43b7c70e38b592662ad95c53b67b12110635041a4b7827df')

package() {
  install -dm755 "${pkgdir}/opt/${pkgname}"
  install -dm755 "${pkgdir}/usr/bin"

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
