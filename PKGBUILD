# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=guile-git
epoch=1
_majorver=3.0
pkgver=3.0.5.r140.g01bfd18f3
pkgrel=1
pkgdesc="A portable, embeddable Scheme implementation (Git snapshot)"
arch=('i686' 'x86_64' 'aarch64')
license=('GPL')
makedepends=('git')
optdepends=('texinfo: for using texinfo scheme sources')
depends=('gc' 'libxcrypt' 'libffi' 'libunistring' 'gmp' 'readline')
provides=('guile')
conflicts=('guile4emacs')
options=('!strip' '!makeflags' 'libtool')
source=("git+https://git.savannah.gnu.org/git/${pkgname%-git}.git" rename_infofile.diff)
url="http://www.gnu.org/software/guile/"
sha256sums=('SKIP'
            'b2674297c0b4ceba1f94616f04a1bf3ae5586cc27433978a5e7e35b71e2ad53f')

pkgver() {
  cd ${pkgname%-git}
  git describe --tags | sed 's+-+.r+' | sed 's+^v++' | tr - .
}

prepare() {
  cd ${pkgname%-git}
  git apply "$srcdir"/rename_infofile.diff
  cd doc/ref
  mv guile.texi guile-3.0.texi 
}

build() {
  cd ${pkgname%-git}
  top_srcdir="$srcdir"/${pkgname%-git} top_builddir=$top_srcdir ./autogen.sh
  ./configure --prefix=/usr --program-suffix=${_majorver}
  make LDFLAGS+=" -lpthread" || true
  cd doc/ref
  echo "@set EFFECTIVE-VERSION ${_majorver}" > effective-version.texi
  GUILE_AUTO_COMPILE=0 "$srcdir"/${pkgname%-git}/meta/build-env guild snarf-guile-m4-docs "$srcdir"/${pkgname%-git}/meta/guile.m4 >autoconf-macros.texi
  make 
}

package() {
  cd ${pkgname%-git}
  make DESTDIR="$pkgdir/" install

  install -Dm644 "$pkgdir"/usr/share/aclocal/guile.m4 "$pkgdir"/usr/share/aclocal/guile-${_majorver}.m4
  rm "$pkgdir"/usr/share/aclocal/guile.m4
  rm "$pkgdir"/usr/lib/libguile-3.0.so.*-gdb.scm
}
