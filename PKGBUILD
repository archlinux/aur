# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: cyrant <cyrant at tuta dot io>

_pkgname=voxelquest
_pkgver=0.1
pkgname="${_pkgname}-git"
pkgver="${_pkgver}.r30.g0e1dcd5"
pkgrel=2
pkgdesc='Both an open source voxel game engine and a role playing game.'
url='https://www.voxelquest.com'
arch=('x86_64')
license=('MIT')
conflicts=('voxelquest')
depends=('freeglut' 'sfml')
makedepends=('cmake' 'git' 'unzip')
_lzz='lzz_2_8_2_linux.zip'
source=(
  "${pkgname}::git+https://github.com/gavanw/vqisosmall.git#branch=master"
  "${_pkgname}-resources.zip::https://github.com/gavanw/vqisosmall/releases/download/${_pkgver}/resources.zip"
  "${_lzz}::https://github.com/driedfruit/lzz/releases/download/v2.8.2/${_lzz}"
  "${_pkgname}.desktop"
  "${_pkgname}.sh"
)
sha512sums=('SKIP'
            '468a5963fd6f028da19a5006eab4f2673941af6f92497af313e952cb6acef14242b23781be2b66114dffc692b8fb678182d6286ace746194eae94adc789116dc'
            '5d88dd0e22a7488990c17a7457f5389d0007154480531190f4fe58a63abc6e71c2dce1e163db43d141b4c5fac1f3a43b20872fb9caa0d8f9f29b31079e70e2e6'
            '5e7bd86831ccbd006d00ad02da790425067a5b29430a3cb961c42bc4de0881af582217d41ddcb51cb58223d16c5b8752b2db42d8b75c9360ec151eff0cb6ccfd'
            '04280dcddd238c35bd81c1fc74a199bc62e5eef26be0ed188dbb7fec2b2efac63b474d83413ec432afadc3851dad13b48fa2fde89bc30149d353f0cc9f85ef91')
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
