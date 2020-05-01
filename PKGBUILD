# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Tetsumi <tetsumi@vmail.me>

pkgname=wren
pkgver=0.1.0
pkgrel=2
pkgdesc='Small, fast, class-based concurrent scripting language'
makedepends=('setconf' 'libuv' 'git' 'python2')
depends=('glibc')
license=('MIT')
arch=('x86_64')
url='http://wren.io/'
source=("git+https://github.com/munificent/wren.git#commit=417ed7a"
        "git+https://chromium.googlesource.com/external/gyp.git#commit=aae1e3efb50786df20e9572621fb746865f0df53"
        "git+https://github.com/libuv/libuv.git#commit=cd37fd0")
md5sums=('SKIP'
         'SKIP'
         'SKIP')

prepare() {
  # silence warnings
  setconf wren/util/wren.mk C_WARNINGS '-w'
  sed 's/ rcu / rc /g' -i wren/util/wren.mk
  # libuv and gyp
  setconf wren/util/libuv.py LIB_UV_VERSION "\"v$(pkg-config --modversion libuv)\""
  mkdir -p wren/deps
  cp -ru libuv wren/deps
  mkdir -p wren/deps/libuv/build
  cp -ru gyp wren/deps/libuv/build/gyp
  # no downloads, use the existing git clones
  sed -i 's:download:>/dev/null:g' wren/util/wren.mk
}

build() {
  make -C wren
}

package() {
  install -Dm755 wren/bin/wren "$pkgdir/usr/bin/wren"
  install -Dm644 wren/src/include/wren.h "$pkgdir/usr/include/wren.h"
  install -Dm755 wren/lib/libwren.so "$pkgdir/usr/lib/libwren.so"
  install -Dm644 wren/LICENSE "$pkgdir/usr/share/licenses/wren/LICENSE"
}

# vim:set ts=2 sw=2 et:
