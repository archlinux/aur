# Contributor: Paige Aran <paige.aran@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=racket-git
pkgver=7.0.0.2.38715.5a4ea2cd1b
pkgrel=1
pkgdesc="Minimal Racket installation, without DrRacket, from git"
arch=('i686' 'x86_64')
url="http://racket-lang.org/"
license=('LGPL')
depends=('bash' 'libffi')
makedepends=('git')
provides=('racket')
conflicts=('racket')
options=('!strip' '!emptydirs')
source=("git://github.com/racket/racket.git#commit=5a4ea2cd1b2bd13a7633a80c1ddff9755a11fd42")
_gitname="racket"
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  printf %s.%s.%s \
	 $(grep ' MZSCHEME_VERSION ' \
		${srcdir}/${_gitname}/${_gitname}/src/racket/src/schvers.h \
		| cut -d '"' -f 2) "$(git rev-list --count HEAD)" $(git log -1 --format='%h')
}

build() {
  cd ${_gitname}/${_gitname}/src
  [[ -d build ]] || mkdir build
  cd build
  [[ "$CARCH" == "x86_64" ]] && export CFLAGS+=" -fPIC -O2"
  ../configure --prefix=/usr --sysconfdir=/etc --enable-shared --disable-strip
  make
}

package() {
  cd ${_gitname}/${_gitname}/src/build
  make DESTDIR="${pkgdir}" install
}
