# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: dsa <dsa@unilestemg.br>
# Conributer: gerbra <gerbra@derbrauer.homelinux.net>
# Conributer: Joker-jar <joker-jar@yandex.ru>
# Maintainer: josephgbr <rafael.f.f1@gmail.com>

pkgname=ncpfs
pkgver=2.2.6
pkgrel=11
pkgdesc="Utilities to use resources from Novell NetWare servers"
url="http://www.novell.com/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('linux' 'pam')
_url="http://ftp.de.debian.org/debian/pool/main/n/$pkgname"
source=("${_url}/${pkgname}_${pkgver}.orig.tar.gz"
        '01-linux3.0_uname.patch'
        '02-legacy.patch'
        '03-multiple_security_issues.patch'
        '04-drop-mtab-support.patch'
        '05-ldflags.patch'
        '06-makefile-remove-generated.patch')
md5sums=('a9ab9f135d504440202069393dd9eb36'
         'e3e3c7c148fff31162175af02f8111a7'
         '20e438bdd8c141b4b604aaf30a3f5f4a'
         '4b0de0263d1d4b91b3520d2eb0cda3a8'
         '5ab557986d02c2cf26f10db42ffb9f02'
         '52fce52a2ccd0dd27cf100ff277d273e'
         '660e851a1f6ab6e9f5464006de844b7e')

# USERS: set this to 1 to enable PHP support
_with_php=0
if [ $_with_php -eq 1 ]; then
  makedepends=('php')
  optdepends=('php: PHP NCP authentication support')
fi

prepare() {
  cd $pkgname-$pkgver
  patch -p1 -i "$srcdir"/01-linux3.0_uname.patch
  patch -p1 -i "$srcdir"/02-legacy.patch
  patch -p1 -i "$srcdir"/03-multiple_security_issues.patch
  patch -p1 -i "$srcdir"/04-drop-mtab-support.patch
  patch -p1 -i "$srcdir"/05-ldflags.patch
  patch -p1 -i "$srcdir"/06-makefile-remove-generated.patch
  # set to use sbindir variable, instead of hardcoded sbin dir
  sed -i 's/sbin/$(sbindir)/' sutil/Makefile.in
  # eliminate warning of deprecation of _BSD_SOURCE in favor of _DEFAULT_SOURCE
  sed -i 's/_BSD_SOURCE/_DEFAULT_SOURCE/' contrib/pam/pam_ncp_auth.c
}

build() {
  cd $pkgname-$pkgver
  
  # libs should go /usr/lib
  export ncp_cv_pam_directory='/usr/lib/security'

  if [ $_with_php -eq 1 ]; then
    ./configure --prefix=/usr --sbindir=/usr/bin --mandir=/usr/share/man
    sed 's/function_entry/zend_function_entry/' -i contrib/php/php_auth_nds.c
  else
    ./configure --prefix=/usr --sbindir=/usr/bin --mandir=/usr/share/man --disable-php
  fi
  
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install install-dev
  # fix symlinks for libncp.so.2.3.0
  rm "$pkgdir"/usr/lib/libncp.so
  ln -s libncp.so.2.3.0 "$pkgdir"/usr/lib/libncp.so
  ln -s libncp.so.2.3.0 "$pkgdir"/usr/lib/libncp.so.2.3
  # fix symlinks for ncpmount
  rm "$pkgdir"/usr/bin/mount.{ncp,ncpfs}
  ln -s ncpmount "$pkgdir"/usr/bin/mount.ncp
  ln -s ncpmount "$pkgdir"/usr/bin/mount.ncpfs
}
