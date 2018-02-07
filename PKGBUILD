# Maintainer: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Jon Gjengset <jon@thesquareplanet.com>

pkgname=vuvuzela-git
pkgver=r105.eaebd07
pkgrel=1
pkgdesc="Scalable Private Messaging"
arch=('x86_64' 'i686')
url="https://vuvuzela.io/"
license=('AGPL3')
makedepends=('git' 'go>=1.8')
options=('!strip' '!emptydirs')
_gourl=vuvuzela.io/vuvuzela/cmd/vuvuzela-client
source=("git+https://github.com/vuvuzela/vuvuzela.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/vuvuzela"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  export GOROOT=/usr/lib/go
  export GOPATH="$srcdir/build"
  mkdir -p "$GOPATH"

  mkdir -p "$GOPATH/src/vuvuzela.io"
  rm -rf "$GOPATH/src/vuvuzela.io/vuvuzela"
  mv "$srcdir/vuvuzela" "$GOPATH/src/vuvuzela.io/vuvuzela"
  cd "$GOPATH/src/$_gourl"

  msg2 "Downloading dependencies"
  go get -d -fix .

  msg2 "Building client"
  go install ./...
}

package() {
  install -Dm755 \
    "$srcdir/build/bin/vuvuzela-client" \
    "$pkgdir/usr/bin/vuvuzela-client"
}

# vim:set ts=2 sw=2 et:
