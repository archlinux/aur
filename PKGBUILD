# Maintainer: Ethan Johnston <ethan dot johnston at alcorlabs dot com>
pkgname=opencomposite-git
pkgver=r1074.356d039
pkgrel=1
pkgdesc='Reimplementation of OpenVR, translating calls to OpenXR.'
arch=('x86_64')
url='https://gitlab.com/znixian/OpenOVR'
license=('GPL3')
depends=('vulkan-icd-loader' 'glm')
makedepends=('git' 'cmake' 'make' 'vulkan-headers')
provides=("opencomposite")
conflicts=("opencomposite")
source=("${pkgname}::git+${url}#branch=openxr"
        "git+https://github.com/KhronosGroup/OpenXR-SDK"
        "git+https://github.com/g-truc/glm")
sha1sums=('SKIP'
          'SKIP'
          'SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() { 
  cd "${srcdir}/${pkgname}"
  git submodule init
  git config submodule.libs/openxr-sdk.url "${srcdir}/OpenXR-SDK"
  git config submodule.libs/glm.url "${srcdir}/glm"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "${srcdir}/${pkgname}"
  mkdir build
  cd build
  cmake ..
  cmake --build .
}

package() {
  install -Dm755 ${srcdir}/${pkgname}/build/bin/linux64/vrclient.so ${pkgdir}/usr/share/opencomposite/bin/linux64/vrclient.so
}
