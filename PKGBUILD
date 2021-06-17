pkgname=rtl8189es-git
_pkgbase=${pkgname%-*-*}
_pkgver="4.3.18.1"
pkgver=4.3.18.1.57.03ac413
pkgrel=1
pkgdesc="RTL8189ES / RTL8189ETV modules"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/jwrdegoede/rtl8189ES_linux"
license=('GPL2')
#depends=('linux'=$kernelver)
makedepends=('git' 'make' 'linux-headers')
conflicts=("${_pkgbase}")
source=("git+${url}"
        "$pkgname.install"
        "makefile-for-linux.patch"
        "package_kernel_rtl8189es_patches_010-rename-sta_info.h.patch")
install=$pkgname.install
md5sums=('SKIP'
         '8a04c4c6a69a34393694aa0a14fb4853'
         'c199e7dce430101a1b47a3e73c7c0b8e'
         '967d0e1b4f7e7cc17949113faf67f89b')
procs_num=$(nproc)

_extramodules=$(cat `find /usr/lib/modules/extramodules* -type 'f' -name 'version'`)

pkgver() {
  cd ${srcdir}/rtl8189ES_linux
  printf '%s' ${_pkgver} "." "$(git rev-list --count HEAD)" "." "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${srcdir}/rtl8189ES_linux
  local i; for i in "${source[@]}"; do
  case $i in
      *.patch)
        echo "Applying patch ${i}"
        patch -p1 -i "${srcdir}/${i}"
  esac
  done
}

build() {
  cd ${srcdir}/rtl8189ES_linux
  if [ ${CARCH} == "armv6h" -o ${CARCH} == "armv7h" ]; then
     ARCH="arm"
     make ARCH=$ARCH -j$procs_num KSRC="/usr/lib/modules/${_extramodules}/build/" CONFIG_PLATFORM_ARM_SUN8I=y CONFIG_POWER_SAVING=n CONFIG_WIFI_MONITOR=y modules
  else
     ARCH=${CARCH}
     make ARCH=$ARCH -j$procs_num KSRC="/usr/lib/modules/${_extramodules}/build/" CONFIG_PLATFORM_I386_PC=y CONFIG_POWER_SAVING=n CONFIG_WIFI_MONITOR=y modules
  fi
}

package(){
  cd ${srcdir}/rtl8189ES_linux
  file_dir="$pkgdir/usr/lib/modules/${_extramodules}/kernel/drivers/net/wireless/realtek/rtl8189es"
  mkdir -p $file_dir
  install -Dm644 "8189es.ko" "$file_dir/8189es.ko"
  gzip -9 "$file_dir/8189es.ko"
}