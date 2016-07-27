# Maintainer: Laurent Carlier <lordheavym@gmail.com>

pkgname=vulkan-radeon-git
pkgver=83453.6db201a
pkgrel=1
pkgdesc="Radeon's Vulkan mesa driver"
arch=(x86_64 i686)
url="http://www.mesa3d.org"
license=('custom')
depends=('vulkan-icd-loader' 'libgcrypt' 'wayland' 'libxcb' 'llvm-libs-svn')
makedepends=('libdrm' 'dri2proto' 'glproto' 'libxxf86vm' 'libxdamage' 'expat>=2.0.1' 'libxmu' 'llvm-svn'
             'talloc' 'wayland' 'pkgconfig' 'imake' 'xorg-server-devel' 'python2-mako' 'python' 'git')
source=('radv::git+https://github.com/airlied/mesa.git#branch=semi-interesting'
        LICENSE
        remove-libpthread-stubs.patch)
sha256sums=('SKIP'
            '7fdc119cf53c8ca65396ea73f6d10af641ba41ea1dd2bd44a824726e01c8b3f2'
            '75ab53ad44b95204c788a2988e97a5cb963bdbf6072a5466949a2afb79821c8f')

pkgver() {
  cd "${srcdir}/radv"

#  echo $(git rev-list --count master).$(git rev-parse --short master)
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd "${srcdir}/radv"

  patch -Np1 -i ../remove-libpthread-stubs.patch
}

build() {
  cd "${srcdir}/radv"

 ./autogen.sh --prefix=/usr \
    --sysconfdir=/etc \
    --with-sha1=libgcrypt \
    --with-dri-drivers= \
    --with-egl-platforms=x11,drm \
    --with-vulkan-drivers=radeon \

  make

  # fake installation
  mkdir -p "$srcdir"/fakeinstall
  make DESTDIR="${srcdir}"/fakeinstall install
}

package() {
  cd "${srcdir}/radv"
  
  install -m755 -d ${pkgdir}/usr/share
  mv -v ${srcdir}/fakeinstall/usr/share/vulkan ${pkgdir}/usr/share/

  install -m755 -d ${pkgdir}/usr/lib
  mv -v ${srcdir}/fakeinstall/usr/lib/libvulkan_radeon.so ${pkgdir}/usr/lib/

  install -m755 -d "${pkgdir}/usr/share/licenses/vulkan-radeon-git"
  install -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/vulkan-radeon-git/"
}

