_pkgname=lucent
pkgname=lucent-git
pkgver=1.0.0.r1.ge210e56
pkgrel=1
pkgdesc="A blazing-fast, D-Bus activated Wayland notification daemon"
arch=('x86_64' 'aarch64')
url="https://github.com/CPT-Dawn/Lucent"
license=('MIT')
depends=('glib2' 'gtk4' 'gtk4-layer-shell' 'dbus')
makedepends=('cargo' 'git' 'rust')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/CPT-Dawn/Lucent.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^v//; s/-/.r/; s/-/./'
}

build() {
  cd "${srcdir}/${_pkgname}"
  export CARGO_TARGET_DIR="${srcdir}/target"
  cargo build --release --locked
}

package() {
  cd "${srcdir}/${_pkgname}"

  install -Dm755 "${srcdir}/target/release/lucent" "${pkgdir}/usr/bin/lucent"
  strip "${pkgdir}/usr/bin/lucent"

  install -Dm644 \
    "${srcdir}/${_pkgname}/org.freedesktop.Notifications.service" \
    "${pkgdir}/usr/share/dbus-1/services/org.freedesktop.Notifications.service"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
