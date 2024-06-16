## Maintainer: khanhas <xuankhanh963@gmail.com>, itsmeow <itsmeow@itsmeow.dev>
pkgname=spicetify-cli
pkgver=2.36.13
pkgrel=1
pkgdesc='Command-line tool to customize Spotify client'
arch=('x86_64' 'i686')
url='https://github.com/spicetify/cli'
license=('LGPL2.1')
makedepends=('go')
optdepends=('xdg-utils: Allows for opening directories in default file manager')
source=("cli-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('4af9a7677178adaca6cb74e34c5332db050d11aa85a92e020329a718517bf7c5')

build() {
  cd "cli-$pkgver"
  export GO111MODULE="auto"
  export GOPATH="$srcdir"
  go build -ldflags="-X 'main.version=$pkgver'" -o spicetify
}

check() {
  cd "cli-$pkgver"
  test "v$(./spicetify -v)" = "v$pkgver" || exit 1
}

package() {
  cd cli-$pkgver
  install -Dm755 ./spicetify "$pkgdir"/usr/share/$pkgname/spicetify
  cp -r ./Themes ./Extensions ./CustomApps ./jsHelper ./globals.d.ts ./css-map.json "$pkgdir"/usr/share/$pkgname

  rm -f ./shortcut
  echo "#!/bin/sh
/usr/share/$pkgname/spicetify \"\$@\"" >> ./shortcut

  install -Dm755 ./shortcut "$pkgdir"/usr/bin/spicetify

  # Clean up deps
  go clean -modcache
}
