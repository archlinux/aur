pkgname=rtl8189es-git
_pkgbase=${pkgname%-*-*}
pkgver="03ac413"
pkgrel=2
pkgdesc="RTL8189ES / RTL8189ETV modules"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/jwrdegoede/rtl8189ES_linux"
license=('GPL2')
kernelver=5.11.2-1
depends=('linux'=$kernelver)
makedepends=('git' 'make' 'linux-headers')
conflicts=("${_pkgbase}")
source=("git+${url}#tag=$pkgver"
        "$pkgname.install")
install=$pkgname.install
md5sums=('SKIP' '7fd21525fa3f7748f9c46eca6900d264')
procs_num=$(nproc)

_extramodules=$(cat `find /usr/lib/modules/extramodules* -type 'f' -name 'version'`)

build() {
  cd ${srcdir}/rtl8189ES_linux
   if [ ${CARCH} == "armv6h" -o ${CARCH} == "armv7h" ]; then
     ARCH="arm"
  else
     ARCH=${CARCH}
  fi
  make ARCH=$ARCH -j$procs_num KSRC="/usr/lib/modules/${_extramodules}/build/"
}

package(){
  cd ${srcdir}/rtl8189ES_linux

  file_dir="$pkgdir/usr/lib/modules/${_extramodules}/kernel/drivers/net/wireless/realtek/rtl8189es"
  mkdir -p $file_dir
  install -Dm644 "8189es.ko" "$file_dir/8189es.ko"
  gzip -9 "$file_dir/8189es.ko"
}