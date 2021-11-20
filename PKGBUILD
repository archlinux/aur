# Maintainer: Bastian de Byl <bastian@bdebyl.net>
pkgname=spinnrd-git
pkgver=1.1.0.r43.b2a48cc
pkgrel=1
pkgdesc="A daemon to turn accelerometer data into xrandr orientations for auto-screen rotation"
arch=(x86_64 i686)
url="https://github.com/rantingpirate/spinnrd.git"
license=('MIT')
depends=('xorg-xrandr' 'inotify-tools' 'iio-sensor-proxy')
makedepends=('rust' 'git')
provides=('spinnrd')
# install=spinnrd.install
source=("${pkgname}::git+$url")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "1.1.0.r%s.%s" "$(git rev-list --count HEAD 2>/dev/null)" "$(git rev-parse --short HEAD 2>/dev/null)"
}

build() {
  cd "${srcdir}/${pkgname}"
  cargo build --release
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm755 target/release/spinnrd ${pkgdir}/usr/local/bin/spinnrd
  install -Dm755 spinnr.sh ${pkgdir}/usr/share/spinnr/spinnr.sh
  install -Dm644 spinnrd.service ${pkgdir}/usr/lib/systemd/system/spinnrd.service
  echo "==> Ensure to start/enable the spinnrd.service!"
  echo "==> Additionally, add '/usr/share/spinnr/spinnr.sh /run/spinnrd/spinnrd.spin' to your desktop's auto-start applications!"
}
