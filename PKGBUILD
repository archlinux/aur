# -*- mode: sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='miniscript-cli'
_pkgname="${pkgname/-cli}"
pkgdesc='Simple, elegant language for embedding or learning to program'
pkgver=1.6.2
pkgrel=7
url='https://miniscript.org/'
_url='https://github.com/JoeStrout/miniscript'
changelog="$pkgname.changelog"
arch=('aarch64' 'x86_64')
license=('MIT')  # SPDX-License-Identifier: MIT
depends=('gcc-libs' 'glibc')
makedepends=('cmake' 'patch')
provides=('libminiscript-cpp' 'miniscript')
options=('staticlibs')
source=(
  "$pkgname-$pkgver.tar.gz::$_url/archive/refs/tags/v$pkgver.tar.gz"
  'miniscript-cli-mktime.diff'
)

prepare() {
  cd "$_pkgname-$pkgver"

  patch -p1 < ../miniscript-cli-mktime.diff
}

build() {
  cd "$_pkgname-$pkgver/MiniScript-cpp"

  mkdir -p "build"
  cd "build"

  test -n "$LTOFLAGS" && {
    export LTOFLAGS="$LTOFLAGS -ffat-lto-objects"
    export CFLAGS="$CFLAGS $LTOFLAGS"
    export CXXFLAGS="$CXXFLAGS $LTOFLAGS"
  }
  cmake ../.. && \
  cmake --build . --config Release
}

check() {
  cd "$_pkgname-$pkgver/MiniScript-cpp"

  build/miniscript -h 2>&1 | head -2
}

package() {
  cd "$_pkgname-$pkgver/MiniScript-cpp"

  install -vDm0755 -t "$pkgdir/opt/miniscript/" \
    build/miniscript
  install -vDm0644 -t "$pkgdir/usr/lib/" \
    build/libminiscript-cpp.a
  install -vDm0644 -t "$pkgdir/opt/miniscript/lib/" \
    lib/*.ms
  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname/demo/" \
    demo/*.ms

  cd ..

  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname/" \
    ./*.md
  install -vDm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" \
    LICENSE

  install -vdm0755 "$pkgdir/usr/bin"
  ln -vsf "/opt/miniscript/miniscript" "$pkgdir/usr/bin/miniscript"

}

sha256sums=(
  '62df0ce8faca21db588ed5f0abe020a41602c8fc02376f6b2385869863acbefd'
  '2b6b8a55ec46f6ce40aeec3ffd4c0d8a0a5d4c7ca499824ec8944729fcc5515d'
)
b2sums=(
  '07e1b8c37b382568495422747729546705cdc2b5d4f3a79e3b2b6435fe56e8776bb33941347c6e617851527d5224c8b40a914eb592bd210b4b97a23f38a91fae'
  '7d775db5fcb2362091cb32ab347af17397338733a044d2a6226534e4e8bea87065a055fffbfd1f7adc0c8a3ac44cf6623d2d36f22c7d519bcf45ddb3a0942f89'
)

# eof
