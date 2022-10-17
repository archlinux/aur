# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Based on uefitool-git by xsmile <>

pkgname=uefitool
_pkgname=UEFITool
_tools=("${_pkgname}" 'UEFIExtract' 'UEFIFind')
pkgver=A62
pkgrel=1
epoch=1
pkgdesc='UEFI firmware image viewer and editor and utilities'
arch=('armv7h' 'aarch64' 'i686' 'x86_64')
url='https://github.com/LongSoft/UEFITool'
license=('BSD')
depends=('qt6-base')
makedepends=('cmake')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('fa39be2912141f7d95cd733acf2f49e94c1df3cfbb069bb856d6e9bae86ff8bb')

build() {
  cd "${_pkgname}-${pkgver}"

  for _tool in "${_tools[@]}"; do
	cmake -S "${_tool}" -B "${_tool}-build"
	cmake --build "${_tool}-build"
  done
}

package() {
  cd "${_pkgname}-${pkgver}"

  __tools=("${_pkgname}" "${_tools[@]}")
  for _tool in "${__tools[@]}"; do
    install -Dm755 "${_tool}-build/${_tool}" "${pkgdir}/usr/bin/${_tool,,}"
  done

  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
