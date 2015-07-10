# Contributor: Paige Aran <paige.aran@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=racket-git
pkgver=6.2.0.5.r20150710.231e9b3
pkgrel=1
pkgdesc="Minimal Racket installation, without useless DrRacket, from git"
arch=('i686' 'x86_64')
url="http://racket-lang.org/"
license=('LGPL')
depends=('bash' 'libffi')
makedepends=('git')
provides=('racket')
conflicts=('racket')
options=('!strip' '!emptydirs')
source=("git://github.com/plt/racket.git")
_gitname="racket"
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  printf %s.r%s \
	 $(grep ' MZSCHEME_VERSION ' \
		${srcdir}/${_gitname}/${_gitname}/src/racket/src/schvers.h \
		| cut -d '"' -f 2) \
	 $(git log -1 --format='%cd.%h' --date=short | tr -d -)
}

build() {
  cd ${srcdir}/${_gitname}/${_gitname}/src
  [[ -d build ]] || mkdir build
  cd build
  [[ "$CARCH" == "x86_64" ]] && export CFLAGS+=" -fPIC"
  ../configure --prefix=/usr --sysconfdir=/etc --enable-shared
  make
}

package() {
  cd ${srcdir}/${_gitname}/${_gitname}/src/build
  make DESTDIR="${pkgdir}" install
}
