# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=jamulus-git
_pkgname=Jamulus
pkgver=r4215.192391d0
pkgrel=1
pkgdesc="Internet jam session software (git)"
arch=('x86_64')
url='http://llcon.sourceforge.net/'
license=('GPL2')
depends=('glibc' 'gcc-libs' 'qt5-base')
conflicts=('jamulus')
provides=('jamulus')
makedepends=('jack' 'git')
source=("${pkgname}::git+https://github.com/corrados/jamulus/")

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  }

build() {
  cd "$srcdir/$pkgname"
  qmake Jamulus.pro
  make clean
  make
}

package() {
  depends+=('libjack.so')
  cd "$srcdir/$pkgname"
  install -Dm755 Jamulus "${pkgdir}/usr/bin/Jamulus"
  install -Dm644 distributions/jamulus.desktop "${pkgdir}/usr/share/applications/jamulus.desktop"
  install -Dm644 distributions/jamulus.png "${pkgdir}/usr/share/pixmaps/jamulus.png"
  install -vDm 644 {ChangeLog,README.md} -t "${pkgdir}/usr/share/doc/${pkgname}"
  sed -e 's%^Name=Jamulus%Name=Jamulus (server)%' -e 's%^Exec=Jamulus$%Exec=Jamulus -s%' \
     "${pkgdir}/usr/share/applications/jamulus.desktop" > "${pkgdir}/usr/share/applications/jamulus-server.desktop"
}

sha1sums=('SKIP')
