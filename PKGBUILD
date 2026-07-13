pkgname=roblox-account-manager
pkgver=0.1.0
pkgrel=1
pkgdesc='Linux Qt port of Roblox Account Manager'
arch=('any')
url='https://github.com/7pxvr/Roblox-Account-Manager-linux'
license=('GPL-3.0-only')
depends=('python' 'python-pyqt6' 'python-requests' 'python-cryptography' 'python-certifi' 'xdg-utils')
optdepends=('chromium: add accounts through browser login and open account profiles'
            'flatpak: use Sober from Flathub as the roblox-player URL handler')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('01fe1bfe0d209c09319a267e3e50bb051dce8827c7a1ae38b75ba287032e405f')

package() {
  cd "Roblox-Account-Manager-linux-${pkgver}"

  install -dm755 "${pkgdir}/usr/lib/${pkgname}/linux_qt"
  cp -a linux_qt/ram_linux_qt "${pkgdir}/usr/lib/${pkgname}/linux_qt/"

  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${pkgname}" <<'EOF'
#!/bin/sh
export PYTHONPATH="/usr/lib/roblox-account-manager${PYTHONPATH:+:$PYTHONPATH}"
exec /usr/bin/python -m linux_qt.ram_linux_qt "$@"
EOF

  install -Dm644 linux_qt/share/applications/roblox-account-manager-linux.desktop \
    "${pkgdir}/usr/share/applications/roblox-account-manager-linux.desktop"
  sed -i 's|^Exec=.*|Exec=roblox-account-manager|' \
    "${pkgdir}/usr/share/applications/roblox-account-manager-linux.desktop"

  install -Dm644 linux_qt/share/icons/hicolor/256x256/apps/roblox-account-manager-linux.png \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/roblox-account-manager-linux.png"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 linux_qt/README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
