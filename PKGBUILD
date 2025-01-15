# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Eric Engestrom <aur@engestrom.ch>
# Contributor: Yevhenii Kolesnikov <sigexp.acc at gmail dot com>

pkgname=gfxreconstruct
pkgver=1.4.304.0
pkgrel=1
pkgdesc="Graphics API Capture and Replay Tools for Reconstructing Graphics Application Behavior"
arch=(x86_64 aarch64)
url="https://github.com/LunarG/gfxreconstruct"
license=(MIT)
depends=(python zlib lz4 zstd gcc-libs glibc)
makedepends=(cmake git ninja xcb-util-keysyms libx11 libxcb wayland libxrandr)
source=("git+https://github.com/LunarG/gfxreconstruct.git#tag=vulkan-sdk-$pkgver"
        "git+https://github.com/KhronosGroup/Vulkan-Headers.git"
        "git+https://github.com/KhronosGroup/SPIRV-Headers.git"
        "git+https://github.com/KhronosGroup/SPIRV-Reflect.git")
sha256sums=('70957e18eb75412fee0f55557db6947a7b39f0d0b6ec780d19fe734184542ded'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
  cd $pkgname
  git submodule init
  git config submodule.external/Vulkan-Headers.url "$srcdir/Vulkan-Headers"
  git config submodule.external/SPIRV-Headers.url "$srcdir/SPIRV-Headers"
  git config submodule.external/SPIRV-Reflect.url "$srcdir/SPIRV-Reflect"
  git -c protocol.file.allow=always submodule update
}

build() {
  cmake -B build -S "gfxreconstruct" -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -D gfxreconstruct/LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"

  # 'Remove .py file extension from files that are going to /usr/bin/'
  for f in $pkgdir/usr/bin/*.py; do
    mv -v $f ${f%.py}
  done
}
