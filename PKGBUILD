# Contributor: PedroHLC <root@pedrohlc.com>
# Contributor: Adrià Cereto i Massagué <ssorgatem at gmail.com>
# Contributor: Anna <morganamilo@gmail.com>

project=vk9
pkgbase=vk9-git
pkgname=('vk9-git' 'lib32-vk9-git')
pkgver=0.29.0.67.gd9654c8
pkgrel=1
pkgdesc='Direct3D 9 compatibility layer using Vulkan.'
arch=('x86_64')
url='https://github.com/disks86/VK9'
license=('zlib')
options=(!strip !buildflags staticlibs)
makedepends=('ninja' 'meson>=0.43' 'git' 'wine>=3.5' 'shaderc' 'util-linux' 'cmake'
		'mingw-w64-meson' 'mingw-w64-cmake' 'mingw-w64-eigen')
source=($project::'git+https://github.com/Guy1524/VK9.git')
sha256sums=('SKIP')


pkgver() {
  cd "$srcdir/$project"
  git describe --tags | sed s/"-"/"."/g
}

build() {
  cd "$srcdir/$project"
  export WINEPREFIX="$srcdir/wine/VK9-build"
  mkdir -p "$WINEPREFIX"
  
  #./package-release.sh $pkgver '..' --no-package --keep-builddir
  VK9_BUILD_DIR="$srcdir/$project-$pkgver"
  for arch in 'x86_64' 'i686'; do
    $arch-w64-mingw32-meson \
        --buildtype 'release' \
        --unity off \
        --strip \
        -Db_pch=true \
        -Denable_tests=false \
        "$VK9_BUILD_DIR/build.$arch"

    pushd "$VK9_BUILD_DIR/build.$arch"
    ninja
    popd
  done
}

# TODO: Make it compatible with archlinux32 too
package_vk9-git() {
  conflicts=('vk9-bin' 'vk9')
  provides=('vk9')
  depends=('vulkan-icd-loader' 'wine')
  
  cd "$srcdir/$project-$pkgver/build.x86_64"
  install -Dm644 'VK9-Library/d3d9.dll' "$pkgdir/usr/share/VK9/x64/d3d9.dll"
  install -Dm755 'wine_utils/setup_vk9.sh' "$pkgdir/usr/share/VK9/x64/setup_vk9.sh"

  cd "$srcdir/$project"
  install -Dm644 'wine_utils/setup_vk9.verb' "$pkgdir/usr/share/VK9/setup_vk9.verb"
}

package_lib32-vk9-git() {
  pkgdesc+=" (32-bit)"
  conflicts=('lib32-vk9-bin' 'lib32-vk9')
  provides=('lib32-vk9')
  depends=('lib32-vulkan-icd-loader' 'wine')
  
  cd "$srcdir/$project-$pkgver/build.i686"
  install -Dm644 'VK9-Library/d3d9.dll' "$pkgdir/usr/share/VK9/x32/d3d9.dll"
  install -Dm755 'wine_utils/setup_vk9.sh' "$pkgdir/usr/share/VK9/x32/setup_vk9.sh"
  
  cd "$srcdir/$project"
  install -Dm644 'wine_utils/setup_vk9.verb' "$pkgdir/usr/share/VK9/setup_vk9-32.verb"
}
