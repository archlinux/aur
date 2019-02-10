# Maintainer: stiglers-eponym
pkgname=beamerpresenter
pkgver=r35.e56acce
pkgrel=1
pkgdesc="Simple dual screen pdf presentation software"
arch=('x86_64')
url="https://github.com/stiglers-eponym/BeamerPresenter"
license=('GPL3')
depends=('poppler-qt5' 'qt5-multimedia')
optdepends=('wmctrl')
makedepends=('git')
source=('git://github.com/stiglers-eponym/BeamerPresenter.git')
md5sums=('SKIP')
backup=("etc/${pkgname}/${pkgname}.conf" "etc/${pkgname}/pid2wid.sh")

pkgver() {
  cd "${srcdir}/BeamerPresenter"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/BeamerPresenter"
  qmake && make
}

package() {
  cd "${srcdir}/BeamerPresenter"
  install -Dm755 beamerpresenter "${pkgdir}/usr/bin/${pkgname}"
  sed -ie 's/^pid2wid=.*$/pid2wid=\/etc\/beamerpresenter\/pid2wid.sh/' beamerpresenter.conf
  install -Dm644 beamerpresenter.conf "${pkgdir}/etc/${pkgname}/${pkgname}.conf"
  echo '#!/bin/bash
echo $(( 16#$(wmctrl -lp | sed -n "s/^0x\([0-9a-f]\+\) \+[0-9]\+ \+$1 .*$/\1/p") ))' > "${pkgdir}/etc/${pkgname}/pid2wid.sh"
  gzip beamerpresenter.1
  install -Dm644 beamerpresenter.1.gz "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"
}
