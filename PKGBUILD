# Maintainer: Mateusz Cegiełka <mateusz@cegla.net>

pkgname=vaxtify
pkgver=0.1.6
pkgrel=1
pkgdesc="Distraction blocker for the stubborn"
url="https://github.com/pustaczek/vaxtify"
arch=(x86_64)
license=(MPL2)
depends=(dbus gcc-libs)
makedepends=(cargo)
source=("${url}/archive/v${pkgver}.tar.gz" "${url}/releases/download/v${pkgver}/vaxtify-${pkgver}-an+fx.xpi")
noextract=("vaxtify-${pkgver}-an+fx.xpi")
sha256sums=(
  "74ea46fd081720ff679464bbefd230e87d2fac6c1ed662fd26b7a4eef7fa82a9"
  "19ca806d76b4061b75d4a20051abf7cd3138da2895d04e13589bb0b2ce510f67"
)

build() {
  cd "${srcdir}/vaxtify-${pkgver}"
  cargo build --release --locked
}

package() {
  cd "${srcdir}"
  install -Dm644 "vaxtify-${pkgver}-an+fx.xpi" "${pkgdir}/usr/lib/mozilla/extensions/{ec8030f7-c20a-464f-9b0e-13a3a9e97384}/vaxtify@pustaczek.dev.xpi"
  cd "${srcdir}/vaxtify-${pkgver}"
  install -Dm644 "misc/dbus-service/dev.pustaczek.Vaxtify.service" "${pkgdir}/usr/share/dbus-1/services/dev.pustaczek.Vaxtify.service"
  install -Dm644 "misc/systemd-unit/vaxtify.service" "${pkgdir}/etc/systemd/user/vaxtify.service"
  install -Dm644 "misc/webextension-manifest/vaxtify.json" "${pkgdir}/usr/lib/mozilla/native-messaging-hosts/vaxtify.json"
  install -Dm755 "target/release/vaxtify" "${pkgdir}/usr/bin/vaxtify"
}
