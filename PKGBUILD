# Maintainer: MF Akane <aur at sorairo dot pictures>
pkgname=mackerel-agent-plugins-git
pkgver=0.51.1
pkgrel=1
pkgdesc="Plugins for mackerel-agent"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/mackerelio/mackerel-agent-plugins"
license=('Apache')
depends=()
makedepends=('git' 'go' 'jq' 'perl')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname"::'git+https://github.com/mackerelio/mackerel-agent-plugins.git')
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
    cd "$srcdir/$pkgname/mackerel-plugin-$i"
    go build -ldflags "-s -w" -o "$srcdir/$pkgname/build/mackerel-plugin-$i"
  done
}

package() {
  for i in `cat "$srcdir/$pkgname/packaging/config.json" | /usr/bin/jq -r '.plugins[]'`; do
    install -Dm755 "$srcdir/$pkgname/build/mackerel-plugin-$i" "$pkgdir/usr/bin/mackerel-plugin-$i"
  done
}
