# Maintainer: Shwetank Gupta <shwetankg07@gmail.com>
pkgname=kbrgb
pkgver=0.2.0
pkgrel=1
pkgdesc="RGB keyboard control for Acer Predator/Nitro laptops with the ENE KB5130 (ENEK5130) i2c-HID controller"
arch=('any')
url="https://github.com/shwetankg07/kbrgb"
license=('MIT')
depends=('python')
optdepends=('walker: preset picker used by the bundled kbrgb-menu example')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('821a71955f5a8b4e4f62c8b1ed1bfb5802d232a9dbe71992d5843a960551f168')

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 kbrgb.py "${pkgdir}/usr/bin/kbrgb"

  # Rule text is generated from the one copy that lives in kbrgb.py, so the
  # packaged rule can never drift from the one `kbrgb install-udev` writes.
  install -dm755 "${pkgdir}/usr/lib/udev/rules.d"
  python3 kbrgb.py install-udev --print \
    > "${pkgdir}/usr/lib/udev/rules.d/60-kbrgb-enek5130.rules"
  chmod 644 "${pkgdir}/usr/lib/udev/rules.d/60-kbrgb-enek5130.rules"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 PROTOCOL.md "${pkgdir}/usr/share/doc/${pkgname}/PROTOCOL.md"

  install -Dm755 examples/kbrgb-menu \
    "${pkgdir}/usr/share/doc/${pkgname}/examples/kbrgb-menu"
  install -Dm644 examples/presets.conf \
    "${pkgdir}/usr/share/doc/${pkgname}/examples/presets.conf"
  install -Dm644 examples/systemd/kbrgb-restore.service \
    "${pkgdir}/usr/share/doc/${pkgname}/examples/systemd/kbrgb-restore.service"
  install -Dm755 examples/omarchy/kbrgb-restore \
    "${pkgdir}/usr/share/doc/${pkgname}/examples/omarchy/kbrgb-restore"
  install -Dm755 examples/omarchy/theme-set \
    "${pkgdir}/usr/share/doc/${pkgname}/examples/omarchy/theme-set"
}
