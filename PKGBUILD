# Maintainer: tuberry

_srcname=mingju
pkgname=fortune-mod-mingju-git
pkgver=r15.e2398a0
pkgrel=2
pkgdesc="Chinese mingju for fortune-mod"
url=https://github.com/xuchunyang/${_srcname}
license=(custom)
depends=(fortune-mod)
makedepends=(git fortune-mod opencc)
provides=(fortune-mod-mingju)
conflicts=(fortune-mod-mingju)
groups=(fortune-mods-zh)
source=(git+${url})
md5sums=(SKIP)
arch=(any)

pkgver() {
  cd ${_srcname}
  printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

build() {
  cd ${_srcname}
  opencc -i ${_srcname}.json -o ${_srcname}.json -c t2s
  sed -e 's/"\s+/"/g; s/[“”…]//g; s/（[^）]*）//g; s/—/一/g; s/"},{"/\n%\n/g; s/contents":"//g; s/","source":"/\n ──── /g; s/]/\n%\n/' < ${_srcname}.json | tr -d '"{}[' > ${_srcname}
  strfile ${_srcname} ${_srcname}.dat
}

package(){
  cd ${_srcname}
  install -dm755 ${pkgdir}/usr/share/fortune
  install -Dm644 ${_srcname} ${_srcname}.dat ${pkgdir}/usr/share/fortune
}
