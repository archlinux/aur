# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=guile-git
_gitname=guile
pkgver=2.2.2.4.g7ac3d17ce
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
source=("git://git.sv.gnu.org/$_gitname.git" version.patch)
url="http://www.gnu.org/software/guile/"
md5sums=('SKIP'
         'db49b36d3c02ed4eb2d44609e9838e39')

pkgver() {
  cd $_gitname
  git describe --tags |sed 's+-+.+g'|sed 's+^v++'
}

prepare() {
  cd $_gitname
  patch -Np1 < $srcdir/version.patch || true
  cd meta
  mv guile-2.2-uninstalled.pc.in guile-2.3-uninstalled.pc.in
  mv guile-2.2.pc.in guile-2.3.pc.in
}

build() {
  cd $_gitname
  ./autogen.sh
  ./configure --prefix=/usr --disable-error-on-warning \
	--program-suffix=2.3
  make LDFLAGS+="-lpthread"
}

package() {
  cd $_gitname
  make DESTDIR="$pkgdir/" install
  cd $pkgdir/usr/share/info
  for i in guile*
  do
    mv $i guile-2.3${i#guile}
  done
  mv r5rs.info r5rs-2.3.info
  mv $pkgdir/usr/share/aclocal/guile.m4 $pkgdir/usr/share/aclocal/guile-2.3.m4
  rm $pkgdir/usr/lib/libguile-2.3.so.1.2.0-gdb.scm
}
