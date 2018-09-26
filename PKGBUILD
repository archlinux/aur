# Maintainer: MF Akane <aur at sorairo dot pictures>
pkgname=mackerel-check-plugins-git
pkgver=0.22.1
pkgrel=1
pkgdesc="Check Plugins for monitoring written in golang"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/mackerelio/go-check-plugins"
license=('Apache')
depends=()
makedepends=('git' 'go' 'jq')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname"::'git+https://github.com/mackerelio/go-check-plugins.git')
sha1sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags --abbrev=0 | sed 's/^v//' | sed 's/\+.*$$//'
}

build() {
  cd "$srcdir/$pkgname"

  export GOPATH="$srcdir/go"
  mkdir -p "$GOPATH"

  make deps
  mkdir -p build
  
  for i in `cat "$srcdir/$pkgname/packaging/config.json" | /usr/bin/jq -r '.plugins[]'`; do
    cd "$srcdir/$pkgname/check-$i"
    go build -ldflags "-s -w" -o "$srcdir/$pkgname/build/check-$i"
  done
}

package() {
  for i in `cat "$srcdir/$pkgname/packaging/config.json" | /usr/bin/jq -r '.plugins[]'`; do
    install -Dm755 "$srcdir/$pkgname/build/check-$i" "$pkgdir/usr/bin/check-$i"
  done
}
