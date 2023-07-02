# Maintainer: Stunts <stunts@pinamartins.com>
_pkgname=sbx-h6-rgb
pkgname=${_pkgname}-git
pkgver=r16.95b4ef9
pkgrel=1
pkgdesc=" Creative SoundblasterX RGB LED setter"
arch=(any)
url="https://github.com/Oscillope/sbx-h6-rgb"
license=('GPL3')
depends=('hidapi')
makedepends=('git')
source=('git+https://github.com/Oscillope/sbx-h6-rgb.git')
sha256sums=('SKIP') 

pkgver() {
  cd ${srcdir}/${_pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd ${srcdir}/${_pkgname}
  make
  mv 99-sbx-h6-purple.rules 99-sbx-h6-systemd.rules
  sed -i 's|RUN+=.*$|RUN+="/usr/bin/systemctl --no-block restart sbx-h6-led.service"|' 99-sbx-h6-systemd.rules
}

package() {
  cd ${srcdir}/${_pkgname}
  install -D sbx-h6-ctl ${pkgdir}/usr/bin/sbx-h6-ctl
  install -D sbx-h6-led.service ${pkgdir}/usr/lib/systemd/system/sbx-h6-led.service
  install -D 99-sbx-h6-systemd.rules ${pkgdir}/etc/udev/rules.d/99-sbx-h6-systemd.rules
}
