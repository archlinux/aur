# Maintainer: Simone Gaiarin <simgunz@gmail.com>

pkgname=dell-smm-hwmon-i8kutils
pkgver=4.9.34
pkgrel=2
pkgdesc="Patched version of the dell-smm-hwmon kernel module and smm executable. This allows to disable the bios
fan controller on some dell laptops so that the i8kutils driver can work without conflicts."
url='https://github.com/vitorafsr/i8kutils/issues/6/'
arch=('any')
license=('GPL')
depends=('linux49')
makedepends=('linux49-headers')
install='dell-smm-hwmon-i8kutils.install'
source=("https://cdn.kernel.org/pub/linux/kernel/v4.x/linux-$pkgver.tar.xz"
        'dell-smm-hwmon.patch'
        'smm.c')
md5sums=('92aaa07c90e1c7de60fcdd8a9726dd59'
         'ccfe8a74d9cbf587d5a9cb395cae2834'
         'a5e33f4c632c3055bd51853edeef51fc')

prepare() {
  cd "$srcdir/linux-$pkgver"
  patch -p0 < ../dell-smm-hwmon.patch
  make mrproper
  cp "/usr/lib/modules/$(uname -r)/build/.config" ./
  cp "/usr/lib/modules/$(uname -r)/build/Module.symvers" ./
}

build() {
  cd "$srcdir"
  gcc -o smm smm.c
  cd "$srcdir/linux-$pkgver"
  make prepare
  make scripts
  make M=drivers/hwmon
  gzip ./drivers/hwmon/dell-smm-hwmon.ko
}

package() {
  mkdir -p "${pkgdir}/usr/lib/modules/$(uname -r)/updates/"
  cp "${srcdir}/linux-$pkgver/drivers/hwmon/dell-smm-hwmon.ko.gz" "${pkgdir}/usr/lib/modules/$(uname -r)/updates/"
  mkdir -p "${pkgdir}/usr/bin/"
  cp "${srcdir}/smm" "${pkgdir}/usr/bin/"
}
