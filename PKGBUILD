# Maintainer: cyrant <cyrant at tuta dot io>

_pkgname=voxelquest
_pkgver=0.1
pkgname="${_pkgname}-git"
pkgver="${_pkgver}.r30.g0e1dcd5"
pkgrel=1
pkgdesc='Both an open source voxel game engine and a role playing game.'
url='http://www.voxelquest.com'
arch=('x86_64')
license=('MIT')
conflicts=('voxelquest')
depends=('freeglut' 'sfml')
makedepends=('cmake' 'git' 'unzip')
_lzz='lzz_2_8_2_linux.zip'
source=(
  "${pkgname}::git+https://github.com/gavanw/vqisosmall.git#branch=master"
  "${_pkgname}-resources.zip::https://github.com/gavanw/vqisosmall/releases/download/${_pkgver}/resources.zip"
  "${_lzz}::http://www.lazycplusplus.com/${_lzz}"
  "${_pkgname}.desktop"
  "${_pkgname}.sh"
)
md5sums=(
  'SKIP'
  '3d8da23048f9a64d3f3ed7cdd7598d72'
  '0aad7107b76ebf338a2e38e7604dbedb'
  '2dbce2b10fc8225506b92b684e2abfa9'
  '0d2311fcbd9fe065d1168123ade4dce0'
)
noextract=(
  "${_pkgname}-resources.zip"
  "${_lzz}"
)

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

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
  install -Dm755 "${pkgname}-build/VoxelQuest" "${pkgdir}/opt/${_pkgname}/bin/${_pkgname}"
  install -dm755 "${pkgdir}/opt/${_pkgname}/src/glsl"
  cp -dpr --no-preserve=ownership "${pkgname}/cdat" "${pkgdir}/opt/${_pkgname}"
  cp -dpr --no-preserve=ownership "${pkgname}/src/glsl" "${pkgdir}/opt/${_pkgname}/src"
  unzip -o "${_pkgname}-resources.zip" data/* -d "${pkgdir}/opt/${_pkgname}"
  install -Dm644 "${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm755 "${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
