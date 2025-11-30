# Maintainer: wheat32

pkgname=expressvpn-beta
_name=expressvpn
pkgver=5.0.1.11498
pkgrel=1
pkgdesc="Proprietary VPN client for Linux"
arch=('x86_64' 'aarch64')
depends=('bash' 'dbus' 'fontconfig' 'freetype2' 'gcc-libs' 'glib2' 'glibc' 'iptables' 'libatomic_ops'
         'libcap-ng' 'libice' 'libnl' 'libsm' 'libxkbcommon' 'libxkbcommon-x11' 'mesa' 'psmisc'
         'qt6-3d' 'qt6-base' 'qt6-declarative' 'qt6-declarative' 'qt6-lottie' 'qt6-quicktimeline'
         'qt6-scxml' 'qt6-svg' 'qt6-virtualkeyboard' 'qt6-wayland' 'zlib')
provides=('expressvpn')
conflicts=('expressvpn')
url="https://expressvpn.com"
license=('LicenseRef-custom')
options=(!strip)
install=expressvpn.install
_url="https://www.expressvpn.works/clients/linux"
source=("${_url}/${_name}-linux-universal-${pkgver}.run"{,.asc}
        expressvpn.sysusers)
sha256sums=('f36ed43a95fc8a12db9238b509f0314a73ec8200979bc3c88418ed493565749a'
            'SKIP'
            '33ea79001be5dbc45122255c2fec4dd9e0396fdf19330b72fd770d33c398faf5')
validpgpkeys=('1D0B09AD6C93FEE93FDDBD9DAFF2A1415F6A3A38')

prepare() {
  # Extract run file
  sh expressvpn-linux-universal-${pkgver}.run --noexec --nox11 --target "${_name}-${pkgver}"
}

package() {
  if [ "${CARCH}" == "x86_64" ]; then
    cd "${_name}-${pkgver}/x64/"
  elif [ "${CARCH}" == "aarch64" ]; then
    cd "${_name}-${pkgver}/arm64/"
  fi

  install -dm755 "${pkgdir}/opt"
  cp -a "expressvpnfiles/" "${pkgdir}/opt/expressvpn"
  setcap 'cap_net_bind_service=+ep' "${pkgdir}/opt/expressvpn/bin/expressvpn-unbound"

  install -dm755 "${pkgdir}/opt/expressvpn/"{etc,share,var}
  install -dm755 "${pkgdir}/usr/bin"

  install -Dm755 installfiles/error-notice.sh "${pkgdir}/opt/expressvpn/bin/error-notice.sh"
  install -Dm644 installfiles/app-icon.png "${pkgdir}/usr/share/pixmaps/expressvpn.png"
  install -Dm644 installfiles/expressvpn.desktop "${pkgdir}/usr/share/applications/expressvpn.desktop"

  ln -sf ../../opt/expressvpn/bin/expressvpn-client "${pkgdir}/usr/bin/expressvpn-client"
  ln -sf ../../opt/expressvpn/bin/expressvpnctl "${pkgdir}/usr/bin/expressvpnctl"

  install -Dm644 "${srcdir}/expressvpn.sysusers" "${pkgdir}/usr/lib/sysusers.d/expressvpn.conf"
  install -Dm644 installfiles/expressvpn-service.service "${pkgdir}/usr/lib/systemd/system/expressvpn-service.service"

  install -Dm644 "expressvpnfiles/share/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt" 
}
