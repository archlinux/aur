pkgname=i8kutils
pkgver=1.42
pkgrel=5
pkgdesc="Fan control for Dell laptops"
arch=('i686' 'x86_64')
url="https://launchpad.net/i8kutils"
license=('GPL')
depends=('bash')
optdepends=('tcl: for i8kmon daemon' 'acpi: for i8kmon daemon' 'tk: for i8kmon GUI mode')
backup=('etc/i8kutils/i8kmon.conf')
source=(https://launchpad.net/i8kutils/trunk/${pkgver}/+download/i8kutils_${pkgver}.tar.xz
        i8kmon.service
	fix_Makefile.patch
	fix_i8kmon_toggle_fan.patch)

sha1sums=('6c32176a94ae6e0f6969880ac7ab8ac76b476143'
          '5c20f5241de7e60b46117269f4e867b08734cdc8'
          'fe5407464f59c023c5b52fdadd3275abdac720a4'
          '5d1eb0f34c8466acbb0746c08ad7ed0c699bcb1c')

prepare() {
  cd $srcdir
  patch -p0 -i fix_Makefile.patch
  patch -p0 -i fix_i8kmon_toggle_fan.patch
  cd $pkgname
  # conform to Arch Linux guidelines
  sed -i 's|/etc/i8kmon|/etc/i8kutils/i8kmon.conf|g' i8kmon.1
  sed -i 's|/etc/i8kmon.conf|/etc/i8kutils/i8kmon.conf|g' i8kmon
  make clean
}

build() {
  cd $pkgname
  make
}

package() {
  cd $pkgname
  install -d "$pkgdir"/usr/{bin,share/man/man1}
  install -D -m644 i8kctl.1 i8kmon.1 "$pkgdir/usr/share/man/man1"
  install -D -m755 i8kctl i8kfan i8kmon "$pkgdir/usr/bin"

  install -D -m644 i8kmon.conf "$pkgdir/etc/i8kutils/i8kmon.conf"
  install -D -m644 ../i8kmon.service "$pkgdir/usr/lib/systemd/system/i8kmon.service"
}
