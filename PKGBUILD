# Maintainer: Antoine Viallon <antoine@lesviallon.fr>
# Contributor: Hao Zhang <hzhangxyz@outlook.com>
# Contributor: René Hickersberger <r@renehsz.com>
pkgname=llvm-cbe-git
_pkgname="${pkgname%*-git}"
pkgver=r428.82fba9c
pkgrel=1
pkgdesc="resurrected LLVM C Backend, with improvements"
arch=(x86_64)
url="https://github.com/JuliaComputing/llvm-cbe"
license=('LLVM Release License')
depends=('llvm20')
makedepends=('cmake' 'git')

source=(
	"git+https://github.com/JuliaHubOSS/${_pkgname}.git"
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$_pkgname"
  mkdir -p build
  cd build
  cmake .. -DUSE_SYSTEM_LLVM=ON -DLLVM_DIR=/usr/lib/llvm20/lib/cmake/llvm/ -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  install -Dm644 "$srcdir"/llvm-cbe/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm755 "$srcdir"/llvm-cbe/build/tools/llvm-cbe/llvm-cbe "$pkgdir"/usr/bin/llvm-cbe
}

