# Maintainer: David Pedersen <limero@me.com>
pkgname=kvitter-git
_gitname=Kvitter
pkgver=r63.311ed96
pkgrel=1
pkgdesc="Open-Source Node.js Twitter Client"
arch=('i686' 'x86_64')
url="https://github.com/Limero/Kvitter"
license=('GPL3')
makedepends=('git' 'nodejs' 'npm')
provides=('kvitter')
conflicts=('kvitter')
source=("git+https://github.com/Limero/$_gitname.git")
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_gitname"

  npm install
}

build() {
  cd "$_gitname"

  if [ $CARCH = "x86_64" ]; then
    #npm run build:linux:64
    electron-packager . Kvitter --platform=linux --arch=x64 --asar --out=build --prune
  else
    #npm run build:linux:32
    electron-packager . Kvitter --platform=linux --arch=ia32 --asar --out=build --prune
  fi
}

package() {
  cd "$_gitname"

  install -d "$pkgdir/usr/share/kvitter"
  if [ $CARCH = "x86_64" ]; then
    cp -r "build/$_gitname-linux-x64/." "$pkgdir/usr/share/kvitter"
  else
    cp -r "build/$_gitname-linux-ia32/." "$pkgdir/usr/share/kvitter"
  fi

  install -Dm644 "kvitter.desktop" "$pkgdir/usr/share/applications/kvitter.desktop"
  #install -Dm644 "kvitter.png" "$pkgdir/usr/share/pixmaps/kvitter.png"

  install -d "$pkgdir/usr/bin"
  ln -s -r "$pkgdir/usr/share/kvitter/$_gitname" "$pkgdir/usr/bin/kvitter"
}
