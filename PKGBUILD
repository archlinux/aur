# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='kanzi-git'
_pkgname="${pkgname/-git}"
pkgver=2.4.0.r58.gc2166c5e
pkgrel=1
pkgdesc='Modern, modular, portable and efficient lossless data compressor and decompressor (development version)'
arch=('aarch64' 'x86_64')
url='https://github.com/flanglet/kanzi-cpp'
source=("$_pkgname::git+$url.git")
license=('Apache-2.0')  # SPDX-License-Identifier: Apache-2.0
provides=('kanzi' 'libkanzi.so')
conflicts=("${provides[@]}")
depends=('gcc-libs' 'glibc')
makedepends=('cmake' 'git')

prepare() {
  cd "$srcdir/$_pkgname/src"

  git clean -dfx
}

pkgver() {
  cd "$srcdir/$_pkgname"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname/src"

  export CXXFLAGS="-std=c++20 $CXXFLAGS"
  test -n "$LTOFLAGS" && export CXXFLAGS="$CXXFLAGS $LTOFLAGS"
  test -d build && rm -rf build

  mkdir -p build \
  && cd build    \
  && cmake ..    \
  && make kanzi
}

package() {
  cd "$srcdir/$_pkgname"

  install -vDm0755 -t "$pkgdir/usr/bin" \
    src/build/kanzi
  install -vDm0644 -t "$pkgdir/usr/share/man/man1" \
    kanzi.1.gz
  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname" \
    {README,SECURITY}.md

  install -vDm0755 -t "$pkgdir/usr/lib" \
    src/build/libkanzi.so

  install -vDm0644 -t "$pkgdir/usr/include/kanzi" \
    src/*.hpp

  _inc=(api bitstream entropy io transform util)
  for _dir in "${_inc[@]}"; do
    install -vDm0644 -t "$pkgdir/usr/include/kanzi/$_dir" \
      "src/$_dir"/*.hpp
  done

  cd "$pkgdir/usr/share/doc" \
  && ln -vfs "$pkgname" "$_pkgname"
}

sha256sums=('SKIP')

# eof
