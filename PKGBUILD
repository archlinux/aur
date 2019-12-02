# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=gapid-bin
conflicts=(gapid)
provides=(gapid)
pkgver=1.6.1
pkgrel=1
pkgdesc='Graphics API Debugger - GAPID is a collection of tools that allows you to inspect, tweak and replay calls from an application to a graphics driver'
url=https://gapid.dev
arch=(x86_64)
license=(apache)
depends=(java-runtime libx11)
source=(gapid.desktop
        gapid.sh)
source_x86_64=("https://github.com/google/gapid/releases/download/v$pkgver/gapid-$pkgver-linux.zip")
sha256sums=('6ad0f976e6f3dc57af3e81d271a9ebc54ea06fbf73e879c3d12caa81f2cbcb10'
            '2b480553d47bbe4e8f62c15223ce0555ce72f6e947abe9d117d2b3cf7b57dcb2')
sha256sums_x86_64=('db003498c43ff9ac50fb65bdc09b8777e1b21e94ad205f0355eaecd0c853953e')

_install_vk_layer() {
  lib=$1
  json=$2

  # Install Vulkan layer
  install -m755 $lib "$pkgdir"/usr/lib/
  install -m644 $json "$pkgdir"/usr/share/vulkan/explicit_layer.d/

  # Fix library path
  sed "s,<library>,/usr/lib/$(basename $lib)," \
    -i "$pkgdir"/usr/share/vulkan/explicit_layer.d/$(basename $json)
}

package() {
  cd gapid

  msg2 'Tools'
  install -dm755 "$pkgdir"/usr/bin
  install -m755 gapi? "$pkgdir"/usr/bin/
  install -m755 device-info "$pkgdir"/usr/bin/

  msg2 'GUI jar'
  # Note: the jar expects the GAPI* tools to live in the current directory
  install -m755 lib/gapic.jar "$pkgdir"/usr/bin/

  msg2 'Wrap gapid to look for the jar in the right place'
  # It looks in $PWD/lib/ otherwise, which will never be right...
  mv "$pkgdir"/usr/bin/gapid{,.internal}
  install -m755 ../gapid.sh "$pkgdir"/usr/bin/gapid

  msg2 'Vulkan layers'
  install -dm755 "$pkgdir"/usr/lib
  install -dm755 "$pkgdir"/usr/share/vulkan/explicit_layer.d/
  _install_vk_layer lib/libVkLayer_VirtualSwapchain.so lib/VirtualSwapchainLayer.json
  _install_vk_layer lib/libgapii.so lib/GraphicsSpyLayer.json

  msg2 'Desktop shortcut'
  install -Dm644 ../gapid.desktop "$pkgdir"/usr/share/applications/gapid.desktop
  install -Dm644 icon.png "$pkgdir"/usr/share/icons/hicolor/256x256/apps/gapid.png
}
