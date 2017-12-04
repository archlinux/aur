# Maintainer: Alexandre Demers <alexandre.f.demers@gmail.com>

_gitname=libgcrypt
_setPrefix="/usr"
_setLibdir="$_setPrefix/lib"
pkgname=libgcrypt15-git
pkgver=1.5.6.r1.g7104edfc
pkgrel=1
pkgdesc="General purpose cryptographic library based on the code from GnuPG. Latest commit from 1.5 branch - API version 11."
arch=('i686'
      'x86_64')
url="http://www.gnupg.org"
license=('GPL2')
depends=('glibc'
         'libgpg-error')
makedepends=('automake'
             'fig2dev'
             'ghostscript'
             'git')
provides=("libgcrypt=${pkgver}"
		  "libgcrypt15=${pkgver}")
conflicts=("libgcrypt15"
           "libgcrypt11")

source=(git://git.gnupg.org/libgcrypt.git#branch=LIBGCRYPT-1-5-BRANCH)
sha1sums=('SKIP')

pkgver() {
  cd "${srcdir}/$_gitname"
  git describe --long | sed -r 's/^libgcrypt-//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  echo "$srcdir/$_gitname"
  cd "$srcdir/$_gitname"
  ./autogen.sh --force
  automake --add-missing

  ./configure --enable-maintainer-mode \
              --prefix=$_setPrefix \
              --libdir=$_setLibdir \
              --disable-static \
              --disable-padlock-support

  make
}

# check() {
  # cd ${_pkgname}-${pkgver}
  # make check
# }

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="${pkgdir}" install

  rm -rf "$pkgdir/$_setPrefix"/{bin,include,share}
  rm -rf "$pkgdir/$_setLibdir"/libgcrypt.so
}
