# Maintainer: Denis Benato <benato.denis96 [at] gmail dot com>
# Contributor: Robert Manner <the_manni at users.sf.net>

pkgname=directx-shader-compiler-git
_pkgname=DirectXShaderCompiler
pkgdesc="A compiler for HLSL to DXIL (DirectX Intermediate Language)."
pkgver=r3839.740dd0951
pkgrel=1
epoch=1
arch=('x86_64')
url="https://github.com/microsoft/${_pkgname}"
license=('BSD')  # NCSA
makedepends=('cmake' 'git' 'python')
# package 'ninja' not needed actually
source=("git+https://github.com/microsoft/${_pkgname}.git")
sha256sums=('SKIP')

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
}

build() {
  mkdir -p "$srcdir/${_pkgname}/build"
  cd "$srcdir/${_pkgname}/build"

  export CXXFLAGS="$CXXFLAGS -Wno-error=restrict"
  cmake .. -G"Unix Makefiles" -DCMAKE_BUILD_TYPE=Release -C ../cmake/caches/PredefinedParams.cmake -DCMAKE_INSTALL_LIBDIR=/opt/directx-shader-compiler/lib -DCMAKE_INSTALL_PREFIX=/opt/directx-shader-compiler CFLAGS="$CFLAGS -Wno-error=restrict" -DLLVM_BUILD_TOOLS=OFF
  make -j$(nproc)
  #cmake --build .
}

package() {
  cd "$srcdir/${_pkgname}"
  make -C build DESTDIR="$pkgdir" install
  #DESTDIR="$pkgdir" cmake --install build
  mkdir -p "$pkgdir/usr/bin"
  ln -s "/opt/directx-shader-compiler/bin/dxc" "$pkgdir/usr/bin/dxc"
  ln -s "/opt/directx-shader-compiler/bin/dxa" "$pkgdir/usr/bin/dxa"
  ln -s "/opt/directx-shader-compiler/bin/dxl" "$pkgdir/usr/bin/dxl"
  ln -s "/opt/directx-shader-compiler/bin/dxv" "$pkgdir/usr/bin/dxv"
  ln -s "/opt/directx-shader-compiler/bin/dxopt" "$pkgdir/usr/bin/dxopt"

  # TODO install license install -Dm 644 -t $pkgdir/usr/lib/systemd/system $srcdir/anbox-container-manager.service
}
