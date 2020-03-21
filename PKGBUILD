# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>

_pkgname=pullcord
pkgname=$_pkgname-git
pkgver=r134.5209be1
pkgrel=2
pkgdesc="Discord archiver - git version"
arch=('x86_64')
url="https://github.com/tsudoko/$_pkgname"
license=('Unlicense')
makedepends=('git' 'go' 'golang-github-gorilla-websocket' 'golang-golang-x-crypto')
provides=('pullcord')
conflicts=('pullcord')
source=("git+$url.git"
        'git+https://github.com/bwmarrin/discordgo.git')
sha256sums=('SKIP'
            'SKIP')

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
  cd ..

  mkdir -p gopath/src/
  mv "$_pkgname"/vendor/* gopath/src/
  mkdir -p gopath/src/github.com/tsudoko
  ln -rTsf "$_pkgname" gopath/src/github.com/tsudoko/pullcord
}

build() {
  export GOPATH="$srcdir/gopath:/usr/share/gocode"
  cd gopath/src/github.com/tsudoko/pullcord
  go build -v \
    -trimpath \
    -ldflags "-extldflags $LDFLAGS" ./cmd/pullcord
}

package() {
  cd "$_pkgname"
  install -Dm755 pullcord "$pkgdir/usr/bin/pullcord"
}
