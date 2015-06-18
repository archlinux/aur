# $Id$
# Maintainer: Andrew Nelless <andrew+aur@nelless.net>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Zerial <fernando@zerial.org>

pkgname=unrealircd-pie
pkgver=3.2.10.4
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
md5sums=('ea4e303a9783f703ecf7769d4c07a124'
         '677d8de0bae770488a2c1730f9475a51'
         '3ec519ea7dbe99696eb6c51dfc0d382a'
         '5f4bf9f99f6c78bc9e6ee4ec66b021fa'
	 '939998a9ea163375ca3ecba457406adc')

prepare() {
  cd $srcdir/Unreal$pkgver
  patch -p1 <$srcdir/arch-fixes.patch
  patch -p1 <$srcdir/pie.patch
}

build() {
  cd $srcdir/Unreal$pkgver

  CPPFLAGS=`echo $CPPFLAGS | sed -E 's/\-D_FORTIFY_SOURCE(=[0-9]+)?//g'`
  CPPFLAGS="$CPPFLAGS -D_FORTIFY_SOURCE=2"

  CFLAGS=`echo $CFLAGS | sed -E 's/\-fstack-protector(\-strong)?//g' |\
  		sed -E 's/\-\-param=ssp\-buffer\-size=[0-9]+//g'`
  CFLAGS="$CFLAGS -D_FORTIFY_SOURCE=2 -fstack-protector-all -Wstack-protector"

  LDFLAGS=`echo $LDFLAGS | sed -E 's/,\-z,now(,)?/\1/g;s/,\-z,relro(,)?/\1/g'`
  LDFLAGS="$LDFLAGS -Wl,-z,relro,-z,now"

  echo $CFLAGS
  echo $CPPFLAGS
  echo $LDFLAGS

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
