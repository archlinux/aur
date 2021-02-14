# Maintainer: loathingkernel <loathingkernel a_ gmail d_ com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=wine-mono-bin
pkgver=6.0.0
pkgrel=1
pkgdesc="Wine's built-in replacement for Microsoft's .NET Framework"
arch=('any')
url="https://wiki.winehq.org/Mono"
license=('GPL' 'LGPL2.1' 'MPL')
depends=('wine')
provides=("${pkgname/-bin/}=$pkgver")
options=('!strip')
source=("https://github.com/madewokherd/wine-mono/releases/download/${pkgname/-bin/}-$pkgver/${pkgname/-bin/}-$pkgver-x86.tar.xz")

package() {
  install -Dm 755 -d "$pkgdir"/usr/share/wine/mono/
  cp -dr --no-preserve='ownership' ${pkgname/-bin/}-$pkgver "$pkgdir"/usr/share/wine/mono/

  # NOTE: Reduces size by 0.16 MiB, not worth it
  local _monodir="$pkgdir"/usr/share/wine/mono/${pkgname/-bin/}-$pkgver
  i686-w64-mingw32-strip --strip-unneeded \
    $(find "$_monodir"/lib/mono/ -iname "*.dll" -or -iname "*.exe")
  i686-w64-mingw32-strip --strip-unneeded \
    "$_monodir"/lib/x86/*.dll \
    $(find "$_monodir"/ -iname "*x86.dll" -or -iname "*x86.exe")
  x86_64-w64-mingw32-strip --strip-unneeded \
    "$_monodir"/lib/x86_64/*.dll \
    $(find "$_monodir"/ -iname "*x86_64.dll" -or -iname "*x86_64.exe")
}

sha512sums=('746e9da61534f5453fce76a45204b8ffd6b5be296525173b057a5cf487e70919280141fccdf01cc61591d6de89da17449e20f14225859b95dc0240e6d7e46ef8')
