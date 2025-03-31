# Maintainer: Melvin Redondo-Tanis <melvin@redondotanis.com>

pkgname=intel-npu-driver-bin
pkgver=1.16.0.20250328_14132024782
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
  "LICENSE.linux-npu-driver::https://raw.githubusercontent.com/intel/linux-npu-driver/main/LICENSE.md"
)
noextract=("${source[@]%%::*}")
sha256sums=(
  'd121a06aa9138c02f765f99b346030a01a49e35048f8e699719595fddd1bfc6d'
  'aafa4afcac868c4299e49b59abaca32aa96c997fa8a61487f0662304e4319eb4'
  'ee7a006bada1d16664c311a53abb4a22df054b9081a429cd3063cc31bbdcb1ce'
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

  install -D -m644 LICENSE.linux-npu-driver "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.linux-npu-driver"

  mkdir -p "${pkgdir}/usr/lib/udev/rules.d"
  echo 'SUBSYSTEM=="accel", KERNEL=="accel*", GROUP="render", MODE="0660", TAG+="uaccess"' > "${pkgdir}/usr/lib/udev/rules.d/99-intel-npu.rules"

  chmod -R a+r "${pkgdir}/usr/lib/firmware/updates/intel/vpu"

  chrpath --delete "$pkgdir/usr/lib/${CARCH}-linux-gnu/libnpu_driver_compiler.so"
}
