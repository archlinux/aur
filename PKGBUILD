# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>

pkgname=zapcc
pkgver=7.0.325000
pkgrel=3
pkgdesc='C++ compiler based on Clang, but significantly faster'
arch=('x86_64')
license=('custom')
url='https://zapcc.com/'
depends=('python' 'z3')
makedepends=('cmake' 'git' 'ninja')
conflicts=('clang')
source=("git+https://github.com/yrnkrn/zapcc.git#commit=9bd04e7")
sha256sums=('SKIP')

build() {
  mkdir -p build
  cd build
  cmake "../$pkgname" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLLVM_ENABLE_WARNINGS=OFF \
    -DCMAKE_BUILD_TYPE=Release \
    -DPYTHON_EXECUTABLE=/usr/bin/python \
    -G Ninja
  ninja
}

package() {
  cd build
  for component in clang-headers zapcc zapccs; do
    DESTDIR="$pkgdir" cmake -DCOMPONENT="$component" -P ./cmake_install.cmake
  done
  install -Dm644 ../$pkgname/LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et:
