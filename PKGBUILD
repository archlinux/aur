# Maintainer: Laurent Carlier <lordheavym@gmail.com>

pkgname=lib32-spirv-tools
pkgver=2018.4
_spirv_headers_commit=ff684ffc6a35d2a58f0f63108877d0064ea33feb
pkgrel=1
pkgdesc="API and commands for processing SPIR-V modules"
arch=('x86_64')
url="https://www.khronos.org/vulkan/"
license=('custom')
groups=(vulkan-devel)
depends=(gcc-libs vulkan-tools)
makedepends=(cmake python git)
source=("git+https://github.com/KhronosGroup/SPIRV-Tools.git#tag=v${pkgver}"
        "git+git://github.com/KhronosGroup/SPIRV-Headers.git#commit=${_spirv_headers_commit}")
sha256sums=('SKIP'
            'SKIP')

build() {
  cd SPIRV-Tools

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  
  rm -rf build && mkdir build && cd build
  # Disable werror or it fail to build with:
  # text_handler.cpp: In member function ‘spv_result_t libspirv::AssemblyContext::binaryEncodeString(const char*, spv_instruction_t*)’:
  # text_handler.cpp:316:10: warning: ‘char* strncpy(char*, const char*, size_t)’ output truncated before terminating nul copying as many bytes from a string as its 
  # length [-Wstringop-truncation]
  cmake .. \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_INSTALL_LIBDIR=lib32 \
      -DCMAKE_BUILD_TYPE=Release \
      -DSPIRV_WERROR=Off \
      -DSPIRV-Headers_SOURCE_DIR=${srcdir}/SPIRV-Headers
  make
}

package() {
  cd SPIRV-Tools/build

  make DESTDIR="${pkgdir}" install

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"

  cd "${pkgdir}/usr/bin"
  for i in $(find . -type f); do mv ${i} ${i}-32; done
  mv spirv-lesspipe.sh-32 spirv-lesspipe-32.sh
  sed 's|spirv-dis|spirv-dis-32|g' -i spirv-lesspipe-32.sh

  # remove files
  rm -fr "${pkgdir}/usr/include"
  rm -fr "${pkgdir}/usr/share"
}
