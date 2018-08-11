# Maintainer: Mr. Outis <mroutis@protonmail.com>
pkgname=juiced-git
pkgver=1.0.0
pkgrel=4
pkgdesc="A lightweight battery warning daemon"
arch=('any')
url="https://github.com/drkhsh/${pkgname%-git}"
license=('ISC')
depends=('libnotify')
source=("git+${url}.git" "juiced.service")
sha256sums=('SKIP' 'c5e15a7d14f8709b3ef82cde3ba15dc2c61ac387940e0c1b94c0bb03376f2288')

build() {
  cd "${srcdir}/${pkgname%-git}"

  # Check battery
  local battery=$(ls /sys/class/power_supply \
                    | grep -o 'BAT[0-9]' \
                    | head -n 1)

  sed -i "s/BAT[0-9]/${battery}/" config.def.h
}

package() {
  cd "${srcdir}/${pkgname%-git}"

  make PREFIX=/usr DESTDIR="${pkgdir}" install

  install -Dm644 '../juiced.service' \
    "$pkgdir/usr/lib/systemd/system/juiced.service"
}
