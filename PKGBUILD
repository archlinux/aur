## Maintainer: khanhas <xuankhanh963@gmail.com>
pkgname=spicetify-cli
pkgver=1.2.1
pkgrel=1
pkgdesc='Command-line tool to customize Spotify client'
arch=('x86_64' 'i686')
url='https://github.com/khanhas/spicetify-cli'
license=('GPL')
makedepends=('git' 'go')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('77fea3d8570ce4a0061c3e4b15256911be68d94012cb491ee3a77eee2fbc2df5')

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
