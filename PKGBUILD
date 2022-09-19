# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Based on uefitool-git by xsmile <>

pkgname=uefitool
_pkgname=UEFITool
_tools=("${_pkgname}" 'UEFIExtract' 'UEFIFind')
pkgver=A61
pkgrel=1
pkgdesc='UEFI firmware image viewer and editor and utilities'
arch=('armv7h' 'aarch64' 'i686' 'x86_64')
url='https://github.com/LongSoft/UEFITool'
license=('BSD')
depends=('qt6-base')
makedepends=('cmake')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('54fbc130a71e6474f0f9342166465670dff0dac9ba743fe162ae2c9912826155')

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
