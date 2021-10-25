# Maintainer: 
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: weearc <qby19981121@gmail.com>
pkgname=electron-markdownify
pkgver=1.4.1
pkgrel=1
pkgdesc="A minimal Markdown Editor desktop app built on top of Electron."
arch=('x86_64')
url="https://markdownify.js.org"
license=('MIT')
depends=('electron7')
makedepends=('yarn')
source=("$pkgname-$pkgver.tar.gz::https://github.com/amitmerchant1990/electron-markdownify/archive/$pkgver.tar.gz")
sha256sums=('c1d19a6c613e4d1dbb33f07a138238b5c164dd45e025cb9739d846f0e0f70cbf')

prepare() {
  cd "$pkgname-$pkgver"
  mkdir -p build
}

build(){
  cd "$pkgname-$pkgver"
  electronDist=/usr/lib/electron7
  electronVer=$(sed s/^v// /usr/lib/electron7/version)
  yarn config set cache-folder "$srcdir/yarn-cache"
  yarn
  yarn add electron-builder -D

  cp app/img/markdownify.icns build/icon.icns
  cp app/img/markdownify.ico "build/$pkgname.png"

  ./node_modules/.bin/electron-builder --linux --x64 --dir \
    $dist -c.electronDist=$electronDist -c.electronVersion=$electronVer
}

package() {
  cd "$pkgname-$pkgver"
  install -d $pkgdir/usr/bin

  echo "#!/bin/bash
exec electron7 /usr/lib/$pkgname/app.asar "\$@"" > "$pkgdir/usr/bin/$pkgname" && chmod a+x "$pkgdir/usr/bin/$pkgname"

  install -d $pkgdir/usr/share/applications

  echo "[Desktop Entry]
Name=Markdownify
GenericName=Markdown Editor
Exec="$pkgname" %U
Icon="$pkgname"
Type=Application
StartupNotify=true
Categories=Office;WordProcessor;
MimeType=text/markdown;text/x-markdown;" > "$pkgdir/usr/share/applications/$pkgname.desktop"

  install -Dm644 dist/linux-unpacked/resources/app.asar \
    "$pkgdir/usr/lib/$pkgname/app.asar"

  for i in 16 22 24 32 36 48 64 72 96 128 256
  do
    mkdir -p "pkgdir/usr/share/icons/hicolor/${i}x${i}/apps"
    install -Dm644 "build/$pkgname.png" "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$pkgname.png"
  done
}
