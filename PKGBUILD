# Maintainer: Benjamin Bukowski <benjamin.bukowski@gmail.com>
pkgname=firebird-superserver
_pkgver=2.5.4.26856
_buildver=0
pkgver=${_pkgver}_${_buildver}
pkgrel=2
pkgdesc="A open source SQL relational database management system (RDMS)"
arch=('i686' 'x86_64')
url="http://www.firebirdsql.org/"
license=('custom:IPL' 'custom:IDPL')
provides=("libfbclient=${_pkgver}")
depends=('icu' 'libedit')
conflicts=('firebird-classicserver' 'libfbclient')
options=('!makeflags')
install=firebird-superserver.install

source=("http://downloads.sourceforge.net/firebird/Firebird-$_pkgver-$_buildver.tar.bz2"
        'firebird-tmpfiles.conf'
        'firebird-systemd.service')
md5sums=('7a17ec9889424b98baa29e001a054434'
         '98eff99fd8d195a45c251610d67bd473'
         'ee9068e9bfdfa01e9dc79c72d1bfcdd8')

build() {
  cd $srcdir/Firebird-$_pkgver-$_buildver
  
  ./configure --prefix=/opt/firebird --libdir=/usr/lib --includedir=/usr/include \
              --enable-superserver --with-system-icu --with-system-editline
  
  make
}

package() {
  cd $srcdir/Firebird-$_pkgver-$_buildver/gen
  
  ./install/makeInstallImage.sh 
  
  cd $srcdir/Firebird-$_pkgver-$_buildver
  
  cp -av gen/buildroot/* $pkgdir/
  
  install -Dm644 $srcdir/firebird-systemd.service $pkgdir/usr/lib/systemd/system/firebird.service
  install -Dm644 $srcdir/firebird-tmpfiles.conf $pkgdir/usr/lib/tmpfiles.d/firebird.conf
  install -Dm644 $pkgdir/opt/firebird/IPLicense.txt $pkgdir/usr/share/licenses/IPLicense.txt
  install -Dm644 $pkgdir/opt/firebird/IDPLicense.txt $pkgdir/usr/share/licenses/IDPLicense.txt
  touch $pkgdir/opt/firebird/{fb_guard,firebird.log}
  
  rm $pkgdir/opt/firebird/I{,D}PLicense.txt
 
  cat << EOT > $pkgdir/opt/firebird/SYSDBA.password
# This is the default password
# You should change this password at the earliest oportunity
# Your password can be changed to a more suitable one using the
# /opt/firebird/bin/gsec utility
ISC_USER=SYSDBA
ISC_PASSWD=masterkey
EOT

  if [ -x $pkgdir/opt/firebird/bin/fbmgr.bin ]; then
    cat > $pkgdir/opt/firebird/bin/fbmgr << EOT
#!/bin/sh
FIREBIRD=/opt/firebird
export FIREBIRD
exec /opt/firebird/bin/fbmgr.bin \$@
EOT
  fi

  chmod u=rw,go= $pkgdir/opt/firebird/{fb_guard,firebird.log,security2.fdb}
  chmod -R ugo-w $pkgdir/opt/firebird/examples
  chmod u=r,go= $pkgdir/opt/firebird/SYSDBA.password
  chmod ugo+x $pkgdir/opt/firebird/bin/fbmgr
}


# vim:set ts=2 sw=2 et:
