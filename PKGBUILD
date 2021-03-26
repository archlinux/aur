# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=guile-git
epoch=1
_majorver=3.0
pkgver=3.0.5.r139.g498564e3e
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
source=("git+https://git.savannah.gnu.org/git/${pkgname%-git}.git" rename_infofile.diff rename_infofile2.diff)
url="http://www.gnu.org/software/guile/"
sha256sums=('SKIP'
            'abd56cf6686d0a2563ffdac23cf482623b2a075cfd37242dd57ec8b2f9ff7510'
            '92a567547a21add555487f0979a618de2e6daf25bd0d483866d62ca18fe12140')

pkgver() {
  cd ${pkgname%-git}
  git describe --tags | sed 's+-+.r+' | sed 's+^v++' | tr - .
}

prepare() {
  cd ${pkgname%-git}
  git apply "$srcdir"/rename_infofile.diff
  git apply "$srcdir"/rename_infofile2.diff
  cd doc/ref
  mv guile.texi guile-3.0.texi 
}

build() {
  cd ${pkgname%-git}
  ./autogen.sh
  ./configure --prefix=/usr --program-suffix=${_majorver}
#  echo "@set EFFECTIVE-VERSION ${_majorver}" > doc/ref/effective-version.texi
  make LDFLAGS+=" -lpthread" -j1
}

package() {
  cd ${pkgname%-git}
  make DESTDIR="$pkgdir/" install

  install -Dm644 "$pkgdir"/usr/share/aclocal/guile.m4 "$pkgdir"/usr/share/aclocal/guile-${_majorver}.m4
  rm "$pkgdir"/usr/share/aclocal/guile.m4
  rm "$pkgdir"/usr/lib/libguile-3.0.so.*-gdb.scm
}
