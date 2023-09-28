## Maintainer: khanhas <xuankhanh963@gmail.com>, itsmeow <itsmeow@itsmeow.dev>
pkgname=spicetify-cli
pkgver=2.24.0
pkgrel=1
pkgdesc='Command-line tool to customize Spotify client'
arch=('x86_64' 'i686')
url='https://github.com/spicetify/spicetify-cli'
license=('LGPL2.1')
makedepends=('go')
optdepends=('xdg-utils: Allows for opening directories in default file manager')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('02904044bf95a6d23c63864200cb8f6a4c1e382e4c35e702a77eaa489f27abfc')

build() {
  cd "$pkgname-$pkgver"
  export GO111MODULE="auto"
  export GOPATH="$srcdir"
  go build -gccgoflags="-X 'main.version=$pkgver'" -o spicetify
}

check() {
  cd "$pkgname-$pkgver"
  ./spicetify -v
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 ./spicetify "$pkgdir"/usr/share/$pkgname/spicetify
  cp -r ./Themes ./Extensions ./CustomApps ./jsHelper ./globals.d.ts ./css-map.json "$pkgdir"/usr/share/$pkgname

  rm -f ./shortcut
  echo "#!/bin/sh
/usr/share/$pkgname/spicetify \"\$@\"" >> ./shortcut

  install -Dm755 ./shortcut "$pkgdir"/usr/bin/spicetify

  # Clean up deps
  go clean -modcache
}
