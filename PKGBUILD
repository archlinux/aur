# Maintainer: Robert Manner <the_manni at users.sf.net>

pkgname=directx-shader-compiler-git
_pkgname=DirectXShaderCompiler
pkgdesc="A compiler for HLSL to DXIL (DirectX Intermediate Language)."
pkgver=r2338.f8d0271d4
pkgrel=1
epoch=1
arch=('x86_64')
url="https://github.com/microsoft/${_pkgname}"
license=('BSD')  # NCSA
makedepends=('cmake' 'git')
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

  cmake .. -DCMAKE_BUILD_TYPE=Release $(cat ../utils/cmake-predefined-config-params) -DCMAKE_INSTALL_LIBDIR=/opt/directx-shader-compiler/lib -DCMAKE_INSTALL_PREFIX=/opt/directx-shader-compiler
  make
}

package() {
  cd "$srcdir/${_pkgname}"
  make -C build DESTDIR="$pkgdir" install

  # TODO install license install -Dm 644 -t $pkgdir/usr/lib/systemd/system $srcdir/anbox-container-manager.service
}
