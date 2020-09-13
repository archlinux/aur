# Maintainer: Christoph Haag <haagch@studi.informatik.uni-stuttgart.de>
# Maintainer: Laurent Carlier <lordheavym@gmail.com>

pkgname=vulkan-intel-git
pkgver=20.3.0_devel
pkgrel=1
pkgdesc="Intel's Vulkan mesa driver"
arch=(x86_64)
url="http://www.mesa3d.org"
license=('custom')
depends=('vulkan-icd-loader' 'libgcrypt' 'wayland' 'libxcb' 'libpthread-stubs')
provides=(vulkan-intel)
conflicts=(vulkan-intel vulkan-i965 vulkan-i965-git)
makedepends=('xorgproto' 'libdrm' 'libxxf86vm' 'libxdamage' 'expat>=2.0.1' 'libxmu'
             'talloc' 'wayland' 'pkgconfig' 'imake' 'xorg-server-devel' 'python' 'git')
source=('anvil::git://anongit.freedesktop.org/mesa/mesa'
        LICENSE)
sha256sums=('SKIP'
            '7fdc119cf53c8ca65396ea73f6d10af641ba41ea1dd2bd44a824726e01c8b3f2')

#options=(debug !strip)

pkgver() {
  cd anvil
  echo $(cat VERSION | tr "-" "_").$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd "${srcdir}/anvil"
}

build() {
  cd "${srcdir}/anvil"

  meson setup builddir
  ninja -C builddir
  # fake installation
  mkdir -p "$srcdir"/fakeinstall
  DESTDIR="${srcdir}"/fakeinstall  ninja -C builddir install
}

package() {
  cd "${srcdir}/anvil"

  install -m755 -d "${pkgdir}"/usr/share/vulkan
  mv -v "${srcdir}"/fakeinstall/usr/local/share/vulkan/icd.d "${pkgdir}"/usr/share/vulkan/

  install -m755 -d "${pkgdir}"/usr/{include/vulkan,lib}
  mv -v "${srcdir}"/fakeinstall/usr/local/lib/libvulkan_intel.so "${pkgdir}"/usr/lib/
  mv -v "${srcdir}"/fakeinstall/usr/local/include/vulkan/vulkan_intel.h "${pkgdir}"/usr/include/vulkan

  install -m755 -d "${pkgdir}"/usr/share/licenses/"${pkgname}"
  install -m644 "${srcdir}/LICENSE" "${pkgdir}"/usr/share/licenses/"${pkgname}"/
}
