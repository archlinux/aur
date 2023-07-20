# Maintainer: Florian Maunier <fmauneko@dissidence.ovh>
# Contributor: Sefa Eyeoglu <contact@scrumplex.net>

pkgname=sway-systemd
pkgver=0.4.0
pkgrel=1
pkgdesc="Systemd integration for Sway session"
arch=(any)
url="https://github.com/alebastr/sway-systemd"
license=("custom:MIT")
depends=("python" "sway" "dbus" "python-dbus-next" "python-i3ipc" "python-psutil" "python-xlib" "python-tenacity")
makedepends=("git" "meson")
conflicts=("sway-services-git")
source=("sway-systemd::git+https://github.com/alebastr/sway-systemd.git#tag=v${pkgver}")
sha512sums=('SKIP')

build() {
  arch-meson \
    -Dautoload-configs=all \
    "$srcdir/${pkgname%-git}" build
  ninja -C build
}

check() {
  ninja -C build test
}

package() {
  DESTDIR="$pkgdir" ninja -C build install

  cd "$srcdir/${pkgname%-git}"

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname%-git}/README.md"
}
