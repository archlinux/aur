# Maintainer: Jichi Zhang <jichi@1435.es>
# Contributor: jinzhongjia <mail@nvimer.org>

pkgname=intel-npu-driver-bin
pkgver=1.5.1.20240708_9842236399
pkgrel=5
_main_ver=$(echo $pkgver | cut -d'.' -f1-3)
pkgdesc="Intel(R) NPU (Neural Processing Unit) Driver"
arch=(x86_64)
url="https://github.com/intel/linux-npu-driver"
license=('MIT')
depends=('glibc' 'gcc-libs' 'openssl' 'onetbb')
optdepends=('level-zero-headers' 'level-zero-loader')
provides=('intel-driver-compiler-npu' 'intel-fw-npu' 'intel-level-zero-npu')
source=(
  "intel-driver-compiler-npu.deb::https://github.com/intel/linux-npu-driver/releases/download/v${_main_ver}/intel-driver-compiler-npu_${pkgver//_/-}_ubuntu24.04_amd64.deb"
	"intel-fw-npu.deb::https://github.com/intel/linux-npu-driver/releases/download/v${_main_ver}/intel-fw-npu_${pkgver//_/-}_ubuntu24.04_amd64.deb"
	"intel-level-zero-npu.deb::https://github.com/intel/linux-npu-driver/releases/download/v${_main_ver}/intel-level-zero-npu_${pkgver//_/-}_ubuntu24.04_amd64.deb"
	"LICENSE::https://raw.githubusercontent.com/intel/linux-npu-driver/main/LICENSE.md"
)
noextract=("${source[@]%%::*}")
# Intel does not provide checksums for binary packages
b2sums=(
    'SKIP'
    'SKIP'
	  'SKIP'
    'SKIP')

prepare() {
  cd "$srcdir"
  mkdir -p intel-driver-compiler-npu intel-fw-npu intel-level-zero-npu
  bsdtar -xf intel-driver-compiler-npu.deb -C intel-driver-compiler-npu
  bsdtar -xf intel-fw-npu.deb -C intel-fw-npu
  chmod 755 -R intel-fw-npu
  bsdtar -xf intel-level-zero-npu.deb -C intel-level-zero-npu
}

package() {
  cd "$srcdir"
  bsdtar -xf intel-driver-compiler-npu/data.tar.gz -C "${pkgdir}/"
  bsdtar -xf intel-fw-npu/data.tar.gz -C "${pkgdir}/"
  bsdtar -xf intel-level-zero-npu/data.tar.gz -C "${pkgdir}/"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  
  mkdir -p "${pkgdir}/usr/lib/udev/rules.d"
  echo 'SUBSYSTEM=="accel", KERNEL=="accel*", GROUP="render", MODE="0660"' > "${pkgdir}/usr/lib/udev/rules.d/10-intel-npu.rules"

  chown root:root -R "${pkgdir}/"
  chmod -R a+r "${pkgdir}/usr/lib/firmware/updates/intel/vpu"
}
