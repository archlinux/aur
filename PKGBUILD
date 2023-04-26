# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Francois Menning <f.menning@protonmail.com>
# Contributor: Justin Dray <justin@dray.be
# Contributor: Jaroslaw Swierczynski <swiergot@aur.archlinux.org>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=preload
pkgver=0.6.4
pkgrel=9
arch=(x86_64)
pkgdesc='Makes applications run faster by prefetching binaries and shared objects'
url=http://sourceforge.net/projects/preload
license=(GPL2)
depends=(bash glib2)
makedepends=(help2man)
backup=(etc/preload.conf)
options=('!makeflags')
install=$pkgname.install
source=("http://downloads.sourceforge.net/sourceforge/preload/$pkgname-$pkgver.tar.gz"
        preload.service)

build() {
  cd $pkgname-$pkgver

  ./configure --prefix=/usr \
              --localstatedir=/var \
              --mandir=/usr/share/man \
              --sbindir=/usr/bin \
              --sysconfdir=/etc
  make
}

package() {
  make -C $pkgname-$pkgver DESTDIR="$pkgdir/" sysconfigdir=/etc/conf.d install

  install -Dm644 preload.service "$pkgdir/usr/lib/systemd/system/preload.service"

  rm -rf "$pkgdir/etc/rc.d"
  rm -rf "$pkgdir/var/lib/preload/preload.state"
  rm -rf "$pkgdir/var/log/preload.log"

  sed -r -i 's#^((map|exe)prefix =) (.+)$#\1 /opt;\3#' "$pkgdir/etc/preload.conf"
}
sha256sums=('d0a558e83cb29a51d9d96736ef39f4b4e55e43a589ad1aec594a048ca22f816b'
            '04ad03674aa8b9a79de43a958653ca571c117ce1c044899cf7916a5c8bf08f7d')
