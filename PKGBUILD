# Maintainer: Florian Maunier <fmauneko@dissidence.ovh>
# Contributor: Sefa Eyeoglu <contact@scrumplex.net>

pkgname=sway-systemd
pkgver=0.4.1
pkgrel=2
pkgdesc="Systemd integration for Sway session"
arch=(any)
url="https://github.com/alebastr/sway-systemd"
license=("custom:MIT")
depends=("python" "sway" "dbus" "python-dbus-next" "python-i3ipc" "python-psutil" "python-xlib" "python-tenacity" "sway-contrib")
makedepends=("git" "meson")
conflicts=("sway-services-git")
source=("sway-systemd::git+https://github.com/alebastr/sway-systemd.git#tag=v${pkgver}")
sha512sums=('4c1b01e45ae152e221412ea29f5c5fdbe55c17405e23c46ba8d93e15a963f1bb0efa22ab30ccf8f18a3b85f68f9ff005b378c471794449589219ad5238728028')

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

  rm "$pkgdir/usr/lib/systemd/user/sway-session.target"

  cd "$srcdir/${pkgname%-git}"

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname%-git}/README.md"
}
