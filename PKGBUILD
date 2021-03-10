pkgname=rtl8189es-git
_pkgbase=${pkgname%-*-*}
pkgver=57.03ac413
pkgrel=1
pkgdesc="RTL8189ES / RTL8189ETV modules"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/jwrdegoede/rtl8189ES_linux"
license=('GPL2')
#depends=('linux'=$kernelver)
makedepends=('git' 'make' 'linux-headers')
conflicts=("${_pkgbase}")
source=("git+${url}#tag=$pkgver"
        "$pkgname.install")
install=$pkgname.install
md5sums=('SKIP' '8a04c4c6a69a34393694aa0a14fb4853')
procs_num=$(nproc)

_extramodules=$(cat `find /usr/lib/modules/extramodules* -type 'f' -name 'version'`)

pkgver() {
  cd ${srcdir}/rtl8189ES_linux
  echo "$(git rev-list --count HEAD)" "." "$(git rev-parse --short HEAD)"
}

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