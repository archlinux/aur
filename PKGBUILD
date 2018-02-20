# Maintainer: John Lane <archlinux at jelmail dot com>
# Contributor: Nathan Owe <ndowens.aur at gmail dot com>

pkgname=dcc
pkgver=1.3.162
pkgrel=1
pkgdesc="Distributed Checksum Clearinghouse spam tool"
url="http://www.rhyolite.com/anti-spam/dcc/"
arch=('i686' 'x86_64')
license=('custom')
depends=('sh')
source=(http://www.rhyolite.com/anti-spam/dcc/source/old/$pkgname-$pkgver.tar.Z)
sha256sums=('f98413df06d1c25a56cafc016adf9e3348ccce6bc575ea5b7d12556b8e83bc91')

build() {
  cd $srcdir/$pkgname-$pkgver
  CPPFLAGS="$CPPFLAGS -O2" # https://bbs.archlinux.org/viewtopic.php?id=182812
  ./configure --with-installroot=${pkgdir} \
  --mandir=/usr/share/man --homedir=/opt/dcc \
  --bindir=/usr/bin --libexecdir=/usr/lib/dcc
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  MAKEFLAGS="$MAKEFLAGS -j1" # AUR comment zmeYski 2014-10-14 17:57
  make DESTDIR=${pkgdir}/ install
  install -d $pkgdir/usr/share/licenses/$pkgname
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
  
  #Fix file permissions
  find $pkgdir/ -group bin -exec chgrp root {} \;
  find $pkgdir/ -user bin -exec chown root {} \;
  find $pkgdir/opt/dcc -type f -exec chmod 644 {} \;
  chmod 755 $pkgdir/opt/dcc/log	
    

}

