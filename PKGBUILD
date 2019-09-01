#Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=lib32-shaderc-git
pkgver=v2019.0.72.gf478667
pkgrel=1
pkgdesc="A collection of tools, libraries and tests for shader compilation. (GIT version)"
url='https://github.com/google/shaderc'
license=('Apache')
arch=('x86_64')
depends=('shaderc'
         'lib32-glibc'
         'lib32-gcc-libs'
         'lib32-glslang'
         'lib32-spirv-tools'
        )
makedepends=('cmake'
             'ninja'
             'python'
             )
provides=('lib32-shaderc'
          'libshaderc_shared.so'
          )
conflicts=('lib32-shaderc')
source=('git+https://github.com/google/shaderc.git'
        'fix-glslang-link-order.patch::https://patch-diff.githubusercontent.com/raw/google/shaderc/pull/463.patch'
        )

sha256sums=('SKIP'
            'SKIP'
            )

pkgver() {
  cd shaderc
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build

  cd shaderc
  patch -p1 -i "${srcdir}/fix-glslang-link-order.patch"

  # de-vendor libs and disable git versioning
  sed '/examples/d;/third_party/d' -i CMakeLists.txt
  sed '/build-version/d' -i glslc/CMakeLists.txt
  cat <<- EOF > glslc/src/build-version.inc
"${pkgver}\\n"
"$(pacman -Q spirv-tools|cut -d \  -f 2|sed 's/-.*//')\\n"
"$(pacman -Q glslang|cut -d \  -f 2|sed 's/-.*//')\\n"
EOF
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd build
  cmake ../shaderc \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib32 \
    -DSHADERC_SKIP_TESTS=ON \
    -DBUILD_SHARED_LIBS=ON \
    -GNinja

  ninja
}

package() {
  DESTDIR="${pkgdir}" ninja -C build  install
  
  rm -fr "${pkgdir}/usr/include"
  mv "${pkgdir}/usr/bin/glslc" "${pkgdir}/usr/bin/glslc-32"
}
