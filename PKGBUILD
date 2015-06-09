# Maintainer: Alexandre Demers <alexandre.f.demers@gmail.com>

_gitname=libgcrypt
_setPrefix="/usr"
_setLibdir="$_setPrefix/lib32"
_pkgbase=libgcrypt15-git

pkgname=lib32-$_pkgbase
pkgver=1.5.4.r3.g35cd81f
pkgrel=1
pkgdesc="General purpose cryptographic library based on the code from GnuPG. Latest commit from 1.5 branch - API version 11 (32bit)."
arch=('x86_64')
url="http://www.gnupg.org"
license=('GPL2')
depends=('lib32-libgpg-error')
makedepends=('git'
             'transfig'
             'gcc-multilib'
             'automake'
             'ghostscript')
provides=("lib32-libgcrypt=${pkgver}"
		  "lib32-libgcrypt15=${pkgver}")
conflicts=("lib32-libgcrypt15"
           "lib32-libgcrypt11")

source=(git://git.gnupg.org/libgcrypt.git#branch=LIBGCRYPT-1-5-BRANCH)
sha1sums=('SKIP')

pkgver() {
  cd "${srcdir}/$_gitname"
  git describe --long | sed -r 's/^libgcrypt-//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  export CFLAGS="-m32"
  export CXXFLAGS="-m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  setHost="i686-pc-linux-gnu"

  cd "$srcdir/$_gitname"
  ./autogen.sh --force
  automake --add-missing

  ./configure --enable-maintainer-mode \
              --prefix=/usr \
              --disable-static \
              --disable-padlock-support \
              --host=$setHost \
              --libdir=$_setLibdir \
              --prefix=$_setPrefix
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
