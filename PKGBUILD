pkgname=i8kutils
pkgver=1.55
pkgrel=1
pkgdesc="Fan control for Dell laptops"
arch=('any')
url="https://github.com/Wer-Wolf"
license=('GPL3')
depends=('tcl' 'tcllib')
makedepends=('meson')
optdepends=('acpi: for i8kmon to read the battery status')
backup=("etc/$pkgname/i8kmon.conf"
        "etc/modprobe.d/dell-smm-hwmon.conf")
source=("$pkgname-$pkgver.tar.gz::https://github.com/Wer-Wolf/i8kutils/archive/refs/tags/v$pkgver.tar.gz")

sha256sums=('bc37b2f51a98fb6607a364390ced5688bb817b8d17d182428d44c5bf3ce3f8d9')

prepare() {
  cd $pkgname-$pkgver

  # conform to Arch Linux guidelines
  sed -i 's|/etc/i8kmon.conf|/etc/i8kutils/i8kmon.conf|g' man/i8kmon.1 scripts/i8kmon
  sed -i "s|install_data('i8kmon.conf', install_dir : '/etc'|install_data('i8kmon.conf', install_dir : '/etc/i8kutils'|g" \
    etc/meson.build

  echo "dell-smm-hwmon" > modules-load.d-dell-smm-hwmon.conf
  echo "options dell-smm-hwmon ignore_dmi=1" > modprobe.d-dell-smm-hwmon.conf

  meson setup build --prefix="/usr" -Dmoduledir='/usr/lib/tcl8/8.6'
}

package() {
  cd $pkgname-$pkgver

  meson install -C build --destdir "$pkgdir"

  rm -rf "$pkgdir"/etc/init.d

  install -D -m644 modules-load.d-dell-smm-hwmon.conf "$pkgdir/etc/modules-load.d/dell-smm-hwmon.conf"
  install -D -m644 modprobe.d-dell-smm-hwmon.conf "$pkgdir/etc/modprobe.d/dell-smm-hwmon.conf"
}
