# Maintainer: Sascha Wunderlich <archlinux at saschawunderlich dot de>
pkgname=prismmodelchecker-git
pkgver=r3619.06bba360
pkgrel=1
pkgdesc="PRISM is a probabilistic model checker, a tool for formal modelling and analysis of systems that exhibit random or probabilistic behaviour"
arch=(i686 x86_64)
url="http://www.prismmodelchecker.org/"
license=('GPL2')
groups=()
conflicts=('prismmodelchecker')
provides=('prismmodelchecker')
depends=(java-environment)
makedepends=(git)
source=("prismmodelchecker-git::git+https://github.com/prismmodelchecker/prism.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"/prism

  make
  make binary
}

package() {
  cd "$pkgname"/prism

  sed -i 's/^\(PRISM_DIR=\).*/\1"\/usr\/share\/java\/prism\/"/' bin/prism
  sed -i 's/^\(PRISM_DIR=\).*/\1"\/usr\/share\/java\/prism\/"/' bin/xprism

  mkdir -p $pkgdir/usr/share/java/prism/

  cp -r bin/ $pkgdir/usr/share/java/prism/bin/
  cp -r lib/ $pkgdir/usr/share/java/prism/lib/
  cp -r etc/ $pkgdir/usr/share/java/prism/etc/

  install -d $pkgdir/usr/bin/
  ln -s "/usr/share/java/prism/bin/prism" "${pkgdir}/usr/bin/prism"
  ln -s "/usr/share/java/prism/bin/xprism" "${pkgdir}/usr/bin/xprism"
  ln -s "/usr/share/java/prism/bin/ngprism" "${pkgdir}/usr/bin/ngprism"
  ln -s "/usr/share/java/prism/etc/scripts/prism-auto" "${pkgdir}/usr/bin/prism-auto"
}
