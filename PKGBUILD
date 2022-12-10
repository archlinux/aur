# Maintainer: Mateusz Cegiełka <mateusz@cegla.net>

pkgname=vaxtify
pkgver=0.2.0
pkgrel=1
pkgdesc="Distraction blocker for the stubborn"
url="https://github.com/unneon/vaxtify"
arch=(x86_64)
license=(MPL2)
depends=(dbus gcc-libs)
makedepends=(cargo)
source=(
  "${url}/archive/v${pkgver}.tar.gz"
  "${url}/releases/download/v${pkgver}/vaxtify-${pkgver}-an+fx.xpi"
)
noextract=("vaxtify-${pkgver}-an+fx.xpi")
sha256sums=(
  "471036ea82404ab36862768b0cbcb26d5fbf56954b0afea22c60b4b59a307482"
  "6dd0ce0e0ee059fcd24c848c798b8943333ae23448a4f1f9f6a2da0901b26e94"
)

build() {
  cd "${srcdir}/vaxtify-${pkgver}"
  cargo build --release --locked
}

package() {
  cd "${srcdir}"
  install -Dm644 "vaxtify-${pkgver}-an+fx.xpi" "${pkgdir}/usr/lib/mozilla/extensions/{ec8030f7-c20a-464f-9b0e-13a3a9e97384}/vaxtify@unneon.solar.xpi"
  cd "${srcdir}/vaxtify-${pkgver}"
  install -Dm644 "misc/dbus-service/solar.unneon.Vaxtify.service" "${pkgdir}/usr/share/dbus-1/services/solar.unneon.Vaxtify.service"
  install -Dm644 "misc/systemd-unit/vaxtify.service" "${pkgdir}/etc/systemd/user/vaxtify.service"
  install -Dm644 "misc/webextension-manifest/vaxtify.json" "${pkgdir}/usr/lib/mozilla/native-messaging-hosts/vaxtify.json"
  install -Dm755 "target/release/vaxtify" "${pkgdir}/usr/bin/vaxtify"
}
