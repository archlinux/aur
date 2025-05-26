# Maintainer: Melvin Redondo-Tanis <melvin@redondotanis.com>

pkgname=intel-npu-driver-bin
pkgver=1.17.0.20250508_14912879441
pkgrel=1
_main_ver=$(echo $pkgver | cut -d'.' -f1-3)
pkgdesc="Intel(R) NPU (Neural Processing Unit) Driver"
arch=('x86_64')
url="https://github.com/intel/linux-npu-driver"
license=('MIT')
depends=('glibc' 'gcc-libs' 'openssl' 'onetbb')
makedepends=('chrpath')
optdepends=('level-zero-headers' 'level-zero-loader')
provides=('intel-driver-compiler-npu' 'intel-fw-npu' 'intel-level-zero-npu')
source=(
  "intel-driver-compiler-npu_${pkgver//_/-}.deb::https://github.com/intel/linux-npu-driver/releases/download/v${_main_ver}/intel-driver-compiler-npu_${pkgver//_/-}_ubuntu24.04_amd64.deb"
  "intel-fw-npu_${pkgver//_/-}.deb::https://github.com/intel/linux-npu-driver/releases/download/v${_main_ver}/intel-fw-npu_${pkgver//_/-}_ubuntu24.04_amd64.deb"
  "intel-level-zero-npu_${pkgver//_/-}.deb::https://github.com/intel/linux-npu-driver/releases/download/v${_main_ver}/intel-level-zero-npu_${pkgver//_/-}_ubuntu24.04_amd64.deb"
  "LICENSE.md::https://raw.githubusercontent.com/intel/linux-npu-driver/main/LICENSE.md"
)
noextract=("${source[@]%%::*}")
sha256sums=(
  '24309e17063e94729330ae9c02c5f2ea8ca5c27cdb067303e4e26ad1f4656a13'
  'cebbac7bdb56eb72529b8060bb1601afdcd4e90f2e5c29018b5ceaff98b7c63c'
  '07ee5332d0523661f5b3cec69593197fecc95439c8a9a401905e05cb7690097b'
  '451963b6682694730dbe4889fff2ef1c20def68992e2594880c15a28e6c87be5'
)

prepare() {
  cd "$srcdir"
  mkdir -p intel-driver-compiler-npu intel-fw-npu intel-level-zero-npu
  bsdtar -xf intel-driver-compiler-npu_${pkgver//_/-}.deb -C intel-driver-compiler-npu
  bsdtar -xf intel-fw-npu_${pkgver//_/-}.deb -C intel-fw-npu
  chmod 755 -R intel-fw-npu
  bsdtar -xf intel-level-zero-npu_${pkgver//_/-}.deb -C intel-level-zero-npu
}

package() {
  cd "$srcdir"
  
  bsdtar -xf intel-fw-npu/data.tar.gz -C "${pkgdir}/"
  mv "${pkgdir}/lib" "${pkgdir}/usr/"
  rm -rf "${pkgdir}/lib"

  bsdtar -xf intel-driver-compiler-npu/data.tar.gz -C "${pkgdir}/"
  bsdtar -xf intel-level-zero-npu/data.tar.gz -C "${pkgdir}/"

  install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"

  mkdir -p "${pkgdir}/usr/lib/udev/rules.d"
  echo 'SUBSYSTEM=="accel", KERNEL=="accel*", GROUP="render", MODE="0660", TAG+="uaccess"' > "${pkgdir}/usr/lib/udev/rules.d/99-intel-npu.rules"

  chmod -R a+r "${pkgdir}/usr/lib/firmware/updates/intel/vpu"

  chrpath --delete "$pkgdir/usr/lib/${CARCH}-linux-gnu/libnpu_driver_compiler.so"
}
