pkgname=rtl8821cu-git
_pkgbase=rtl8821cu
_pkgver="5.12.0"
pkgver=5.12.0.34.76605e4
pkgrel=1
pkgdesc="Linux Driver for USB WiFi Adapters that use the RTL8811CU, RTL8821CU and RTL8731AU Chipsets"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/morrownr/8821cu"
license=('GPL2')
depends=('linux-headers')
#'linux'=$kernelver
makedepends=('git' 'make' 'linux-headers')
conflicts=("${_pkgbase}" "${_pkgbase}-dkms-git")
source=("git+https://github.com/morrownr/8821cu-20210118#branch=main"
        "$pkgname.install")
install=$pkgname.install
sha256sums=('SKIP' 'afe2dc6de056dfeb319910ac1e63d914983108a971dfbc1403119d024d790899')
procs_num=$(nproc)

_extramodules=$(cat `find /usr/lib/modules/extramodules* -type 'f' -name 'version'`)

pkgver() {
   cd ${srcdir}/8821cu-20210118
   printf '%s' ${_pkgver} "." "$(git rev-list --count HEAD)" "." "$(git rev-parse --short HEAD)"
}

build() {
  cd ${srcdir}/8821cu-20210118
  if [ ${CARCH} == "armv7h" ]; then
     ARCH="arm"
  else
     ARCH=${CARCH}
  fi
  make ARCH=$ARCH -j$procs_num KSRC="/usr/lib/modules/${_extramodules}/build/"
}

package(){
  cd ${srcdir}/8821cu-20210118
  file_dir="$pkgdir/usr/lib/modules/${_extramodules}/kernel/drivers/net/wireless/realtek/rtl8821cu"
  mkdir -p $file_dir
  install -Dm644 "8821cu.ko" "$file_dir/8821cu.ko"
  gzip -9 "$file_dir/8821cu.ko"
}

