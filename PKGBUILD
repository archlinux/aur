# shellcheck shell=bash
# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='kanzi-git'
_pkgname="${pkgname/-git}"
pkgdesc='Modern, modular, portable and efficient lossless data compressor and decompressor (development version)'
pkgver=2.5.1.r5.g7f41e418
pkgrel=1
url='https://github.com/flanglet/kanzi-cpp'
arch=('aarch64' 'x86_64')
license=('Apache-2.0')  # SPDX-License-Identifier: Apache-2.0
makedepends=('cmake' 'git')
depends=('glibc' 'libgcc' 'libstdc++')
provides=('kanzi' 'libkanzi.so')
conflicts=("${provides[@]}")
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/$_pkgname/src"

  git clean -dfx
}

pkgver() {
  cd "$srcdir/$_pkgname"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"

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

  install -Dm0755 -t "$pkgdir/usr/bin" \
    build/kanzi
  install -Dm0644 -t "$pkgdir/usr/share/man/man1" \
    doc/kanzi.1
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname" \
    {README,SECURITY}.md

  install -Dm0755 -t "$pkgdir/usr/lib" \
    build/libkanzi.so

  install -Dm0644 -t "$pkgdir/usr/include/kanzi" \
    src/*.hpp

  _inc=(api bitstream entropy io transform util)
  for _dir in "${_inc[@]}"; do
    install -Dm0644 -t "$pkgdir/usr/include/kanzi/$_dir" \
      "src/$_dir"/*.hpp
  done

  cd "$pkgdir/usr/share/doc" \
  && ln -fs "$pkgname" "$_pkgname"
}

# eof
