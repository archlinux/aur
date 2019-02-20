# Maintainer: Laurent Carlier <lordheavym@gmail.com>

pkgname=lib32-spirv-tools
pkgver=2018.5
pkgrel=1
pkgdesc="API and commands for processing SPIR-V modules"
arch=('x86_64')
url='https://www.khronos.org/vulkan'
license=('custom')
groups=('vulkan-devel')
depends=('lib32-gcc-libs'
         'vulkan-tools'
         'spirv-tools'
         )
makedepends=('cmake'
             'python'
             'git'
             )
source=("git+https://github.com/KhronosGroup/SPIRV-Tools.git#tag=v${pkgver}"
        'git+https://github.com/KhronosGroup/SPIRV-Headers.git'
        )
sha256sums=('SKIP'
            'SKIP'
            )

prepare() {
  mkdir -p build
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd build

  cmake ../SPIRV-Tools \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_INSTALL_LIBDIR=lib32 \
      -DCMAKE_BUILD_TYPE=None \
      -DSPIRV_WERROR=OFF \
      -DSPIRV-Headers_SOURCE_DIR="${srcdir}/SPIRV-Headers"

  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install

  # remove files
  rm -fr "${pkgdir}/usr/include"
  rm -fr "${pkgdir}/usr/share"

  install -Dm644 SPIRV-Tools/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "${pkgdir}/usr/bin"
  for i in $(find . -type f); do mv ${i} ${i}-32; done
  mv spirv-lesspipe.sh-32 spirv-lesspipe-32.sh
  sed 's|spirv-dis|spirv-dis-32|g' -i spirv-lesspipe-32.sh
}
