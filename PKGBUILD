## Maintainer: khanhas <xuankhanh963@gmail.com>, itsmeow <itsmeow@itsmeow.dev>
pkgname=spicetify-cli
pkgver=2.14.1
pkgrel=1
pkgdesc='Command-line tool to customize Spotify client'
arch=('x86_64' 'i686')
url='https://github.com/spicetify/spicetify-cli'
license=('GPL')
makedepends=('git' 'go')
optdepends=('xdg-utils: Allows for opening directories in default file manager')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('e8de0f53abbb564bd804ee81da6c9ca1b0d1e1b97e84a5725e65c516c202fa1a')

build() {
  cd "$pkgname-$pkgver"
  export GOPATH="$srcdir"
  go build -ldflags="-X 'main.version=$pkgver'" -o spicetify
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
