pkgname=i8kutils
pkgver=1.43
pkgrel=3
pkgdesc="Fan control for Dell laptops"
arch=('i686' 'x86_64')
url="https://launchpad.net/i8kutils"
license=('GPL v2')
depends=('bash')
optdepends=('tcl: for i8kmon daemon' 'acpi: for i8kmon daemon')
backup=('etc/i8kutils/i8kmon.conf')
source=(https://launchpad.net/i8kutils/trunk/${pkgver}/+download/i8kutils_${pkgver}.tar.xz
        i8kmon.service)

sha1sums=('46204f9a567bbbc2267d67269c5bbbfad4187799'
          '251660c03249b82de6e3212440524b57398c2657')

prepare() {
  cd $pkgname
  # conform to Arch Linux guidelines
  sed -i 's|/etc/i8kmon.conf|/etc/i8kutils/i8kmon.conf|g' i8kmon.1
  sed -i 's|/etc/i8kmon.conf|/etc/i8kutils/i8kmon.conf|g' i8kmon.conf
  sed -i 's|/etc/i8kmon.conf|/etc/i8kutils/i8kmon.conf|g' i8kmon
  echo "dell-smm-hwmon" > modules-load.d-dell-smm-hwmon.conf
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
  install -D -m644 dell-smm-hwmon.conf "$pkgdir/etc/modprobe.d/dell-smm-hwmon.conf"
  install -D -m644 modules-load.d-dell-smm-hwmon.conf "$pkgdir/etc/modules-load.d/dell-smm-hwmon.conf"
  install -D -m644 debian/i8kmon.service "$pkgdir/usr/lib/systemd/system/i8kmon.service"
  # rmmod dell-smm-hwmon && modprobe dell-smm-hwmon
}
