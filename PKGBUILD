# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>

pkgname=macbook12-bluetooth-driver
pkgver=5.4.15
pkgrel=1
pkgdesc="Driver for bluetooth on newer MacBook (Pro) models"
arch=('i686' 'x86_64')
url="https://github.com/leifliddy/macbook12-bluetooth-driver"
license=('GPL2')
source=("https://cdn.kernel.org/pub/linux/kernel/v${pkgver%%.*}.x/linux-$pkgver.tar.xz"
        'bluetooth-remove-set-device-wakeup.patch'
        'Makefile')
noextract=("linux-$pkgver.tar.xz")
md5sums=('39893c474f29a1f57445b9e420cd202d'
         'ff7c2d3a0a168f84b4dce81aec69eefd'
         'a94e2ba612e42b2c5cbfaa8a502b2581')
sha256sums=('6407222f850f685b346011bd696a3216d5df0f37e0184099100d2724396d94b1'
            'cb99a8c710c5a374291394796e976214cfb44da6006f691b5a3b379512da1e96'
            'b07b6fc4b3a6ad60dfd3cd29804f9aaf6922018804bbfb52c8f31bba888b2272')

pkgver() {
  local kernel_version=$(uname -r)
  echo ${kernel_version%%-*}
}

prepare() {
  cd "$srcdir"
  tar xf linux-$pkgver.tar.xz linux-$pkgver/drivers/bluetooth

  cd linux-$pkgver
  patch -Np1 -i ../bluetooth-remove-set-device-wakeup.patch

  cp "$srcdir"/Makefile drivers/bluetooth/
}

build() {
  make -C /lib/modules/$(uname -r)/build M="$srcdir"/linux-$pkgver/drivers/bluetooth modules
}

package() {
  destdir="$pkgdir"/usr/lib/modules/$(uname -r)/updates
  mkdir -p "$destdir"
  cp "$srcdir"/linux-$pkgver/drivers/bluetooth/hci_uart.ko "$destdir"
}
