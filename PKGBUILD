# Maintainer: Kainoa Kanter <kainoa@t1c.dev>

_pkgname=openzl
pkgname="$_pkgname-git"
pkgver=r114.973a44c
pkgrel=1
pkgdesc='A novel data compression framework'
url='https://github.com/facebook/openzl'
arch=('aarch64' 'x86_64')
license=('BSD')
depends=('glibc')
makedepends=('clang' 'cmake' 'git')
provides=("$_pkgname" "libopenzl.so=0.1.0")
conflicts=("$_pkgname")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    ( set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
  cd "${srcdir}/${_pkgname}"
  mkdir -p build
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release -DOPENZL_BUILD_TESTS=ON -DOPENZL_ALLOW_INTROSPECTION=OFF ..
  cd ../
  make zli lib
}

package() {
  cd "${srcdir}/${_pkgname}"
  # DESTDIR="${pkgdir}" ninja -C build install
  install -Dm755 zli "$pkgdir/usr/bin/zli" 
  install -Dm755 libopenzl.so "$pkgdir/usr/lib/libopenzl.so"
  install -Dm644 libopenzl.a "$pkgdir/usr/lib/libopenzl.a"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
