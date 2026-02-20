# Maintainer: vpn-tray maintainers

pkgname=vpn-tray
pkgver=1.0.0
pkgrel=1
pkgdesc='System tray app for OpenConnect VPN with least-privilege helper'
arch=('any')
url='https://github.com/RythenGlyth/vpn-tray'
license=('MIT')
depends=('dbus' 'openconnect' 'oath-toolkit' 'python' 'python-keyring' 'python-pyqt6' 'sudo' 'systemd')
optdepends=('python-secretstorage: recommended keyring backend on Linux')
install="${pkgname}.install"
source=("vpn-tray-${pkgver}.tar.gz::https://github.com/RythenGlyth/vpn-tray/releases/download/v1.0.0/vpn-tray-1.0.0.tar.gz" "${pkgname}.install")
sha256sums=('d16471b0f788ff56d346b49cde02cbe82cc4efa34abb0dadaff0971e2a52658f' '5f1668aaa8fe5962e518a9a746cf0eb24a3d398e38965e6947ae83e8aa86f365')

package() {
  cd "${srcdir}/vpn-tray-1.0.0"

  install -Dm755 vpn-tray.py "${pkgdir}/usr/lib/${pkgname}/vpn-tray.py"
  install -Dm755 vpn-tray-helper.sh "${pkgdir}/usr/lib/${pkgname}/vpn-tray-helper.sh"

  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${pkgname}" <<'EOF'
#!/usr/bin/env bash
exec /usr/bin/python3 /usr/lib/vpn-tray/vpn-tray.py "$@"
EOF

  install -d "${pkgdir}/usr/lib/systemd/user"
  sed \
    -e 's|@VPN_TRAY_HELPER@|/usr/lib/vpn-tray/vpn-tray-helper.sh|g' \
    -e 's|@VPN_TRAY_RUNTIME_DIR@|%t/vpn-tray|g' \
    -e 's|@VPN_TRAY_PID_FILENAME@|vpn_tray.pid|g' \
    -e 's|@VPN_TRAY_LOCK_FILE@|%t/vpn-tray.lock|g' \
    packaging/systemd/vpn-tray.service > "${pkgdir}/usr/lib/systemd/user/vpn-tray.service"

  install -d "${pkgdir}/usr/share/doc/${pkgname}/examples"
  sed \
    -e 's|@INSTALL_USER@|<your-username>|g' \
    -e 's|@HELPER_PATH@|/usr/lib/vpn-tray/vpn-tray-helper.sh|g' \
    packaging/sudoers/vpn-tray > "${pkgdir}/usr/share/doc/${pkgname}/examples/sudoers.vpn-tray"
  chmod 0440 "${pkgdir}/usr/share/doc/${pkgname}/examples/sudoers.vpn-tray"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
