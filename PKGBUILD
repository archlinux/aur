# Maintainer: Jakob Kukla <jakob [dot] kukla [at] gmail [dot] com>
pkgname=autologin
pkgver=1.0.0
pkgrel=1
pkgdesc="No-fuzz automatic login"
arch=(x86_64)
url="https://git.sr.ht/~kennylevinsen/autologin"
license=('GPL3')
depends=('pam')
makedepends=('meson' 'ninja')
backup=('etc/pam.d/autologin')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~kennylevinsen/autologin/archive/$pkgver.tar.gz"
	'autologin.pam')
sha256sums=('eb084620e660c3d1708beb58cd3520220ad05b5f628378c3118c36379b33221a'
            '99cd77f21ee44a0c5e57b0f3670f711a00496f198fc5704d7e44f5d817c81a0f')

build() {
  mkdir -p build
  arch-meson $pkgname-$pkgver build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install

  install -Dm644 "$srcdir/$pkgname-$pkgver/autologin.service" \
    "$pkgdir/usr/lib/systemd/system/autologin.service"

  install -Dm644 "$srcdir/autologin.pam" \
    "$pkgdir/etc/pam.d/autologin"
}
