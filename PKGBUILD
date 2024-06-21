# Maintainer: Jichi Zhang <jichi@1435.es>

pkgname=intel-npu-driver-bin
pkgver=1.5.0.20240619_9582784383
pkgrel=1
main_ver=$(echo $pkgver | cut -d'.' -f1-3)
pkgdesc="Intel(R) NPU (Neural Processing Unit) Driver"
arch=(x86_64)
url="https://github.com/intel/linux-npu-driver"
license=('MIT')
depends=('onetbb' 'level-zero-headers' 'level-zero-loader')
provides=('intel-driver-compiler-npu' 'intel-fw-npu' 'intel-level-zero-npu')
source=("intel-driver-compiler-npu.deb::https://github.com/intel/linux-npu-driver/releases/download/v${main_ver}/intel-driver-compiler-npu_${pkgver//_/-}_ubuntu22.04_amd64.deb"
	"intel-fw-npu.deb::https://github.com/intel/linux-npu-driver/releases/download/v${main_ver}/intel-fw-npu_${pkgver//_/-}_ubuntu22.04_amd64.deb"
	"intel-level-zero-npu.deb::https://github.com/intel/linux-npu-driver/releases/download/v${main_ver}/intel-level-zero-npu_${pkgver//_/-}_ubuntu22.04_amd64.deb"
	"LICENSE::https://raw.githubusercontent.com/intel/linux-npu-driver/main/LICENSE.md")
noextract=("${source[@]%%::*}")
sha256sums=(
	'a87eb96ec6793eea1af4f086b3f2f5b84047f1d71a66d6501d7add368b1c5621'
	'3c6726a7440a8bba930bc7e13d484e705e8a8ce26c934d1c9616c001f0224800'
	'273f0de82c6f143e141da5850207c925a96554db8eb478f1fb19926ed954e375'
	'9cd7b75cc0af6941de80c7fccd3f63217de5c0691b63fb1319b73d1e033c9c4f'
	)

prepare() {
  cd "$srcdir"
  mkdir -p intel-driver-compiler-npu intel-fw-npu intel-level-zero-npu
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
