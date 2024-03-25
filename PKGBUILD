# Maintainer: Jichi Zhang <jichi@1435.es>

pkgname=intel-npu-driver-bin
pkgver=1.4.0.20240322_8393323322
pkgrel=1
pkgdesc="Intel(R) NPU (Neural Processing Unit) Driver"
arch=(x86_64)
url="https://github.com/intel/linux-npu-driver"
license=('MIT')
depends=('onetbb' 'level-zero-headers' 'level-zero-loader')
provides=('intel-driver-compiler-npu' 'intel-fw-npu' 'intel-level-zero-npu')
source=("intel-driver-compiler-npu.deb::https://github.com/intel/linux-npu-driver/releases/download/v1.2.0/intel-driver-compiler-npu_${pkgver//_/-}_ubuntu22.04_amd64.deb"
	"intel-fw-npu.deb::https://github.com/intel/linux-npu-driver/releases/download/v1.2.0/intel-fw-npu_${pkgver//_/-}_ubuntu22.04_amd64.deb"
	"intel-level-zero-npu.deb::https://github.com/intel/linux-npu-driver/releases/download/v1.2.0/intel-level-zero-npu_${pkgver//_/-}_ubuntu22.04_amd64.deb"
	"LICENSE::https://raw.githubusercontent.com/intel/linux-npu-driver/main/LICENSE.md")
noextract=("${source[@]%%::*}")
b2sums=('SKIP' # Intel does not provide checksums for binary packages
	'SKIP'
	'SKIP'
  'SKIP')

prepare() {
  cd "$srcdir"
  mkdir intel-driver-compiler-npu intel-fw-npu intel-level-zero-npu
  bsdtar -xf intel-driver-compiler-npu.deb -C intel-driver-compiler-npu
  bsdtar -xf intel-fw-npu.deb -C intel-fw-npu
  bsdtar -xf intel-level-zero-npu.deb -C intel-level-zero-npu
}

package() {
  cd "$srcdir"
  bsdtar -xf intel-driver-compiler-npu/data.tar.gz -C "${pkgdir}/"
  bsdtar -xf intel-fw-npu/data.tar.gz -C "${pkgdir}/"
  bsdtar -xf intel-level-zero-npu/data.tar.gz -C "${pkgdir}/"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  
  mkdir -p "${pkgdir}/etc/udev/rules.d"
  echo 'SUBSYSTEM==\"accel\", KERNEL==\"accel*\", GROUP=\"render\", MODE=\"0660\"' > "${pkgdir}/etc/udev/rules.d/10-intel-npu.rules"

  chown root:root -R "${pkgdir}/"
  chmod 755 -R "${pkgdir}/"
}