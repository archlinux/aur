# Maintainer: Térence Clastres <t dot clastres at gmail dot com>
# Maintainer: jgmdev <jgmdev at gmail dot com>
# Contributor: redtide <redtid3 at gmail dot com>

pkgname=lite-xl
pkgver=2.0.5
pkgrel=2
pkgdesc='A lightweight text editor written in Lua'
arch=('x86_64' 'aarch64')
url="https://lite-xl.github.io"
license=('MIT')
makedepends=('meson')
conflicts=('lite')
provides=('lite')
# Comment to build non-jit version
_commit=bd36b44d615304b26e32fd11dc8b0f788fa795bf
if [ "$_commit" = "" ]; then
  depends=('agg' 'freetype2' 'lua52' 'pcre2' 'reproc' 'sdl2')
  source=("$pkgname-$pkgver.tar.gz::https://github.com/lite-xl/lite-xl/archive/v$pkgver.tar.gz")
  md5sums=('d7e0b2141a67725f75e93d45bd2d53f7')
else
  depends=('agg' 'freetype2' 'luajit' 'pcre2' 'reproc' 'sdl2')
  source=("$pkgname-$_commit.tar.gz::https://github.com/lite-xl/lite-xl/archive/${_commit}.zip")
  md5sums=('69a59c34ce201ec9071732b0f994a11c')
fi

build() {
  if [ "$_commit" = "" ]; then
    arch-meson "$pkgname-$pkgver" build
  else
    arch-meson "$pkgname-$_commit" build
  fi

  meson compile -C build
}

package() {
  meson install --skip-subprojects -C build --destdir "$pkgdir"

  if [ "$_commit" = "" ]; then
    cd "$pkgname-$pkgver"
  else
    cd "$pkgname-$_commit"
  fi

  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
