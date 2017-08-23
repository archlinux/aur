# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=guile-git
_gitname=guile
pkgver=2.2.2.19.gcfe2279fe
pkgrel=2
pkgdesc="A portable, embeddable Scheme implementation (Git snapshot)"
arch=('i686' 'x86_64' 'aarch64')
license=('GPL')
makedepends=('git')
optdepends=('texinfo: for using texinfo scheme sources')
depends=('gc' 'libtool' 'libffi' 'libunistring' 'gmp' 'readline')
provides=('guile')
conflicts=('guile4emacs')
options=('!strip' '!makeflags' 'libtool')
source=("git://git.sv.gnu.org/$_gitname.git" version.patch)
url="http://www.gnu.org/software/guile/"
md5sums=('SKIP'
         'db49b36d3c02ed4eb2d44609e9838e39')

pkgver() {
  cd $_gitname
  git describe --tags |sed 's+-+.+g'|sed 's+^v++'
}

build() {
  cd $_gitname
  ./autogen.sh
  ./configure --prefix=/usr --disable-error-on-warning \
	--program-suffix=3.0
  make LDFLAGS+="-lpthread"
}

package() {
  cd $_gitname
  make DESTDIR="$pkgdir/" install
  cd $pkgdir/usr/share/info
  for i in guile*
  do
    mv $i guile-3.0${i#guile}
  done
  mv r5rs.info r5rs-3.0.info
  mv $pkgdir/usr/share/aclocal/guile.m4 $pkgdir/usr/share/aclocal/guile-3.0.m4
  rm $pkgdir/usr/lib/libguile-3.0.so.0.0.0-gdb.scm
}
