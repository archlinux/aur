# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=artanis-git
pkgver=0.5.1.r3.g6528821
pkgrel=1
pkgdesc="A fast monolithic web-framework of Scheme"
arch=('x86_64')
url="http://web-artanis.com/"
license=('LGPL')
depends=('guile')
makedepends=('git' 'texlive-core')
provides=('artanis')
conflicts=('artanis')
source=("git+https://gitlab.com/NalaGinrut/artanis.git")
sha256sums=('SKIP')
options=('!strip')

pkgver() {
  cd ${pkgname%-git}
  git describe --tags | cut -c2- | sed 's+-+.r+' | tr - .
}

build() {
  cd ${pkgname%-git}
  ./autogen.sh 
  GUILE_EFFECTIVE_VERSION=3.0 ./configure --prefix=/usr \
			 --bindir=/usr/bin \
			 --datarootdir=/usr/share \
			 --infodir=/usr/share/info 
  make
  make docs
}

check() {
  cd ${pkgname%-git}
  export GUILE_LOAD_PATH=$GUILE_LOAD_PATH:.
  guile -c '(display (@ (artanis artanis) artanis-version))'
}

package() {
  cd ${pkgname%-git}
  make DESTDIR="$pkgdir" install
  #repair
  install -Dm755 "$pkgdir"/bin/art "$pkgdir"/usr/bin/art
  rm -r "$pkgdir"/bin
}
