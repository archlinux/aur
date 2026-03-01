# Maintainer: Rongfei Jin <redacted @ gmail dot com>

pkgname=pactrack
pkgver=0.1.0
pkgrel=1
pkgdesc='Arch Linux package update tray tracker'
arch=('x86_64')
url='https://github.com/greasycat/pactrack'
license=('MIT')
depends=(
  'bash'
  'dbus'
  'fakeroot'
  'glib2'
  'gtk3'
  'libayatana-appindicator'
  'libnotify'
  'pacman'
)
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/greasycat/pactrack/releases/download/v${pkgver}/source.tar.gz")
sha256sums=('e8123107e7d573be06eb7fbdf295885d2fda7cfad6902dc3e3fd94c6efdf1066')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo build --release --locked
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 config_example.toml "${pkgdir}/usr/share/doc/${pkgname}/config_example.toml"

  install -Dm644 systemd/pactrack.service "${pkgdir}/usr/lib/systemd/user/pactrack.service"
  sed -i 's#^ExecStart=.*#ExecStart=/usr/bin/pactrack#' "${pkgdir}/usr/lib/systemd/user/pactrack.service"
}
