# Maintainer: Felix Weilbach <fweilbach@proton.me>
pkgname=puppetxr
pkgver=0.2.0
pkgrel=1
pkgdesc='OpenXR simulator runtime: simulated headset and controllers driven by keyboard and mouse'
arch=('x86_64')
url='https://github.com/FlexW/puppetxr'
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cmake' 'ninja' 'python' 'shaderc')
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
install=$pkgname.install
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver-src.tar.gz")
sha256sums=('edd0178cf43823d0154fa7a0f7477f6a6381a879b7acce81481a4ebcff5107ca')

build() {
  cmake -S "$pkgname-$pkgver-src" -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DPUPPETXR_DIST=ON \
    -DPUPPETXR_WERROR=OFF \
    -DPUPPETXR_BUILD_TESTS=OFF \
    -DPUPPETXR_BUILD_APPS=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$pkgname-$pkgver-src/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
