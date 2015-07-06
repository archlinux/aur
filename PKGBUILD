# Maintainer: Nikolaos Bezirgiannis <bezeria@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Jachym Barvinek <jachymb@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: John Proctor <jproctor@prium.net>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>

pkgname=swi-prolog-git
pkgver=7.2.0.r1.ga0999a2
pkgrel=1
pkgdesc='Prolog environment (latest git stable version)'
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
source=("git://github.com/SWI-Prolog/swipl")
sha256sums=('SKIP')
conflicts=('swi-prolog')
provides=('swi-prolog')

pkgver() {
  cd "$srcdir/swipl"
  git describe --long | sed -r 's/^V//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/swipl"
  # fix submodules url
  sed -i -e 's,\.\.,git://github.com/SWI-Prolog,g' .gitmodules
  git submodule update --init
}

build() {
  cd "${srcdir}/swipl"

  echo 2 | ./configure --prefix=/usr --with-world
  cd src
  ./configure --enable-readline --prefix=/usr
  cd ..
  make
}

package() {
  cd "${srcdir}/swipl"        
  make DESTDIR="$pkgdir" install

  _tag=$(git describe --abbrev=0 --tags | sed -r 's/^V//g')

  # Fix for FS#20873
  chmod +x "$pkgdir/usr/lib/swipl-${_tag}/library/dialect/sicstus/swipl-lfr.pl"
}

