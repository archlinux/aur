# Maintainer: Melvin Redondo-Tanis <melvin@redondotanis.com>

pkgname=intel-npu-driver-bin
pkgver=1.19.0.20250707_16111289554
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
  '6fae337b15d1ae3eaf9b0fe2edce09b9871f59d6cb97f5bfe853c138c6888056'
  '05dadf9200b007b590a71b2a5b1b882fa113fff18e89db91988178cdfcec4c57'
  'cb5ec557850fe8580e241beb8acdfa6b42042b4f6af1f865f52be4defa51b2d7'
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
