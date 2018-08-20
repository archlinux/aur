# Maintainer: Benjamin Bukowski <bbukowski@posteo.de>
pkgname=firebird-superserver
_pkgver=2.5.8
pkgver=$_pkgver.27089
pkgrel=3
pkgdesc="A open source SQL relational database management system (RDMS)"
arch=('i686' 'x86_64')
url="http://www.firebirdsql.org/"
license=('custom:IPL' 'custom:IDPL')
depends=('icu' 'libedit')
provides=("libfbclient=$pkgver")
conflicts=('firebird-classicserver' 'libfbclient')
options=('!makeflags')
install=firebird-superserver.install

source=("https://github.com/FirebirdSQL/firebird/releases/download/R${_pkgver//./_}/Firebird-${pkgver}-0.tar.bz2"
        'default.password'
        'firebird-tmpfiles.conf'
        'firebird-sysusers.conf'
        'firebird.service'
        'firebird-icu60.patch'
        'firebird-gcc6.patch'
        'firebird-libio.patch')

md5sums=('38862a3da39cf91f4f2366fb510f18a6'
         'ee601f52f1ba2481fe1f05b25d000bb8'
         '79a1416e307e4dfb99640311b8defe07'
         'a43ab472f4d95e48ac21910bb33a5e86'
         '90b4631c9bff99aab08511b3a184593e'
         '70197fc801f9c66a6a1d7710e0c63718'
         '9ab88cfcda674f9d28850a4f86f23741'
         '8e7cac6da439c8798dccf6d4b4e457db')

prepare() {
    cd $srcdir/Firebird-$pkgver-0
    patch -Np1 -i ../firebird-icu60.patch
    patch -Np1 -i ../firebird-gcc6.patch
    patch -Np1 -i ../firebird-libio.patch
}

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
    --with-fblog=/var/log/ \
    --with-fbmsg=/usr/lib/firebird/msg \
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

    make
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

  mv $pkgdir/usr/bin/isql{,-fb}

  chmod -R ugo-w $pkgdir/usr/share/doc/firebird
  chmod -R o= $pkgdir/var/lib/firebird
  chown -R 184:184 $pkgdir/var/lib/firebird
}

# vim:set ts=2 sw=2 et:
