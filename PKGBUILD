#Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
pkgname=shaderc-git
pkgver=v2018.0.62.g59a49bc
pkgrel=1
pkgdesc="A collection of tools, libraries and tests for shader compilation. (GIT version)"
url='https://github.com/google/shaderc'
license=('Apache')
arch=('x86_64')
depends=('glslang'
         'spirv-tools'
         )
makedepends=('git'
             'ninja'
             'cmake'
             'python'
             'asciidoctor'
             )
conflicts=('shaderc')
provides=('shaderc'
          'shaderc-git'
          'libshaderc_shared.so'
          )

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
  cd build
  cmake ../shaderc \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DSHADERC_SKIP_TESTS=ON \
    -DBUILD_SHARED_LIBS=ON \
    -GNinja

  ninja

  cd "${srcdir}/shaderc/glslc"
  asciidoctor -b manpage README.asciidoc -o glslc.1
}

package() {
  DESTDIR="${pkgdir}" ninja -C build  install

  install -Dm644 -t "${pkgdir}/usr/share/man/man1/" "$srcdir/shaderc/glslc/glslc.1"
}
