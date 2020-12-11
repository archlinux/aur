# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=guile-git
epoch=1
_majorver=3.0
pkgver=3.0.4.r38.g64c89458e
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
source=("git+https://git.savannah.gnu.org/git/${pkgname%-git}.git" rename_infofile.diff)
url="http://www.gnu.org/software/guile/"
sha256sums=('SKIP'
            '555e6d5491ddbe66a30fdec4a8e1897d4bbbb4131083b831e41af33c172010b9')

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
  ./autogen.sh
  ./configure --prefix=/usr --program-suffix=${_majorver}
  make LDFLAGS+=" -lpthread"
}

package() {
  cd ${pkgname%-git}
  make DESTDIR="$pkgdir/" install

  mv "$pkgdir"/usr/share/aclocal/guile.m4 "$pkgdir"/usr/share/aclocal/guile-${_majorver}.m4
  rm "$pkgdir"/usr/lib/libguile-3.0.so.*-gdb.scm
}
