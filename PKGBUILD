pkgname=ds360
pkgver=20211113
pkgrel=1
pkgdesc='xboxdrv wrapper to use a DualSense as a Xbox 360 controller on Linux'
url='https://github.com/yoyossef/ds360'
arch=('x86_64')
license=('unknown')
depends=('xboxdrv' 'systemd')
source=("git+https://github.com/yoyossef/ds360.git")
sha512sums=('SKIP')

pkgver() {
  cd $pkgname

  git log -1 --date=format:%Y%m%d --pretty=format:%cd
}

prepare() {
  cd $pkgname

  sed -i 's+%h/.local/bin/ds360+/usr/bin/ds360+g' ds360.service
}

build() {
  cd $pkgname

  make
}

package() {
  cd $pkgname

  install -Dm 0755 ds360 -t "${pkgdir}/usr/bin/"
  install -Dm 0755 ds360-stop.sh "${pkgdir}/usr/bin/ds360-stop"

  install -Dm644 80-ds360.rules "${pkgdir}/usr/lib/udev/rules.d/80-ds360.rules"
  install -Dm644 $pkgname.service "${pkgdir}"/usr/lib/systemd/user/$pkgname.service
}
