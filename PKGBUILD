# Maintainer: Nikolaos Bezirgiannis <bezeria@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Jachym Barvinek <jachymb@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: John Proctor <jproctor@prium.net>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>

pkgname=swi-prolog-devel-git
pkgver=7.3.1.r62.g80809e1
pkgrel=1
pkgdesc='Prolog environment (latest git development version)'
arch=('x86_64' 'i686')
url='http://www.swi-prolog.org/'
license=('GPL' 'LGPL')
depends=('gmp' 'readline' 'openssl' 'libarchive')
makedepends=('libxft' 'libjpeg' 'unixodbc' 'libxpm' 'libxinerama')
optdepends=('unixodbc: for using the odbc4pl library'
            'libjpeg: for using the pl2xpce library'
            'libxpm: for using the pl2xpce library'
            'libxinerama: for using the pl2xpce library'
            'libxft: for using the pl2xpce library')
#options=('!makeflags')
source=("git://github.com/SWI-Prolog/swipl-devel")
sha256sums=('SKIP')
conflicts=('swi-prolog')
provides=('swi-prolog')

pkgver() {
  cd "$srcdir/swipl-devel"
  git describe --long | sed -r 's/^V//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/swipl-devel"
  # fix submodules url
  sed -i -e 's,\.\.,git://github.com/SWI-Prolog,g' .gitmodules
  git submodule update --init
}

build() {
  cd "${srcdir}/swipl-devel"

  echo 2 | ./configure --prefix=/usr --with-world
  cd src
  ./configure --enable-readline --prefix=/usr
  cd ..
  make
}

package() {
  cd "${srcdir}/swipl-devel"        
  make DESTDIR="$pkgdir" install

  _tag=$(< VERSION) # read the VERSION file instead of the tag, because it is better updated

  # Fix for FS#20873
  chmod +x "$pkgdir/usr/lib/swipl-${_tag}/library/dialect/sicstus/swipl-lfr.pl"
}

