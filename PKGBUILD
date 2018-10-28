# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=guile-git
epoch=1
pkgver=2.9.1.1.gbb0860a0e
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
source=("git://git.sv.gnu.org/${pkgname%-git}.git")
url="http://www.gnu.org/software/guile/"
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git describe --tags |sed 's+-+.+g'|sed 's+^v++'
}

build() {
  cd ${pkgname%-git}
  ./autogen.sh
  ./configure --prefix=/usr --program-suffix=3.0
  make LDFLAGS+=" -lpthread"
}

package() {
  cd ${pkgname%-git}
  make DESTDIR="$pkgdir/" install
  cd "$pkgdir"/usr/share/info
  for i in guile*
  do
    mv $i guile-3.0${i#guile}
  done
  mv r5rs.info r5rs-3.0.info
  mv "$pkgdir"/usr/share/aclocal/guile.m4 "$pkgdir"/usr/share/aclocal/guile-3.0.m4
  rm "$pkgdir"/usr/lib/libguile-3.0.so.0.0.0-gdb.scm
}
