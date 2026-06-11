# Maintainer: take7leds maintainers
pkgname=take7leds
pkgver=0.1.0
pkgrel=2
pkgdesc="Desktop GUI for Tuxedo-compatible RGB keyboard backlights"
arch=('x86_64')
url="https://gitlab.com/glum403/take7leds"
license=('LGPL-3.0-or-later')
depends=('python' 'pyside6' 'polkit' 'hicolor-icon-theme' 'tuxedo-drivers-dkms')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'gcc')
source=("$pkgname::git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  python -m build --wheel --no-isolation
  cc $CFLAGS $LDFLAGS -O2 -Wall -Wextra -o helper/take7leds-helper helper/take7leds-helper.c
}

package() {
  cd "$srcdir/$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm755 helper/take7leds-helper "$pkgdir/usr/lib/take7leds/take7leds-helper"
  install -Dm644 helper/org.take7leds.helper.policy "$pkgdir/usr/share/polkit-1/actions/org.take7leds.helper.policy"
  install -Dm644 packaging/linux/take7leds.desktop "$pkgdir/usr/share/applications/take7leds.desktop"
  for size in 16 22 24 32 48 64 128 256 512; do
    install -Dm644 "src/take7leds/resources/icons/hicolor/${size}x${size}/apps/take7leds.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/take7leds.png"
  done
  install -Dm644 src/take7leds/resources/default.json "$pkgdir/usr/share/take7leds/layouts/default.json"
}
