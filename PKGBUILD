#Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=shaderc-git
pkgver=v2020.4.1.g4089217
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
             'spirv-headers'
             )
provides=('shaderc'
          'libshaderc_shared.so'
          )
conflicts=('shaderc'
           )
source=('git+https://github.com/google/shaderc.git#branch=main'
        'fix-glslang-link-order.patch'
        )

sha256sums=('SKIP'
            'b4b05ccea7c2905cf018efef15a86d8807011db1a8cabe57314f6aaade33a644'
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
  CPPFLAGS="${CPPFLAGS//2/0}"

  cd build
  cmake ../shaderc \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DSHADERC_SKIP_TESTS=ON \
    -DBUILD_SHARED_LIBS=ON \
    -Dglslang_SOURCE_DIR=/usr/include/glslang \
    -GNinja

  LC_ALL=C ninja

  cd "${srcdir}/shaderc/glslc"
  asciidoctor -b manpage README.asciidoc -o glslc.1
}

package() {
  DESTDIR="${pkgdir}" ninja -C build  install

  install -Dm644 -t "${pkgdir}/usr/share/man/man1/" "$srcdir/shaderc/glslc/glslc.1"
}
