# $Id$
# Maintainer: Andrew Nelless <andrew+aur@nelless.net>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Zerial <fernando@zerial.org>

pkgname=unrealircd-pie
pkgver=3.2.10.6
pkgrel=1
pkgdesc="Open Source IRC Server (hardened)"
arch=('i686' 'x86_64')
url="http://unrealircd.com"
license=('GPL2')
depends=('openssl' 'curl' 'c-ares' 'tre=0.8.0')
makedepends=('sed')
conflicts=('ircd' 'unrealircd')
provides=('ircd' 'unrealircd')
backup=('etc/unrealircd/unrealircd.conf')
install=unrealircd.install
source=(http://www.unrealircd.com/downloads/Unreal$pkgver.tar.gz
	unrealircd.service
	unrealircd.tmpfiles.d
	arch-fixes.patch
        pie.patch)
sha256sums=('842c217f1c1f776e6c9a0db11be7aa031892647c7635f3827f68826509e704e0'
            '0a6d3c269ba5379f967b2ec035ad4c6226d42ce22ffaaf8c3e5b37ba8ee02ddd'
            '2b2efb4b87b5b270e87fc0187ac1c559d41a41e6c81615182dc2bdd18bfcaccd'
            'c18cd686c30f0f44a22eac25891f6fd0da696b1e1fb0646e7e40627dee5f476f'
            '9107f7d252a183dd209ec860ed71b87e2516f9f6bb14cf6addda9e0d92c594fa')

prepare() {
  cd $srcdir/Unreal$pkgver
  patch -p1 <$srcdir/arch-fixes.patch
  patch -p1 <$srcdir/pie.patch
}

build() {
  cd $srcdir/Unreal$pkgver

  CPPFLAGS=`echo $CPPFLAGS | sed -E 's/\-D_FORTIFY_SOURCE(=[0-9]+)?//g'`
  CPPFLAGS="$CPPFLAGS -D_FORTIFY_SOURCE=2"

  CFLAGS=`echo $CFLAGS | sed -E 's/\-fstack-protector(\-(all|strong))?//g' |\
  		sed -E 's/\-\-param=ssp\-buffer\-size=[0-9]+//g'`
  CFLAGS="$CFLAGS -D_FORTIFY_SOURCE=2 -fstack-protector-all -Wstack-protector"

  LDFLAGS=`echo $LDFLAGS | sed -E 's/,\-z,now(,)?/\1/g;s/,\-z,relro(,)?/\1/g'`
  LDFLAGS="$LDFLAGS -Wl,-z,relro,-z,now"

#  echo $CFLAGS
#  echo $CPPFLAGS
#  echo $LDFLAGS

  ac_cv_ip6=yes ./configure --with-showlistmodes \
      --enable-prefixaq --with-listen=5 \
      --with-dpath=/etc/unrealircd \
      --with-spath=/usr/bin \
      --with-nick-history=2000 --with-sendq=3000000 \
      --with-bufferpool=18 \
      --with-permissions=0600 --with-fd-setsize=1024 \
      --enable-dynamic-linking \
      --enable-ziplinks \
      --enable-ssl \
      --enable-inet6 \
      --enable-libcurl=/usr \
      --with-system-tre \
      --with-system-cares
  make
}

package() {
  cd $srcdir/Unreal$pkgver

  mkdir -p $pkgdir/etc/unrealircd
  mkdir -p $pkgdir/usr/bin

  make IRCDDIR=$pkgdir/etc/unrealircd BINDIR=$pkgdir/usr/bin install

  mv $srcdir/Unreal$pkgver/src/ircd $pkgdir/usr/bin/unrealircd
  mv $srcdir/Unreal$pkgver/doc/example.conf $pkgdir/etc/unrealircd/unrealircd.conf
  mkdir -p $pkgdir/usr/lib/unrealircd
  mv $pkgdir/etc/unrealircd/modules $pkgdir/usr/lib/unrealircd/
  ln -s /usr/lib/unrealircd/modules $pkgdir/etc/unrealircd/modules

  # log
  mkdir -p $pkgdir/var/log/unrealircd/
  touch $pkgdir/var/log/unrealircd/ircd.log
  ln -s /var/log/unrealircd/ircd.log $pkgdir/etc/unrealircd/ircd.log

  find $pkgdir/usr -type f -exec chmod ugo+r {} \;
  find $pkgdir/usr -type d -exec chmod ugo+rx {} \;

  rm -f $pkgdir/etc/unrealircd/unreal
  install -Dm0644 $srcdir/unrealircd.service $pkgdir/usr/lib/systemd/system/unrealircd.service
  install -Dm0644 $srcdir/unrealircd.tmpfiles.d $pkgdir/usr/lib/tmpfiles.d/unrealircd.conf
}
