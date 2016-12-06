# Maintainer: cyrant <cyrant at tuta dot io>

pkgname=voxelquest
pkgver=0.1
pkgrel=1
pkgdesc='Both an open source voxel game engine and a role playing game.'
url='http://www.voxelquest.com'
arch=('x86_64')
license=('MIT')
conflicts=('voxelquest-git')
depends=('freeglut' 'sfml')
makedepends=('cmake' 'unzip')
_lzz='lzz_2_8_2_linux.zip'
source=(
  "${pkgname}::git+https://github.com/gavanw/vqisosmall.git#tag=${pkgver}"
  "${pkgname}-resources.zip::https://github.com/gavanw/vqisosmall/releases/download/${pkgver}/resources.zip"
  "${_lzz}::http://www.lazycplusplus.com/${_lzz}"
  "${pkgname}.desktop"
  "${pkgname}.sh"
)
md5sums=(
  'SKIP'
  '3d8da23048f9a64d3f3ed7cdd7598d72'
  '0aad7107b76ebf338a2e38e7604dbedb'
  '2dbce2b10fc8225506b92b684e2abfa9'
  '0d2311fcbd9fe065d1168123ade4dce0'
)
noextract=(
  "${pkgname}-resources.zip"
  "${_lzz}"
)

prepare() {
  unzip -o "${_lzz}" -d "${pkgname}"
}

build() {
  mkdir -p "${pkgname}-build"
  cd "${pkgname}-build"
  cmake "../${pkgname}" &&
  make
}

package() {
  install -Dm755 "${pkgname}-build/VoxelQuest" "${pkgdir}/opt/${pkgname}/bin/${pkgname}"
  install -dm755 "${pkgdir}/opt/${pkgname}/src/glsl"
  cp -dpr --no-preserve=ownership "${pkgname}/cdat" "${pkgdir}/opt/${pkgname}"
  cp -dpr --no-preserve=ownership "${pkgname}/src/glsl" "${pkgdir}/opt/${pkgname}/src"
  unzip -o "${pkgname}-resources.zip" data/* -d "${pkgdir}/opt/${pkgname}"
  install -Dm644 "${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
