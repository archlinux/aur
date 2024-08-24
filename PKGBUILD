## Maintainer: khanhas <xuankhanh963@gmail.com>, itsmeow <itsmeow@itsmeow.dev>
pkgname=spicetify-cli
pkgver=2.37.2
pkgrel=1
pkgdesc='Command-line tool to customize Spotify client'
arch=('x86_64' 'i686')
url='https://github.com/spicetify/cli'
license=('LGPL2.1')
makedepends=('go')
optdepends=('xdg-utils: Allows for opening directories in default file manager')
source=("cli-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('b24a735fd9df596e3976662915f42e3d626ff99c1a908c91fb9c7a2df427f9a4')

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
