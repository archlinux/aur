# Maintainer: Christian Neukirchen <chneukirchen@gmail.com>
pkgname=cwm-git
pkgver=20150423
pkgrel=1
pkgdesc="OpenBSD fork of calmwm, a clean and lightweight window manager"
arch=('i686' 'x86_64')
url="http://www.openbsd.org/cgi-bin/man.cgi?query=cwm&sektion=1"
license=('custom')
depends=('libxft' 'libxrandr' 'libxinerama')
makedepends=('git' 'pkg-config')
conflicts=('cwm')
provides=('cwm')
source=('git://github.com/chneukirchen/cwm.git#branch=linux' 'cwm.desktop')
md5sums=('SKIP'
         '42530ce5a23fc5f9088d891e325d99bd')

pkgver() {
  cd "$srcdir/cwm"
  git log -1 --format="%cd" --date=short | sed 's|-||g'
}

build() {
  cd "$srcdir/cwm"
  make
}

package() {
  cd "$srcdir/cwm"
  make DESTDIR="${pkgdir}" PREFIX=/usr install
  install -D -m644 "${srcdir}/cwm.desktop" "${pkgdir}/usr/share/xsessions/cwm.desktop"
  install -D -m644 <(sed -n '/Copyright/,/PERFORMANCE/p' <calmwm.c) "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
