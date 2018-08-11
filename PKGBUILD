# Maintainer: Mr. Outis <mroutis@protonmail.com>
pkgname=juiced-git
pkgver=1.0.0
pkgrel=5
pkgdesc="A lightweight battery warning daemon"
arch=('any')
url="https://github.com/drkhsh/${pkgname%-git}"
license=('ISC')
depends=('libnotify')
source=("git+${url}.git" "juiced.service")
sha256sums=('SKIP' 'df4d55f17f4f0c683f10f273d64afac4c97f824bbbafb55b668025c3db7479ac')

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
    "$pkgdir/usr/lib/systemd/user/juiced.service"
}
