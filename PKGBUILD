# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Sven-Hendrik Haase <svenstaro@gmail.com>

# Careful when upgrading this package! It usually breaks ABI without bumping soname.
pkgname=glslang-minimal-git
pkgver=11.0.0
pkgrel=1
pkgdesc='OpenGL and OpenGL ES shader front end and validator'
arch=('x86_64')
url='https://github.com/KhronosGroup/glslang'
license=('BSD')
depends=('gcc-libs' 'spirv-tools' 'python')
makedepends=('cmake' 'ninja')
provides=(glslang)
conflicts=(glslang)
options=('staticlibs')
source=("git+https://github.com/KhronosGroup/glslang")
sha256sums=('SKIP')

pkgver() {
   cd glslang
   git describe --long --tags --exclude master-tot --exclude SDK-candidate\* --exclude untagged\* | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd glslang
  mkdir -p build-{shared,static}
  (cd build-shared
    cmake .. \
      -GNinja \
      -DCMAKE_INSTALL_PREFIX='/usr' \
      -DCMAKE_BUILD_TYPE='Release' \
      -DCMAKE_ENABLE_GLSLANG_JS='OFF' \
      -DCMAKE_ENABLE_GLSLANG_WEBMIN='OFF' \
      -DCMAKE_ENABLE_GLSLANG_WEBMIN_DEVEL='OFF' \
      -DCMAKE_INSTALL_LIBDIR='/usr/lib' \
      -DBUILD_SHARED_LIBS='ON'
    ninja
  )
  (cd build-static
    cmake .. \
      -GNinja \
      -DCMAKE_INSTALL_PREFIX='/usr' \
      -DCMAKE_BUILD_TYPE='Release' \
      -DCMAKE_ENABLE_GLSLANG_JS='OFF' \
      -DCMAKE_ENABLE_GLSLANG_WEBMIN='OFF' \
      -DCMAKE_ENABLE_GLSLANG_WEBMIN_DEVEL='OFF' \
      -DCMAKE_INSTALL_LIBDIR='/usr/lib' \
      -DBUILD_SHARED_LIBS='OFF'
    ninja
  )
}

package() {
  cd glslang
  DESTDIR="${pkgdir}" ninja $NINJAFLAGS -C build-shared install
  DESTDIR="${pkgdir}" ninja $NINJAFLAGS -C build-static install

  install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE

  cd "${pkgdir}"/usr/lib
  for lib in *.so; do
    ln -sf "${lib}" "${lib}.0"
  done
}

# vim: ts=2 sw=2 et:
