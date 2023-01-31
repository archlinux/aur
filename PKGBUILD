# Maintainer: Alberto Oliveira <orkan.aos@gmail.com>
# Previous Maintainer: Jeremy Kescher <jeremy@kescher.at>
# Previous Maintainer: Kenneth Endfinger <kaendfinger@gmail.com>
# Contributor: Alexandre Demers <alexandre.f.demers@gmail.com>

pkgname=lib32-spirv-tools
pkgver=2023.1
pkgrel=1
_headers_version=sdk-1.3.239.0
pkgdesc="API and commands for processing SPIR-V modules"
arch=('i686' 'x86_64')
url='https://github.com/KhronosGroup/SPIRV-Tools'
license=('Apache')
groups=('vulkan-devel')
depends=('lib32-gcc-libs'
         'spirv-tools'
)
makedepends=('cmake'
             'python'
             'git'
             'ninja'
)
source=("git+https://github.com/KhronosGroup/SPIRV-Tools.git#tag=v${pkgver}"
        "git+https://github.com/KhronosGroup/SPIRV-Headers.git#tag=${_headers_version}"
)
sha256sums=('SKIP'
            'SKIP'
)
conflicts=('lib32-spirv-tools')
provides=('lib32-spirv-tools')

# pkgver() {
#   git -C SPIRV-Tools describe --tags --abbrev=10 | sed 's/^v//; s/-/+/; s/-/./'
# }

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cmake \
      -Bbuild \
      -GNinja \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_INSTALL_LIBDIR=lib32 \
      -DCMAKE_BUILD_TYPE=RELEASE \
      -DBUILD_SHARED_LIBS=ON \
      -DSPIRV_TOOLS_BUILD_STATIC=OFF \
      -DSPIRV_WERROR=OFF \
      -S SPIRV-Tools \
      -DSPIRV-Headers_SOURCE_DIR="${srcdir}/SPIRV-Headers"
  ninja -C build
}

check() {
  ninja -C build test
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install

  # remove files
  rm -fr "${pkgdir:?}/usr/include"
  rm -fr "${pkgdir:?}/usr/share"

  install -Dm644 "$srcdir"/SPIRV-Tools/LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE

  cd "${pkgdir}/usr/bin"
  for i in $(find . -type f); do mv ${i} ${i}-32; done
  mv spirv-lesspipe.sh-32 spirv-lesspipe-32.sh
  sed 's|spirv-dis|spirv-dis-32|g' -i spirv-lesspipe-32.sh
}
