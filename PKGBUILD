# Maintainer: Antoine Viallon <antoine@lesviallon.fr>
# Contributor: Hao Zhang <hzhangxyz@outlook.com>
pkgname=llvm-cbe-git
_pkgname="${pkgname%*-git}"
pkgver=r332.b110fb3
pkgrel=1
pkgdesc="resurrected LLVM C Backend, with improvements"
arch=(x86_64)
url="https://github.com/JuliaComputing/llvm-cbe"
license=('LLVM Release License')
depends=('llvm10')
makedepends=('cmake')

source=(
#  "git+https://github.com/woachk/llvm-cbe.git#branch=fix-llvm9"
	"git+https://github.com/JuliaComputing/${_pkgname}.git"
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
  cmake .. -DUSE_SYSTEM_LLVM=ON -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  install -Dm644 "$srcdir"/llvm-cbe/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm755 "$srcdir"/llvm-cbe/build/tools/llvm-cbe/llvm-cbe "$pkgdir"/usr/bin/llvm-cbe
}
