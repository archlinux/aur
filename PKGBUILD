# Maintainer: Simone Gaiarin <simgunz@gmail.com>,
# Szymon Łukaszewicz <taurthil@gmail.com>

pkgname=dell-smm-hwmon-i8kutils
pkgver=5.1.14
pkgrel=14
pkgdesc="Patched version of the dell-smm-hwmon kernel module and smm executable. This allows to disable the bios
fan controller on some dell laptops so that the i8kutils driver can work without conflicts."
url='https://github.com/vitorafsr/i8kutils/issues/6/'
arch=('any')
license=('GPL')
depends=('linux')
makedepends=('linux-headers')
install='dell-smm-hwmon-i8kutils.install'
source=("https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-$pkgver.tar.xz"
        'dell-smm-hwmon.patch'
        'smm.c')
md5sums=(
  'a55212a18f49a028db389963379a3100'
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
