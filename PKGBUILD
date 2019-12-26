## Maintainer: khanhas <xuankhanh963@gmail.com>
pkgname=spicetify-cli
pkgver=0.9.6
pkgrel=1
pkgdesc='Command-line tool to customize Spotify client'
arch=('x86_64' 'i686')
url='https://github.com/khanhas/spicetify-cli'
license=('GPL')
makedepends=('git' 'go')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('1acfdd2856b342ff2d2b6e787f9c1ea052292e406e96f61354bbb3fdda3dad3d')

build() {
  cd "$pkgname-$pkgver"
  export GOPATH="$srcdir"
  go build -o spicetify
}

check() {
  cd "$pkgname-$pkgver"
  ./spicetify -v
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 ./spicetify "$pkgdir"/usr/share/$pkgname/spicetify
  cp -r ./Themes ./Extensions ./CustomApps ./jsHelper ./globals.d.ts "$pkgdir"/usr/share/$pkgname
  
  rm -f ./shortcut
  echo "#!/bin/sh 
/usr/share/$pkgname/spicetify \"\$@\"" >> ./shortcut
  
  install -Dm755 ./shortcut "$pkgdir"/usr/bin/spicetify

  # Clean up deps
  go clean -modcache
}
