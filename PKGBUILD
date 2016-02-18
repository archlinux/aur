pkgname=vulkan-i965-git
pkgver=11.2.0_devel.78310.40c76d4
_realver=11.2
pkgrel=1
pkgdesc="i965 Anvil Vulkan Driver"
arch=('i686' 'x86_64')
url="http://mesa3d.org/"
license=('LGPL')
depends=('libdrm' 'dri2proto' 'glproto' 'libxxf86vm' 'libxdamage' 'expat>=2.0.1' 'libxmu' 'talloc' 'wayland')
makedepends=('pkgconfig' 'imake' 'xorg-server-devel')
provides=("vulkan-i965=${_realver}")
conflicts=('mesa-i965')
source=("git://anongit.freedesktop.org/mesa/mesa#branch=vulkan")
_gitname="mesa"
md5sums=('SKIP')
#options=('!strip') # for debugging

prepare() {
  cd ${_gitname}

# git apply -vvv --ignore-space-change --ignore-whitespace ~/mesa.patch
 ./autogen.sh \
    --prefix=/opt/mesa-vulkan \
    --with-dri-drivers=i965 \
    --with-egl-platforms=x11,drm,wayland \
    --with-gallium-drivers= \
    --enable-egl \
    --enable-dri3
}

build() {
  cd ${_gitname}
  make
}

package() {
  cd ${_gitname}
  make DESTDIR="${pkgdir}" install

  install -d ${pkgdir}/etc/profile.d
  echo '#!/bin/bash
export VK_ICD_FILENAMES="/opt/mesa-vulkan/etc/vulkan/icd.d/intel_icd.json:$VK_ICD_FILENAMES"
' > ${pkgdir}/etc/profile.d/mesa-vulkan.sh
  chmod +x ${pkgdir}/etc/profile.d/mesa-vulkan.sh
}

pkgver() {
    cd mesa
    echo $(cat VERSION | tr "-" "_").$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}
