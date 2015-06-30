# Maintainer: Andreas Wagner <andreas.wagner@lowfatcomputing.org>
_pkgname=psoc-programmer
pkgname=$_pkgname-git
pkgver=16.e6ec123
pkgrel=3
pkgdesc="tools to manipulate hex files and program a PSoC5 via FX2 USB interface"
arch=('x86_64' 'i686')
url="https://github.com/kiml/PSOC_programmer"
license=('GPL3')
groups=()
depends=()
makedepends=('git')
optdepends=('fx2lptool-git: Change your FX2LP VID:PID to 04b4:f131')
provides=($_pkgname)
conflicts=($_pkgname)
replaces=()
backup=()
options=()
install=${_pkgname}.install
#source=("${pkgname}::git+https://github.com/kiml/PSOC_programmer.git")
source=("${pkgname}::git+https://github.com/lowfatcomputing/PSOC_programmer.git#branch=getopt-include") # getopt.h needed in Programmer.cpp
noextract=()
md5sums=('SKIP')

pkgver() {
  cd $srcdir/$pkgname
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"

  # software
  make install # Installs to $srcdir/$pkgname/bin
  install -Dm755 bin/prog $pkgdir/usr/bin/psoc-prog
  install -Dm755 bin/freehex2other.py $pkgdir/usr/bin/
  install -Dm755 bin/gen_config.py $pkgdir/usr/bin/
  install -Dm755 bin/hex2bin $pkgdir/usr/bin/
  install -Dm755 bin/hexinfo $pkgdir/usr/bin/
  install -Dm755 bin/mergehex $pkgdir/usr/bin/

  # device config
  install -Dm644 config/config.ini $pkgdir/usr/share/$_pkgname/config.ini
  install -Dm644 config/devices.dat $pkgdir/usr/share/$_pkgname/devices.dat
  install -Dm644 config/fx2_kim_dump.hex $pkgdir/usr/share/$_pkgname/fx2_kim_dump.hex
  install -Dm644 config/fx2lp_fw.hex $pkgdir/usr/share/$_pkgname/fx2lp_fw.hex
  install -Dm644 config/nm.hex  $pkgdir/usr/share/$_pkgname/nm.hex

  # docs
  install -Dm644 README.md $pkgdir/usr/share/doc/$_pkgname/README.md
  install -Dm644 TODO $pkgdir/usr/share/doc/$_pkgname/TODO
  install -Dm644 docs/* $pkgdir/usr/share/doc/$_pkgname/

  #licensing
  install -Dm644 LICENSE_GPL.txt $pkgdir/usr/share/licenses/$_pkgname/LICENSE_GPL.txt
  install -Dm644 COPYING.txt $pkgdir/usr/share/licenses/$_pkgname/COPYING.txt
}

# vim:set ts=2 sw=2 et:
