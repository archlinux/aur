# Maintainer: Maxqia <contrib@maxqia.com>
# Co-Maintainer: Felix Golatofski <contact@xdfr.de>

_pkgname=als-controller
pkgname=$_pkgname-git
pkgver=r86.a2f9f2b
pkgrel=2
pkgdesc="A daemon that adjusts screen and keyboard backlight using the Zenbook's light sensor"
arch=('i686' 'x86_64')
url="https://github.com/hitzemann/Asus-Zenbook-Ambient-Light-Sensor-Controller"
license=('Apache')
depends=('qt5-base' 'libbsd')
makedepends=('git' 'als-dkms')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$pkgname::git+https://github.com/hitzemann/Asus-Zenbook-Ambient-Light-Sensor-Controller.git"
	"als-controller.service")
sha256sums=('SKIP'
            '47b3e42bd5d59867e639975597d5225b1654c92b2965509280ffd71956849ba4')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $srcdir/$pkgname/example
  sed -i 's|/bin/bash|/usr/bin/env bash|;s|"\$DIR"/\.\./service/||' switch.sh
}

build() {
  cd $srcdir/$pkgname/service
  [[ "$CARCH" = "x86_64" ]] \
      && qmake als-controller.pro -r -spec linux-g++-64 \
      || qmake als-controller.pro -r -spec linux-g++
  make
}

package() {
  cd $srcdir/$pkgname
  install -Dm644 example/images/active.svg "$pkgdir"/usr/share/als-controller/example/images/active.svg
  install -Dm644 example/images/inactive.svg "$pkgdir"/usr/share/als-controller/example/images/inactive.svg
  install -Dm644 ../als-controller.service "$pkgdir"/usr/lib/systemd/system/als-controller.service
  install -Dm755 example/switch.sh "$pkgdir"/usr/share/als-controller/example/switch.sh
  install -Dm755 service/$_pkgname "$pkgdir"/usr/bin/$pkgname
}
