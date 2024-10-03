# Maintainer: Cedric Girard <cgirard [dot] archlinux [at] valinor [dot] fr>

pkgname=libcrossguid-git
pkgver=0.2.2.r52.gca1bf4b
pkgrel=3
pkgdesc="Lightweight cross platform C++ GUID/UUID library"
arch=('i686' 'x86_64')
url="https://github.com/graeme-hill/crossguid"
license=('MIT')
makedepends=('git' 'cmake')
provides=('libcrossguid')
conflicts=('libcrossguid')
source=(
  'libcrossguid::git+https://github.com/graeme-hill/crossguid.git'
  'cstdint.diff::https://github.com/graeme-hill/crossguid/pull/67.diff'
)
sha256sums=('SKIP'
            '17f3cb3951be4e04e53d3a1005339663b98053928715bf216512a01c2fa7e9e9')

pkgver() {
  cd "$srcdir"/libcrossguid
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir"/libcrossguid
  patch -p1 < ../cstdint.diff
}

build() {
  cd "$srcdir"/libcrossguid
  cmake .
  make

}

check(){
  cd "$srcdir"/libcrossguid
  ./crossguid-test
}

package() {
  cd "$srcdir"/libcrossguid
  install -D -m644 libcrossguid.a "${pkgdir}/usr/lib/libcrossguid.a"
  install -D -m644 include/crossguid/guid.hpp "${pkgdir}/usr/include/crossguid/guid.hpp"
  install -D -m644 crossguid.pc "${pkgdir}/usr/lib/pkgconfig/crossguid.pc"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
