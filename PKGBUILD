# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=guile-git
_gitname=guile
pkgver=2.1.6.19.g4706d6982
pkgrel=1
pkgdesc="A portable, embeddable Scheme implementation (Git snapshot)"
arch=('i686' 'x86_64')
license=('GPL')
makedepends=('git')
optdepends=('texinfo: for using texinfo scheme sources')
depends=('gc' 'libtool' 'libffi' 'libunistring' 'gmp' 'readline')
provides=('guile')
conflicts=('guile4emacs')
options=('!strip' '!makeflags' 'libtool')
source=("git://git.sv.gnu.org/$_gitname.git")
url="http://www.gnu.org/software/guile/"
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  git describe --tags |sed 's+-+.+g'|sed 's+^v++'
}

build() {
  cd $_gitname
  ./autogen.sh
  ./configure --prefix=/usr --disable-error-on-warning \
	--program-suffix=-2.2
  make LDFLAGS+="-lpthread"
}

package() {
  cd $_gitname
  make DESTDIR="$pkgdir/" install
  cd $pkgdir/usr/share/info
  for i in guile*
  do
    mv $i guile-2.2${i#guile}
  done
  mv r5rs.info r5rs-2.2.info
  mv $pkgdir/usr/share/aclocal/guile.m4 $pkgdir/usr/share/aclocal/guile-2.2.m4
  rm "$pkgdir"/usr/lib/libguile-2.2.so.0.0.0-gdb.scm
}
