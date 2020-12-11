# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=guile-git
epoch=1
_majorver=3.0
pkgver=3.0.4.r38.g64c89458e
pkgrel=1
pkgdesc="A portable, embeddable Scheme implementation (Git snapshot)"
arch=('i686' 'x86_64' 'aarch64')
license=('GPL')
makedepends=('git')
optdepends=('texinfo: for using texinfo scheme sources')
depends=('gc' 'libtool' 'libffi' 'libunistring' 'gmp' 'readline')
provides=('guile')
conflicts=('guile4emacs')
options=('!strip' '!makeflags' 'libtool')
source=("git+https://git.savannah.gnu.org/git/${pkgname%-git}.git")
url="http://www.gnu.org/software/guile/"
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git describe --tags | sed 's+-+.r+' | sed 's+^v++' | tr - .
}

build() {
  cd ${pkgname%-git}
  ./autogen.sh
  ./configure --prefix=/usr --program-suffix=${_majorver}
  make LDFLAGS+=" -lpthread"
}

package() {
  cd ${pkgname%-git}
  make DESTDIR="$pkgdir/" install
  cd "$pkgdir"/usr/share/info
  for i in guile*
  do
    mv $i guile-${_majorver}${i#guile}
  done
  sed -i "s/guile.info/guile-${_majorver}.info/g" guile-${_majorver}*
  sed -i "s/guile.texi/guile-${_majorver}.texi/g" guile-${_majorver}*
  sed -i "s/* Guile Reference: (guile)/* Guile-${_majorver} Reference: (guile-${_majorver})/g" guile-${_majorver}*
  sed -i "s/The Guile reference manual./The Guile-${_majorver} reference manual./g" guile-${_majorver}*
  mv r5rs.info r5rs-${_majorver}.info
  mv "$pkgdir"/usr/share/aclocal/guile.m4 "$pkgdir"/usr/share/aclocal/guile-${_majorver}.m4
  rm "$pkgdir"/usr/lib/libguile-3.0.so.*-gdb.scm
}
