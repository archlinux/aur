# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='fastgron-git'
_pkgname='fastgron'
pkgver=0.6.4.r1.gf89e790
pkgrel=1
pkgdesc='High-performance JSON to GRON (greppable, flattened JSON) converter (development version)'
arch=('x86_64' 'aarch64')
url='https://github.com/adamritter/fastgron'
license=('MIT')
depends=('curl' 'gcc-libs' 'glibc')
makedepends=('cmake' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+${url}.git")
noextract=("$_pkgname")
sha256sums=('SKIP')
options=('lto')

pkgver() {
  cd "$_pkgname"

  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

prepare() {
  export CFLAGS="${CFLAGS} -DNDEBUG"
  export CXXFLAGS="${CXXFLAGS} -DNDEBUG"

  cmake -B build -S "${_pkgname}" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
}

build() {
  cmake --build build
}

check() {
  make -C build test
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  install -Dm0644 "$_pkgname/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm0644 "$_pkgname/LICENSE"   "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# eof
