# Maintainer: dobragab <dobragab@gmail.com>

pkgname=('ccsh-git' 'ccsh-shell-git' 'ccsh-wrappers-core-git')
pkgver=r83.d0f0cf5
pkgrel=1
pkgdesc='C++ shell'
arch=('any')
url='https://github.com/cpp-ftw/ccsh'
license=('GPL3')
depends=('boost')
makedepends=('git' 'cmake' 'make')
source=("git+https://github.com/cpp-ftw/ccsh.git")
md5sums=(SKIP)

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package_ccsh-git() {
  cd "${pkgname}"
  
  cmake . -DWITH_LIB=ON -DWITH_TEST=OFF -DWITH_CLING=OFF
  make
  
  install -Dm644 "$srcdir/lib/libccsh_lib.so" "$pkgdir/usr/lib/libccsh_lib.so"
  
  install -dm755 "$pkgdir/usr/include/ccsh"
  install -Dm644 $srcdir/include/ccsh/* "$pkgdir/usr/include/ccsh"
}

package_ccsh-shell-git() {
  depends=('ccsh-git')
  
  cmake . -DWITH_LIB=OFF -DWITH_TEST=OFF -DWITH_CLING=ON 
  make
  
  install -Dm755 "$srcdir/ccsh" "$pkgdir/usr/bin/ccsh"
  install -Dm644 "$srcdir/ccsh/ui/clingrc.hpp" "$pkgdir/etc/ccsh/clingrc.hpp"
}


package_ccsh-wrappers-core-git() {
  depends=('ccsh-git')
	
  install -Dm755 "$srcdir/wrappers/ccsh/" "$pkgdir/usr/include/ccsh"

  install -dm755 "$pkgdir/usr/wrappers/ccsh/core"
  install -Dm644 "$srcdir/wrappers/ccsh/core.hpp" "$pkgdir/usr/include/ccsh/core.hpp"
  install -Dm644 $srcdir/wrappers/ccsh/core/* "$pkgdir/usr/include/ccsh"
}

