# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Christian Neukirchen <chneukirchen@gmail.com>

pkgname=cwm-git
pkgver=20221015
pkgrel=2
pkgdesc="Fork of calmwm, a clean and lightweight window manager (git version)"
arch=('x86_64')
url="https://github.com/leahneukirchen/cwm"
license=('custom')
depends=('libxft' 'libxrandr' 'libxinerama')
makedepends=('git' 'pkg-config')
conflicts=('cwm')
provides=('cwm')
source=("$pkgname::git+https://github.com/leahneukirchen/cwm.git#branch=linux" 'cwm.desktop')
sha256sums=('SKIP'
            '083d54f4e80b4a96c1f749379a9277696de0c65e030c284eeb14e9671f9aa7f3')

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
