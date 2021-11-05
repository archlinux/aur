# Maintainer: Juanjo Gutierrez <juanjo at gutierrezdequevedo dot com>

pkgname=tty0tty
pkgver=r31.319c8a2
pkgrel=1
pkgdesc="tty0tty Virtual Serial Cable"
arch=('x86_64' 'aarch64')
url="https://github.com/lcgamboa/tty0tty"
license=('GPL2')
depends=('dkms')
conflicts=("${pkgname}")
source=("git+https://github.com/lcgamboa/tty0tty")
sha256sums=("SKIP")
makedepends=('git')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  # patch udev rules
  sed -i -e "s/dialout/uucp/g" "$pkgname/module/99-tty0tty.rules"
}

build() {
  cd "$pkgname/pts"
  make
}

package() {
  # Copy dkms.conf
  install -D -m 644 "$pkgname/module/dkms.conf" "$pkgdir/usr/src/$pkgname-$pkgver/dkms.conf"

  # Set name and version
  sed -e "s/\#MODULE_VERSION\#/$pkgver/" \
      -i "$pkgdir/usr/src/$pkgname-$pkgver/dkms.conf"

  # Copy sources (including Makefile)
  cp -r "$pkgname/module"/* "$pkgdir/usr/src/$pkgname-$pkgver/"

  # copy udev rules
  install -D -m 644 "$pkgname/module/99-tty0tty.rules" "$pkgdir/usr/lib/udev/rules.d/99-tty0tty.rules"

  # copy user space pts binary
  install -D -m 755 "$pkgname/pts/tty0tty" "$pkgdir/usr/bin/tty0tty"
}
