# Maintainer: Andreas Baumann <mail at andreasbaumann dot cc>

pkgname=slimcc-git
_pkgname=slimcc
pkgver=r921.ff77023
pkgrel=1
pkgdesc='C23 compiler with C2y/GNU extensions for x86-64 Linux/BSD, written in C99'
arch=(x86_64)
url='https://github.com/fuhsnn/slimcc'
license=(MIT)
depends=(glibc)
makedepends=(git)
source=("${_pkgname}::git+https://github.com/fuhsnn/slimcc.git"
        slimcc-header-path.patch)
sha256sums=('SKIP'
            '91a92dffd0ca5c89c8d7baf76955d6c0ccb89a5d9e37d32e7d2ef75df69d43f1')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  patch -Np1 -i "$srcdir/slimcc-header-path.patch"
}

build() {
  cd "${srcdir}/${_pkgname}"
  ln -s platform/linux-glibc-generic.c platform.c
  make
}

check() {
  cd "${srcdir}/${_pkgname}"
  make test
}

package() {
  cd "${srcdir}/${_pkgname}"

  install -Dm755 slimcc "$pkgdir/usr/bin/slimcc"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -dm755 "$pkgdir/usr/lib/slimcc/include"
  install -Dm755 slimcc_headers/include/* "$pkgdir/usr/lib/slimcc/include"
  install -Dm755 slimcc_headers/platform_fix/linux_glibc/string.h "$pkgdir/usr/lib/slimcc/include"
  install -dm755 "$pkgdir/usr/lib/slimcc/include/bits"
  install -Dm755 slimcc_headers/platform_fix/linux_glibc/bits/* "$pkgdir/usr/lib/slimcc/include/bits"
  install -dm755 "$pkgdir/usr/lib/slimcc/include/sys"
  install -Dm755 slimcc_headers/platform_fix/linux_glibc/sys/* "$pkgdir/usr/lib/slimcc/include/sys"
}
