# Maintainer: Jeremy Symon <jtsymon@gmail.com>
pkgname='itch-setup-git'
_gitname='itch-setup'
pkgdesc='An installer for the itch.io desktop app'
arch=('x86_64' 'i686')
url='https://itch.io/'
license=('MIT')
depends=()
makedepends=('git' 'go-pie' 'npm')
provides=('itch' 'kitch')
pkgver=1.24.0.r0.g083c5ca
pkgrel=1
source=(
  "git+https://github.com/itchio/${_gitname}.git"
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "$_gitname"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_gitname"
  npm install
}

build() {
  export GOPATH="$srcdir"
  export GOBIN="$GOPATH/bin"
  mkdir -p $GOPATH $GOBIN
  cd "$_gitname"
  go get -v -u
  go build
}

package() {
  install -Dm755 "bin/itch-setup" "$pkgdir/usr/bin/itch"
  ln -s "itch" "$pkgdir/usr/bin/kitch"
  install -Dm644 "$_gitname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
