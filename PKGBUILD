# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Rémy Oudompheng <remy@archlinux.org>

pkgname=go-sdl-example
pkgver=20130107
pkgrel=1
pkgdesc='SDL example for Go, with graphics and soundeffects'
arch=('x86_64' 'i686')
url='https://github.com/banthar/Go-SDL/tree/master/test'
license=('custom')
depends=('sdl' 'sdl_image' 'sdl_mixer' 'sdl_ttf')
makedepends=('go' 'git' 'gendesk' 'setconf')
options=('!strip' '!emptydirs')
source=("$pkgname.tar.gz::https://github.com/banthar/Go-SDL/tarball/master"
        "$pkgname.png::http://www.libsdl.org/tmp/SDL/Xcode-iOS/Template/SDL%20iOS%20Application/Icon.png")
sha256sums=('5d5e277a3f0fd50fcc1f63164275a4136397c6dd634b767474c3dbb0f2da612d'
            '518d4922881cb735d0d81391cb778898a567052f7e7dcb724fd633fea36626dc')
_name=('Go SDL example')

build() {
  cd "$srcdir"

  gendesk -n
  setconf "$pkgname.desktop" Categories 'Application;AudioVideo;'
  mv banthar-Go-SDL* "$pkgname"
  cd "$pkgname/test"

  msg2 "Adjusting paths..."
  for fn in sound.ogg test.ogg 'Fontin Sans.otf' test.png; do
    sed -i "s:$fn:$pkgdir/usr/share/$pkgname/$fn:" test.go
  done

  msg2 "Compiling..."
  mkdir go
  export GOPATH=$srcdir/go
  go get github.com/banthar/Go-SDL/mixer
  go get github.com/banthar/Go-SDL/sdl
  go get github.com/banthar/Go-SDL/ttf
  go build test.go
}

package() {
  cd "$srcdir/$pkgname/test"

  msg2 "Packaging multimedia files..."
  install -Dm644 sound.ogg "$pkgdir/usr/share/$pkgname/sound.ogg"
  install -Dm644 test.ogg "$pkgdir/usr/share/$pkgname/test.ogg"
  install -Dm644 'Fontin Sans.otf' "$pkgdir/usr/share/$pkgname/Fontin Sans.otf"
  install -Dm644 test.png "$pkgdir/usr/share/$pkgname/test.png"

  msg2 "Packaging binaries..."
  install -Dm755 test "$pkgdir/usr/bin/$pkgname"

  msg2 "Packaging application shortcut..."
  install -Dm644 "$srcdir/$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$srcdir/$pkgname.png" \
    "$pkgdir/usr/share/pixmaps/$pkgname.png"
}

# vim:set ts=2 sw=2 et:
