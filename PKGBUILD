# Maintainer: Benjamin Bukowski <bbukowski@posteo.de>
pkgname=firebird-superserver
pkgver=2.5.7.27050
pkgrel=1
pkgdesc="A open source SQL relational database management system (RDMS)"
arch=('i686' 'x86_64')
url="http://www.firebirdsql.org/"
license=('custom:IPL' 'custom:IDPL')
depends=('icu' 'libedit')
provides=("libfbclient=${pkgver}")
conflicts=('firebird-classicserver' 'libfbclient')
options=('!makeflags')
install=firebird-superserver.install

source=("http://downloads.sourceforge.net/firebird/Firebird-$pkgver-0.tar.bz2"
        'default.password'
        'firebird-tmpfiles.conf'
        'firebird-sysusers.conf'
        'firebird.service')

md5sums=('fb34241e96f9707604bf6cd78357d5a2'
         'ee601f52f1ba2481fe1f05b25d000bb8'
         '79a1416e307e4dfb99640311b8defe07'
         'a43ab472f4d95e48ac21910bb33a5e86'
         'bd75e6d2afcbc000e3593b1a66ea4ef7')

build() {
  cd $srcdir/Firebird-$pkgver-0

  ./autogen.sh \
    --prefix=/usr \
    --with-fbbin=/usr/bin \
    --with-fbconf=/etc/firebird \
    --with-fbdoc=/usr/share/doc/firebird \
    --with-fbglock=/run/firebird \
    --with-fbhelp=/usr/share/doc/firebird/help \
    --with-fbinclude=/usr/include/firebird \
    --with-fblib=/usr/lib \
    --with-fblock=/run/firebird \
    --with-fblog=/var/log/ \
    --with-fbmsg=/var/lib/firebird/system \
    --with-fbplugins=/usr/lib/firebird/plugins \
    --with-fbsbin=/usr/lib/firebird/bin \
    --with-fbudf=/usr/lib/firebird/UDF \
    --with-fbsecure-db=/var/lib/firebird/system \
    --with-fbintl=/usr/lib/firebird/intl \
    --without-fbmisc \
    --without-fbsample \
    --without-fbsample-db \
    --enable-superserver \
    --with-system-icu \
    --with-system-editline

  CXXFLAGS+=' -std=gnu++98 -flifetime-dse=1' make
}

package() {
  cd $srcdir/Firebird-$pkgver-0/gen
  
  ./install/makeInstallImage.sh 
  
  cd $srcdir/Firebird-$pkgver-0
  
  cp -av gen/buildroot/* $pkgdir/
  
  install -Dm644 $srcdir/firebird-tmpfiles.conf $pkgdir/usr/lib/tmpfiles.d/firebird.conf
  install -Dm644 $srcdir/firebird-sysusers.conf $pkgdir/usr/lib/sysusers.d/firebird.conf
  install -Dm644 $srcdir/firebird.service $pkgdir/usr/lib/systemd/system/firebird.service
  install -Dm440 $srcdir/default.password $pkgdir/var/lib/firebird/system/SYSDBA.password
  install -Dm644 $pkgdir/etc/firebird/I{,D}PLicense.txt -t $pkgdir/usr/share/licenses/${pkgname}
  
  # Remove unused files and dirs
  rm $pkgdir/etc/firebird/I{,D}PLicense.txt
  rm $pkgdir/etc/firebird/README
  rm $pkgdir/etc/firebird/WhatsNew
  rm -rf $pkgdir/var/log
  rm -rf $pkgdir/run

  chmod -R ugo-w $pkgdir/usr/share/doc/firebird
  chmod -R o= $pkgdir/var/lib/firebird
  chown -R 184:184 $pkgdir/var/lib/firebird
}

# vim:set ts=2 sw=2 et:
