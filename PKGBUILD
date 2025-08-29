# Maintainer: Melvin Redondo-Tanis <melvin@redondotanis.com>

pkgname=intel-npu-driver-bin
pkgver=1.23.0.20250827_17270089246
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
  "linux-npu-driver-v${pkgver//_/-}-ubuntu2404.tar.gz::https://github.com/intel/linux-npu-driver/releases/download/v${_main_ver}/linux-npu-driver-v${pkgver//_/-}-ubuntu2404.tar.gz"
  "LICENSE.md::https://raw.githubusercontent.com/intel/linux-npu-driver/main/LICENSE.md"
)
sha256sums=(
  'e5b4368a2c8c555796d546acdc242a4c34556a0dbfb55b0c8e2a25aaefa002bf'
  '451963b6682694730dbe4889fff2ef1c20def68992e2594880c15a28e6c87be5'
)

prepare() {
  cd "$srcdir"
  bsdtar -xf "linux-npu-driver-v${pkgver//_/-}-ubuntu2404.tar.gz"

  mkdir -p intel-driver-compiler-npu intel-fw-npu intel-level-zero-npu

  local _base="${pkgver//_/-}"
  local _deb_suffix="ubuntu24.04_amd64"

  bsdtar -xf "intel-driver-compiler-npu_${_base}_${_deb_suffix}.deb" -C intel-driver-compiler-npu
  bsdtar -xf "intel-fw-npu_${_base}_${_deb_suffix}.deb" -C intel-fw-npu
  chmod 755 -R intel-fw-npu
  bsdtar -xf "intel-level-zero-npu_${_base}_${_deb_suffix}.deb" -C intel-level-zero-npu
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
