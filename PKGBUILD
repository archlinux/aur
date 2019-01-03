# Maintainer: Björn Bidar <bidar@odin>
_pkgname=primus-vk
pkgname=$_pkgname-git
pkgver=r62.52ceb2c
pkgrel=1
pkgdesc="Primus-Vk Nvidia Vulkan offloading for Bumblebee"
arch=('i686' 'x86_64')
url="https://github.com/felixdoerre/primus_vk"
license=('BSD')
depends=('nvidia-utils' 'bumblebee' 'vulkan-icd-loader' 'primus')
makedepends=('vulkan-validation-layers' 'git')
source=(git+https://github.com/felixdoerre/primus_vk
        'primus_vk_wrapper.json'
       'pvkrun.in.sh')
md5sums=('SKIP'
         'e8bec20f7aa74956f4944c7ed237a770'
         'fb5ae09d41c4590de7f0ecf1ca6c3673')

pkgver() {
  cd "${_pkgname/-/_}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
  cd "${_pkgname/-/_}"

  CXXFLAGS+=' -DNV_DRIVER_PATH=\"/usr/lib/libGLX_nvidia.so.0\"'
  make CXXFLAGS="$CXXFLAGS"
}

package() {
  cd "${_pkgname/-/_}"

  install -D libnv_vulkan_wrapper.so "$pkgdir"/usr/lib/libnv_vulkan_wrapper.so
	install -D libprimus_vk.so "$pkgdir"/usr/lib/libprimus_vk.so
	install -Dm644 primus_vk.json "$pkgdir"/usr/share/vulkan/implicit_layer.d/primus_vk.json
  install -Dm644 "$srcdir"/primus_vk_wrapper.json "$pkgdir"/usr/share/vulkan/icd.d/primus_vk_wrapper.json
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
  install -Dm755 "$srcdir"/pvkrun.in.sh "$pkgdir"/usr/bin/pvkrun
}

# vim:set ts=2 sw=2 et:
