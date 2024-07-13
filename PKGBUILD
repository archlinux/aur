# -*- mode: sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='miniscript-cli'
_pkgname="${pkgname/-cli}"
pkgdesc='Simple, elegant programming language'
pkgver=1.6.2
pkgrel=2
epoch=
url='https://miniscript.org/'
_url='https://github.com/JoeStrout/miniscript'
changelog="$pkgname.changelog"
arch=('aarch64' 'x86_64')
license=('MIT')  # SPDX-License-Identifier: MIT
depends=('gcc-libs' 'glibc')
makedepends=('cmake')
provides=('miniscript')
options=('lto')
source=(
  "$pkgname-$pkgver.tar.gz::$_url/archive/refs/tags/v$pkgver.tar.gz"
)

build() {
  cd "$_pkgname-$pkgver/MiniScript-cpp"

  mkdir -p "build"
  cd "build"

  # RFC-0023
  # 🔗 https://rfc.archlinux.page/0023-pack-relative-relocs/
  #
  # ld(1) says: “Supported for i386 and x86-64.”
  case "Z${CARCH:-unknown}" in
    'Zx86_64' | 'Zi386' )
      export LDFLAGS="$LDFLAGS -Wl,-z,pack-relative-relocs"
    ;;
    * ) : pass ;;
  esac

  cmake ../.. && \
  cmake --build . --config Release
}

check() {
  cd "$_pkgname-$pkgver/MiniScript-cpp"

  build/miniscript -h 2>&1 | head -2
}

package() {
  cd "$_pkgname-$pkgver/MiniScript-cpp"

  install -vDm0755 -t "$pkgdir/opt/miniscript" \
    build/miniscript
  install -vDm0644 -t "$pkgdir/opt/miniscript/lib" \
    lib/*.ms
  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname/demo" \
    demo/*.ms

  cd ..

  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname" \
    *.md
  install -vDm0644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    LICENSE

  install -vdm0755 "$pkgdir/usr/bin"
  ln -vsf "/opt/miniscript/miniscript" "$pkgdir/usr/bin/miniscript"

}

sha256sums=(
  '62df0ce8faca21db588ed5f0abe020a41602c8fc02376f6b2385869863acbefd'
)
b2sums=(
  '07e1b8c37b382568495422747729546705cdc2b5d4f3a79e3b2b6435fe56e8776bb33941347c6e617851527d5224c8b40a914eb592bd210b4b97a23f38a91fae'
)

# eof
