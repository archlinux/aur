# Maintainer: Felix Weilbach <fweilbach@proton.me>
pkgname=puppetxr-bin
_pkgname=puppetxr
pkgver=0.2.0
pkgrel=1
pkgdesc='OpenXR simulator runtime: simulated headset and controllers driven by keyboard and mouse (prebuilt)'
arch=('x86_64')
url='https://github.com/FlexW/puppetxr'
license=('MIT')
depends=('glibc')
# Loaded at run time with dlopen, so not linked; a window needs X11 or Wayland
optdepends=('vulkan-icd-loader: Vulkan apps'
            'libglvnd: OpenGL apps'
            'libx11: mirror window on X11'
            'libxcursor: mirror window on X11'
            'libxi: mirror window on X11'
            'libxrandr: mirror window on X11'
            'wayland: mirror window on Wayland'
            'libxkbcommon: keyboard input on Wayland'
            'fontconfig: UI fonts'
            'openxr: OpenXR loader for apps')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('!strip' '!debug')
install=$_pkgname.install
source=("$url/releases/download/v$pkgver/$_pkgname-$pkgver-linux-x86_64.tar.gz")
sha256sums=('1572bd09be3d4614fa291b865720415263216d1424045a7c7a53f9e904ea1464')

package() {
  cd "$_pkgname-$pkgver-linux-x86_64"
  install -Dm755 bin/puppetxrctl "$pkgdir/usr/bin/puppetxrctl"
  install -Dm755 lib64/libpuppetxr.so "$pkgdir/usr/lib/libpuppetxr.so"
  install -Dm644 include/puppetxr.h "$pkgdir/usr/include/puppetxr.h"
  # The release is laid out for lib64; Arch keeps libraries in /usr/lib
  sed 's|/lib64/libpuppetxr.so|/lib/libpuppetxr.so|' share/openxr/1/puppetxr.json \
    | install -Dm644 /dev/stdin "$pkgdir/usr/share/openxr/1/puppetxr.json"
  install -Dm644 share/doc/puppetxr/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
