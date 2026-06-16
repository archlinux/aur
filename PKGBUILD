# Maintainer: InfectedResearch <crotchinfection at gmail dot com>

pkgname=obs-frackground
pkgver=0.1.0_alpha.1
pkgrel=1
pkgdesc='Linux-first OBS Studio background removal and auto greenscreen plugin'
arch=('x86_64')
url='https://github.com/infectedresearch/obs-frackground'
license=('GPL-3.0-or-later')
depends=('obs-studio' 'onnxruntime' 'gcc-libs' 'glibc')
makedepends=('cmake' 'pkgconf')
install="${pkgname}.install"
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver/_/-}.tar.gz"
  'rvm_mobilenetv3_fp16.onnx::https://github.com/PeterL1n/RobustVideoMatting/releases/download/v1.0.0/rvm_mobilenetv3_fp16.onnx'
)
sha256sums=(
  '9fadcf12b09e60cba9375825c6f4bef8bba182111e97ba20247de9cf4d46a3ba'
  '6a0d5ce6cc17702613be548559879b4521ed424cfe14ddc48d1acaa44d616f64'
)

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver/_/-}"
  install -Dm644 "${srcdir}/rvm_mobilenetv3_fp16.onnx" models/rvm_mobilenetv3_fp16.onnx
}

build() {
  cmake \
    -S "${srcdir}/${pkgname}-${pkgver/_/-}" \
    -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev
  cmake --build build
}

check() {
  ./build/frackground-probe "${srcdir}/rvm_mobilenetv3_fp16.onnx" cpu
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  cd "${srcdir}/${pkgname}-${pkgver/_/-}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md RELEASE.md THIRD_PARTY_NOTICES.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
