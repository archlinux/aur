# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=artanis-git
pkgver=0.5.1.r3.g6528821
pkgrel=4
pkgdesc="A fast monolithic web-framework of Scheme"
arch=('x86_64')
url="https://gitlab.com/hardenedlinux/artanis"
license=('LGPL')
depends=('guile')
makedepends=('git' 'texlive-core')
provides=('artanis')
conflicts=('artanis')
source=("git+$url.git#commit=6528821de90a93d140c2c8fd50a3b5e88fd7b4aa")
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
