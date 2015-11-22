# $Id$
# Maintainer: AndyRTR <andyrtr@archlinux.org>

# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: royrocks <royrocks13@gmail.com>

pkgname=libpaper
pkgver=1.1.24
pkgrel=9
pkgdesc='Library for handling paper characteristics'
arch=('x86_64' 'i686')
url='http://packages.debian.org/unstable/source/libpaper'
license=('GPL')
depends=('sh' 'run-parts')
backup=('etc/papersize')
source=("http://ftp.de.debian.org/debian/pool/main/libp/$pkgname/${pkgname}_$pkgver+nmu4.tar.gz")
md5sums=('155d2e589e2f4ef163de8fbbc5d3dd1e')

build() {
  cd "$pkgname-$pkgver+nmu4"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --sbindir=/usr/bin
  make
}

package() {
  cd "$pkgname-$pkgver+nmu4"
  make DESTDIR="$pkgdir" install
  
  # add systemwide default papersize read by many office applications
  install -dm 755 $pkgdir/etc
  echo '# Simply write the paper name. See papersize(5) for possible values' > $pkgdir/etc/papersize

  # add libpaper.d directory other packages can use to store files
  install -dm 755 $pkgdir/etc/libpaper.d

  # add localisation
  pushd debian/po
  for i in `ls *.po`; do
	install -dm 755 ${pkgdir}/usr/share/locale/${i%.po}/LC_MESSAGES/;
	msgfmt $i -o ${pkgdir}/usr/share/locale/${i%.po}/LC_MESSAGES/${pkgname}.mo;
  done
  popd
}
