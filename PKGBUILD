# Maintainer: Jichi Zhang <jichi@1435.es>
# Contributor: jinzhongjia <mail@nvimer.org>

pkgname=intel-npu-driver-bin
pkgver=1.8.0.20240916_10885588273
pkgrel=2
_main_ver=$(echo $pkgver | cut -d'.' -f1-3)
pkgdesc="Intel(R) NPU (Neural Processing Unit) Driver"
arch=(x86_64)
url="https://github.com/intel/linux-npu-driver"
license=('MIT')
depends=('glibc' 'gcc-libs' 'openssl' 'onetbb')
makedepends=('chrpath')
optdepends=('level-zero-headers' 'level-zero-loader')
provides=('intel-driver-compiler-npu' 'intel-fw-npu' 'intel-level-zero-npu')
source=(
  "intel-driver-compiler-npu.deb::https://github.com/intel/linux-npu-driver/releases/download/v${_main_ver}/intel-driver-compiler-npu_${pkgver//_/-}_ubuntu24.04_amd64.deb"
	"intel-fw-npu.deb::https://github.com/intel/linux-npu-driver/releases/download/v${_main_ver}/intel-fw-npu_${pkgver//_/-}_ubuntu24.04_amd64.deb"
	"intel-level-zero-npu.deb::https://github.com/intel/linux-npu-driver/releases/download/v${_main_ver}/intel-level-zero-npu_${pkgver//_/-}_ubuntu24.04_amd64.deb"
	"LICENSE::https://raw.githubusercontent.com/intel/linux-npu-driver/main/LICENSE.md"
)
noextract=("${source[@]%%::*}")
sha256sums=('e8a053336619507c3d89eeaf45481057a58c602f37b570b0a82883abe9bd98fa'
            '60ec473073a13f3b395853280a55b7ed3a2b010675acb16a33e75c8b4fce3db3'
            '5a7f1c642c87aefa937bf53fe51efbe4ed9cb8b9fad9967a3b1ac8bd805bf61c'
            '451963b6682694730dbe4889fff2ef1c20def68992e2594880c15a28e6c87be5')

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
  # The location of fw-npu is wrong, it should not be placed in /lib, it should be placed in /usr/lib
  bsdtar -xf intel-fw-npu/data.tar.gz -C "${pkgdir}/"
  mv "${pkgdir}/lib" "${pkgdir}/usr/"
  rm -rf "${pkgdir}/lib"

  bsdtar -xf intel-driver-compiler-npu/data.tar.gz -C "${pkgdir}/"
  bsdtar -xf intel-level-zero-npu/data.tar.gz -C "${pkgdir}/"

  # install LICENSE
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  
  # For user access to the device
  mkdir -p "${pkgdir}/usr/lib/udev/rules.d"
  # TAG+="uaccess", This special tag makes udev apply a dynamic user ACL to the device node,
  # which coordinates with systemd-logind(8) to make the device usable to logged-in users.
  # The offical installation instruction is 10-intel-npu.rules
  # we use 99-intel-npu.rules, which is to prevent permissions from being overridden by systemd’s default rules.
  # systemd default rule is /lib/udev/rules.d/50-udev-default.rules
  echo 'SUBSYSTEM=="accel", KERNEL=="accel*", GROUP="render", MODE="0660", TAG+="uaccess"' > "${pkgdir}/usr/lib/udev/rules.d/99-intel-npu.rules"

  # Set global readability
  chmod -R a+r "${pkgdir}/usr/lib/firmware/updates/intel/vpu"
  # remove insecure RUNAPTH 
  chrpath --delete "$pkgdir/usr/lib/${CARCH}-linux-gnu/libnpu_driver_compiler.so"
}

