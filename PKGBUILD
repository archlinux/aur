# Maintainer: Davide Iosca <dvdios [at] aol [dot] com>

pkgname='vkcube-git'
pkgdesc='Demo cube app for Vulkan'
pkgver=r34.55ca5fb
pkgrel=1
url='https://github.com/krh/vkcube'
arch=('i686' 'x86_64')
license=('MIT')
depends=('vulkan-icd-loader' 'vulkan-i965-git' 'libpng' 'mesa')
source=('git+https://github.com/krh/vkcube')
sha1sums=('SKIP')
makedepends=('git')

pkgver() {
  cd "${srcdir}"/vkcube
  printf "r%d.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}"/vkcube

  export 
  autoreconf -f -i -v
  ./configure --prefix=/usr

  # Temporary fix until Intel vulkan driver moves to /usr/
  sed -i.bak 's|DEFAULT_INCLUDES = -I.|DEFAULT_INCLUDES = -I. -I/opt/mesa-vulkan/include|g' Makefile
  sed -i.bak 's|-lvulkan-1|-lvulkan -L/opt/mesa-vulkan/lib -lvulkan_intel|g' Makefile
}

build() {
  cd "${srcdir}"/vkcube

  make V=1 -j2
}

package() {
  cd "${srcdir}"/vkcube

  install -dm755 "${pkgdir}"/opt/vkcube/bin
  install  -m755 vkcube "${pkgdir}"/opt/vkcube/bin/vkcube

  # Temporary fix until Intel vulkan driver moves to /usr/
  # Since vulkan-i965-git libraries conflicts with mesa libraries we cannot add vulkan to library path system wide
  # # install -dm755 "${pkgdir}"/etc/ld.so.conf.d  
  # # echo '/opt/mesa-vulkan/lib' > "${pkgdir}"/etc/ld.so.conf.d/vkcube.conf

  install -dm755 "${pkgdir}"/usr/bin
  echo 'env LD_LIBRARY_PATH=/opt/mesa-vulkan/lib:$LD_LYBRARY_PATH /opt/vkcube/bin/vkcube' > "${pkgdir}"/usr/bin/vkcube
  chmod 755 "${pkgdir}"/usr/bin/vkcube 
}

