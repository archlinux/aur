# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Christian Neukirchen <chneukirchen@gmail.com>
pkgname=cwm-git
pkgver=20220430
pkgrel=1
pkgdesc="OpenBSD fork of calmwm, a clean and lightweight window manager"
arch=('i686' 'x86_64')
url="http://www.openbsd.org/cgi-bin/man.cgi?query=cwm&sektion=1"
license=('custom')
depends=('libxft' 'libxrandr' 'libxinerama')
makedepends=('git' 'pkg-config')
conflicts=('cwm')
provides=('cwm')
source=("$pkgname::git+https://github.com/leahneukirchen/cwm.git#branch=linux" 'cwm.desktop')
md5sums=('SKIP'
         '42530ce5a23fc5f9088d891e325d99bd')

pkgver() {
  cd $pkgname
  git log -1 --format="%cd" --date=short | sed 's|-||g'
}

build() {
  cd $pkgname
  make
}

package() {
  cd $pkgname
  make DESTDIR="${pkgdir}" PREFIX=/usr install
  install -D -m644 "${srcdir}/cwm.desktop" "${pkgdir}/usr/share/xsessions/cwm.desktop"
  install -D -m644 <(sed -n '/Copyright/,/PERFORMANCE/p' <calmwm.c) "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
