# Maintainer: Yurii Kolesnykov <root@yurikoles.com>

pkgname=uefitool-ng
_pkgname=UEFITool
_tools=(UEFITool UEFIExtract UEFIFind)
pkgver=A74
pkgrel=1
pkgdesc='UEFI firmware image viewer and editor'
arch=(armv7h aarch64 i686 x86_64)
url='https://github.com/LongSoft/UEFITool'
license=(BSD-2-Clause)
depends=(qt6-base)
provides=(
  "uefiextract=${pkgver}"
  "uefifind=${pkgver}"
  "uefitool=${pkgver}"
)
conflicts=(uefitool)
makedepends=(
  cmake
  vulkan-headers
)
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('b77366f5008ec0504e169a5ff28e9e287c307a0d5f43df590623f123ddab4918')

build() {
  for _tool in "${_tools[@]}"; do
    local cmake_options=(
        -B "${_tool}-build"
        -S "${_pkgname}-${pkgver}/${_tool}"
        -W no-dev
        -D CMAKE_BUILD_TYPE=None
    )
    cmake "${cmake_options[@]}"
	cmake --build "${_tool}-build"
  done
}

package() {
  for _tool in "${_tools[@]}"; do
    install -Dm755 "${_tool}-build/${_tool,,}" "${pkgdir}/usr/bin/${_tool,,}"
  done
  
  install -Dm644 "${_pkgname}-${pkgver}"/LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
