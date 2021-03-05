pkgname=rtl8189es-git
_pkgbase=${pkgname%-*-*}
pkgver="03ac413"
pkgrel=1
pkgdesc="RTL8189ES / RTL8189ETV modules"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/jwrdegoede/rtl8189ES_linux"
license=('GPL2')
kernelver=5.11.2-1
depends=('linux'=$kernelver)
makedepends=('git' 'cmake' 'linux-headers')
conflicts=("${_pkgbase}")
source=("git+${url}#tag=$pkgver"
        "$pkgname.install")
install=$pkgname.install
md5sums=('SKIP' '1b2036f0ea571b973abc20962d255a82')
kernelver=5.11.2-1
procs_num=$(nproc)

#_extramodules=extramodules-`uname -r | cut -d . -f 1,2`-ARCH

build() {
  cd ${srcdir}/rtl8189ES_linux
  make ARCH=arm -j$procs_num KSRC="/usr/lib/modules/${kernelver}-ARCH/build/" CONFIG_POWER_SAVING=n CONFIG_WIFI_MONITOR=y
}

package(){
  cd ${srcdir}/rtl8189ES_linux

  file_dir="$pkgdir/usr/lib/modules/${kernelver}-ARCH/kernel/drivers/net/wireless/realtek/rtlwifi/rtl8189es"
  mkdir -p $file_dir
  install -Dm644 "8189es.ko" "$file_dir/8189es.ko"
  gzip -9 "$file_dir/8189es.ko"
}