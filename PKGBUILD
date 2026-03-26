# Maintainer: Max <replace-with-contact@example.com>

pkgname=attackshark-battery-bridge
pkgver=1.1.0
pkgrel=1
pkgdesc="Bridge proprietary Attack Shark mouse battery reports into standard Linux battery interfaces"
arch=('x86_64')
url="https://github.com/maxboeer/attackshark-battery-bridge"
license=('MIT')
depends=('glibc' 'systemd')
makedepends=('python' 'python-pyinstaller')
backup=('etc/attackshark-battery-bridge/config.toml')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  python -m PyInstaller \
    --noconfirm \
    --clean \
    --onefile \
    --name "${pkgname}" \
    --paths "${srcdir}/${pkgname}-${pkgver}/src" \
    --add-data "${srcdir}/${pkgname}-${pkgver}/src/attackshark_battery_bridge/profiles:attackshark_battery_bridge/profiles" \
    "${srcdir}/${pkgname}-${pkgver}/src/attackshark_battery_bridge/__main__.py"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm755 "dist/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "packaging/attackshark-battery-bridge.service.pkg" \
    "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm644 "packaging/config.example.toml" \
    "${pkgdir}/etc/attackshark-battery-bridge/config.toml"
  install -Dm644 "README.md" \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "TECHNICAL.md" \
    "${pkgdir}/usr/share/doc/${pkgname}/TECHNICAL.md"
  install -Dm644 "LICENSE.md" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
