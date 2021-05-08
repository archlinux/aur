# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>

_pkgname=pullcord
pkgname=$_pkgname-git
pkgver=r137.a4456d6
pkgrel=2
pkgdesc="Discord archiver - git version"
arch=('x86_64')
url="https://github.com/tsudoko/$_pkgname"
license=('Unlicense' 'BSD')
makedepends=('git' 'go')
provides=('pullcord')
conflicts=('pullcord')
source=("git+$url.git"
        'git+https://github.com/bwmarrin/discordgo.git'
        'LICENSE.websocket::https://raw.githubusercontent.com/gorilla/websocket/v1.4.0/LICENSE'
        'LICENSE.crypto::https://raw.githubusercontent.com/golang/crypto/4d3f4d9ffa16a13f451c3b2999e9c49e9750bf06/LICENSE')
sha256sums=('SKIP'
            'SKIP'
            '2be1b548b0387ca8948e1bb9434e709126904d15f622cc2d0d8e7f186e4d122d'
            '2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067')

pkgver() {
  cd "$_pkgname"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"

  git submodule deinit -f --all
  git submodule init
  git config submodule.vendor/github.com/bwmarrin/discordgo.url "$srcdir/discordgo"
  git submodule update

  go mod init github.com/tsudoko/pullcord
  go mod edit -replace=github.com/bwmarrin/discordgo=./vendor/github.com/bwmarrin/discordgo
  go mod tidy

  mkdir build
}

build() {
  cd "$_pkgname"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build ./cmd/...
}

package() {
  install -Dm755 -t "$pkgdir/usr/bin" $_pkgname/build/*
  install -Dm644 $_pkgname/vendor/github.com/bwmarrin/discordgo/LICENSE "$pkgdir/usr/share/licenses/$pkgname/github.com/bwmarrin/discordgo/LICENSE"
  install -Dm644 LICENSE.websocket "$pkgdir/usr/share/licenses/$pkgname/github.com/gorilla/websocket/LICENSE"
  install -Dm644 LICENSE.crypto "$pkgdir/usr/share/licenses/$pkgname/golang.org/x/crypto/LICENSE"
}
