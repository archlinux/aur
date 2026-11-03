# Maintainer: Luke <luke at coldmail dot xyz>
#
# Native PC port of GoldenEye 007 by James Dansereau, built from the
# GoldenEye 007 N64 decompilation by KholdFuzion and contributors.
#
# No game data is included. The first time you run `goldeneye-pc-port`
# (or the "GoldenEye 007" menu entry) it asks for your own US (NTSC-U) ROM
# dump and generates the game's assets from it. Your ROM, save and settings
# live in ~/.local/share/goldeneye-pc-port/data/.

pkgname=goldeneye-pc-port-bin
_pkgname=goldeneye-pc-port
pkgver=0.5.0
pkgrel=1
pkgdesc="Native PC port of GoldenEye 007 (N64) with mouse and keyboard, widescreen and split-screen - asks for your ROM on first run"
arch=('x86_64')
url="https://github.com/jkdansereau/goldeneye-pc-port"
license=('MIT' 'unknown') # port layer MIT; code from the decompilation has no license
depends=('bash' 'glibc' 'zlib' 'libglvnd' 'python' 'zenity' 'hicolor-icon-theme')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip' '!debug') # stripping breaks the PyInstaller asset converter
source=("$url/releases/download/v$pkgver/$_pkgname-$pkgver-linux-x86_64.tar.gz"
        "$_pkgname-$pkgver.png::https://raw.githubusercontent.com/jkdansereau/$_pkgname/v$pkgver/docs/img/icon/ge007-icon.png"
        "$_pkgname"
        "$_pkgname.desktop")
sha256sums=('011ee5acdd75028fa3af8cbad2aaade1f362aee89f17b43a15d1d1836e98ab92'
            '487e235fa523f157b7ce8d688a5ccf104dcf0514813bb4eac7040603ad723103'
            '913f0f94b0dbc38c8cf66a945abb2594298aaa403467c3e53a3bde98b7dd4e61'
            '5a02a707f05a01f2176e9bb5ebe81895862550bb6882114d2e54d3610b87557e')

package() {
  cd "$_pkgname-$pkgver-linux-x86_64"

  install -d "$pkgdir/opt/$_pkgname"
  cp -a ge007.x86_64 libSDL2-2.0.so.0 prepare-assets tools README.md \
    "$pkgdir/opt/$_pkgname/"
  printf '%s\n' "$pkgver" > "$pkgdir/opt/$_pkgname/version"

  install -Dm644 licenses/* -t "$pkgdir/usr/share/licenses/$pkgname/"

  install -Dm755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$srcdir/$_pkgname.desktop" \
    "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -Dm644 "$srcdir/$_pkgname-$pkgver.png" \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/$_pkgname.png"
}
