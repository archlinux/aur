# Maintainer: Iwan Timmer <irtimmer@gmail.com>

pkgname=vulkan-hpp-git
pkgver=r126.633182b
pkgrel=1
pkgdesc='Open-Source Vulkan C++ API'
arch=('i686' 'x86_64')
url="https://github.com/KhronosGroup/Vulkan-Hpp"
license=('APACHE')
depends=('vulkan-headers')
makedepends=('cmake' 'gcc-libs')
source=('git+https://github.com/KhronosGroup/Vulkan-Hpp.git'
        'git+https://github.com/leethomason/tinyxml2.git')
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd Vulkan-Hpp
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}            

prepare() {
  cd Vulkan-Hpp
  git submodule init
  git config submodule.tinyxml2.url $srcdir/tinyxml2
  git submodule update tinyxml2
}

build() {
  mkdir -p build
  cd build
  cmake ../Vulkan-Hpp -DCMAKE_INSTALL_PREFIX=/usr
  make
  ./VulkanHppGenerator /usr/share/vulkan/vk.xml
}

package() {
  cd $srcdir
  install -Dm644 Vulkan-Hpp/vulkan/vulkan.hpp "${pkgdir}"/usr/include/vulkan/vulkan.hpp
  install -Dm644 Vulkan-Hpp/LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.txt
}
