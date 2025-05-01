# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='fastgron-git'
_pkgname='fastgron'
pkgver=0.7.7.r6.g5d5998f
pkgrel=4
pkgdesc='High-performance JSON to GRON (greppable, flattened JSON) converter (development version)'
arch=('aarch64' 'x86_64')
url='https://github.com/adamritter/fastgron'
license=('MIT')  # SPDX-License-Identifier: MIT
depends=('gcc-libs' 'glibc' 'libcurl.so')
makedepends=('cmake' 'git')
provides=("$_pkgname")
conflicts=("${provides[@]}")
source=("git+$url.git")
noextract=("$_pkgname")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"

  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

prepare() {
  git clean -dfx "$_pkgname"

  export CFLAGS="$CFLAGS -DNDEBUG"
  export CXXFLAGS="$CXXFLAGS -DNDEBUG"

  export CMAKE_POLICY_VERSION_MINIMUM=3.5
  cmake -B build -S "$_pkgname" \
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
  DESTDIR="$pkgdir" cmake --install build

  install -vDm0644 "$_pkgname/GRON.md"   "$pkgdir/usr/share/doc/$pkgname/GRON.md"
  install -vDm0644 "$_pkgname/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -vDm0644 "$_pkgname/LICENSE"   "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# eof
