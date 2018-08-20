# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=artanis-git
pkgver=0.2.5.81.g9e82b7d
pkgrel=1
pkgdesc="A fast monolithic web-framework of Scheme"
arch=('x86_64')
url="http://web-artanis.com/"
license=('GPL')
depends=('guile')
makedepends=('git')
provides=('artanis')
conflicts=('artanis')
source=("git+https://gitlab.com/NalaGinrut/artanis.git")
md5sums=('SKIP')
options=('!strip')
_gitname="artanis"

pkgver() {
  cd $_gitname
  git describe|cut -c2-|tr - .
}

build() {
  cd $_gitname
  ./autogen.sh 
  GUILE_EFFECTIVE_VERSION=2.2 ./configure --prefix=/usr \
			 --bindir=/usr/bin \
			 --datarootdir=/usr/share \
			 --infodir=/usr/share/info 
  make
  make docs
}

check() {
  cd $_gitname
  export GUILE_LOAD_PATH=$GUILE_LOAD_PATH:.
  guile -c '(display (@ (artanis artanis) artanis-version))'
}

package() {
  cd $_gitname
  make DESTDIR="$pkgdir/" install
  # repair
  cp -r "$pkgdir"/bin "$pkgdir"/usr
  rm -r "$pkgdir"/bin
}
