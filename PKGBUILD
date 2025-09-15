# Maintainer: Denis Benato <benato.denis96 [at] gmail dot com>
# Contributor: Robert Manner <the_manni at users.sf.net>

pkgname=directx-shader-compiler-git
_pkgname=DirectXShaderCompiler
pkgdesc="A compiler for HLSL to DXIL (DirectX Intermediate Language)."
pkgver=r5040.9c8b79b27
pkgrel=1
epoch=1
arch=('x86_64')
url="https://github.com/microsoft/${_pkgname}"
license=('BSD')  # NCSA
makedepends=('cmake' 'git' 'python')
# package 'ninja' not needed actually
source=(
  "git+https://github.com/microsoft/${_pkgname}.git"
  "LICENSE"
)
sha256sums=(
  'SKIP'
  'a6bce372d524a7cd48b0e7a40d51198e29cd6ccf897f5839e040f21aa25de037'
)

provides=('directx-shader-compiler')
conflicts=('directx-shader-compiler')

pkgver() {
  cd "$srcdir/$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "$srcdir/${_pkgname}"
  git submodule update --init

  # although removing build folder in build() function feels more natural,
  # that interferes with the spirit of makepkg --noextract
  if [  -d "$srcdir/${_pkgname}/build" ]; then
    rm -rf "$srcdir/${_pkgname}/build"
  fi
}

build() {
  mkdir -p "$srcdir/${_pkgname}/build"
  cd "$srcdir/${_pkgname}/build"

  #file to edit: 
  sed -i '/#include \"llvm\/ADT\/StringRef.h\"/a#include <cstdint>\n' ../tools/clang/include/clang/Basic/Version.h

  # this project needs a specific compiler and a specific set of flags
  export CC="gcc"
  export CXX="g++"
  export CFLAGS="-march=native -mtune=native -O2 -pipe -fno-plt -fexceptions -fPIC \
        -Wp,-D_FORTIFY_SOURCE=2 -Wformat -Werror=format-security \
        -fstack-clash-protection -fcf-protection -Wno-error=restrict -Wno-changes-meaning"
  export CXXFLAGS="$CFLAGS -Wp,-D_GLIBCXX_ASSERTIONS"
  export LDFLAGS="-Wl,-O2,--sort-common,--as-needed,-z,relro,-z,now"

  cmake .. -G"Unix Makefiles" -DCMAKE_BUILD_TYPE=Release -C ../cmake/caches/PredefinedParams.cmake -DCMAKE_INSTALL_LIBDIR=/opt/directx-shader-compiler/lib -DCMAKE_INSTALL_PREFIX=/opt/directx-shader-compiler -DLLVM_BUILD_TOOLS=OFF
  make -j$(nproc)
  #cmake --build .
}

package() {
  cd "$srcdir/${_pkgname}"
  cp "$srcdir/LICENSE" "$srcdir/${_pkgname}"

  make -C build DESTDIR="$pkgdir" install
  #DESTDIR="$pkgdir" cmake --install build
  mkdir -p "$pkgdir/usr/bin"
  ln -s "/opt/directx-shader-compiler/bin/dxc" "$pkgdir/usr/bin/dxc"
  ln -s "/opt/directx-shader-compiler/bin/dxa" "$pkgdir/usr/bin/dxa"
  ln -s "/opt/directx-shader-compiler/bin/dxl" "$pkgdir/usr/bin/dxl"
  ln -s "/opt/directx-shader-compiler/bin/dxv" "$pkgdir/usr/bin/dxv"
  ln -s "/opt/directx-shader-compiler/bin/dxopt" "$pkgdir/usr/bin/dxopt"

  install -D -m644 "$srcdir/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
