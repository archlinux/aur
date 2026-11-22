# Maintainer: agony <27015 at riseup dot net>

pkgname=kirocrew-bin
pkgver=0.13.1
pkgrel=1
pkgdesc='Persistent workspace for development work that self-improves across sessions (prebuilt)'
arch=('x86_64' 'aarch64')
url='https://github.com/kirodotdev/KiroCrew'
license=('Apache-2.0')
depends=('alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'expat' 'glib2' 'glibc' 'gtk3' 'libcups'
         'libgcc' 'libstdc++' 'libx11' 'libxcb' 'libxcomposite' 'libxcrypt-compat' 'libxdamage'
         'libxext' 'libxfixes' 'libxkbcommon' 'libxrandr' 'lsof' 'mesa' 'nspr' 'nss' 'pango'
         'systemd-libs' 'xdg-utils' 'zlib')
makedepends=('patchelf')
optdepends=('libsecret: keep the saved sign-in in the desktop keyring')
provides=("kirocrew=${pkgver}")
conflicts=('kirocrew')
options=('!strip' '!debug')
install=kirocrew.install
_release="${url}/releases/download/v${pkgver}"
source_x86_64=("${_release}/KiroCrew-${pkgver}-x86_64.rpm")
source_aarch64=("${_release}/KiroCrew-${pkgver}-aarch64.rpm")
sha256sums_x86_64=('4c4f1b737d3a86206f60a6eefa12dc7849b65a3d358789d4d7867831b2d1a65a')
sha256sums_aarch64=('8ac7ae03caf8428b1d263cada194a3841c98117080d372a301644f88b8384dbb')

package() {
  install -d "${pkgdir}/usr/lib" "${pkgdir}/usr/bin"
  cp -a opt/KiroCrew "${pkgdir}/usr/lib/${pkgname}"
  patchelf --remove-rpath "${pkgdir}/usr/lib/${pkgname}"/resources/backend-dist/kirocrew-backend/lib/libtcl9{.0,tk9.0}.so
  printf '{"managedBy": "pacman"}\n' > "${pkgdir}/usr/lib/${pkgname}/resources/EXTERNALLY-MANAGED"
  ln -s "/usr/lib/${pkgname}/kirocrew-desktop" "${pkgdir}/usr/bin/kirocrew-desktop"
  ln -s "/usr/lib/${pkgname}/resources/backend-dist/kirocrew-backend/bin/kirocrew" "${pkgdir}/usr/bin/kirocrew"
  sed -i 's|^Exec=.*kirocrew-desktop|Exec=/usr/bin/kirocrew-desktop|' usr/share/applications/kirocrew-desktop.desktop
  install -Dm644 usr/share/applications/kirocrew-desktop.desktop -t "${pkgdir}/usr/share/applications"
  for size in 16 32 48 64 128 256 512; do
    install -Dm644 "usr/share/icons/hicolor/${size}x${size}/apps/kirocrew-desktop.png" \
      -t "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps"
  done
  install -d "${pkgdir}/usr/share/licenses/${pkgname}" && ln -s "/usr/lib/${pkgname}/resources/backend-dist/kirocrew-backend/lib/python3.12/site-packages/kirocrew-${pkgver}.dist-info/licenses/NOTICE" "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
}
