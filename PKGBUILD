# Maintainer: Aidan Dang <dang at aidan dot gg>

_pkgname=infnoise

pkgname="$_pkgname-git"
pkgver=0.3.0.r3.g857cfab
pkgrel=1
pkgdesc="The world's easiest TRNG to get right"
arch=('x86_64')
url="https://github.com/waywardgeek/infnoise"
license=('custom')
depends=('libftdi-compat')
makedepends=('git')
provides=('infnoise')
conflicts=('infnoise')
backup=("etc/infnoise.conf")
source=('git+https://github.com/13-37-org/infnoise.git')
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"

  git describe --long --tags | sed 's/-/.r/;s/-/./'
}

build() {
  cd "$_pkgname/software"

  make -f Makefile.linux
}

package() {
  cd "$_pkgname/software"

  install -Dm644 "../LICENSE"                         "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "init_scripts/75-infnoise.rules"     "$pkgdir/usr/lib/udev/rules.d/75-infnoise.rules"
  install -Dm644 "init_scripts/infnoise.conf.systemd" "$pkgdir/etc/infnoise.conf"
  install -Dm644 "init_scripts/infnoise.service.bin"  "$pkgdir/usr/lib/systemd/system/infnoise.service"
  install -Dm755 "infnoise"                           "$pkgdir/usr/bin/infnoise"
  install -Dm755 "libinfnoise.so"                     "$pkgdir/usr/lib/libinfnoise.so"
}
