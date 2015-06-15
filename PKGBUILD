# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: Tom Richards <tom [at] tomrichards [dot] net>

pkgname=caddy-git
pkgver=r373.7875f98
pkgrel=1
pkgdesc="A configurable, general-purpose HTTP/2 web server for any platform"
arch=('any')
url="https://github.com/mholt/caddy"
license=('Apache')
install='caddy.install'
conflicts=('caddy')
makedepends=('go' 'curl' 'jq')

pkgver() {
  api='https://api.github.com/repos/mholt/caddy'
  first='4497a16fb0301242ec66cb06411e7e73c0faa435'
  last_json=$(curl -s "$api/commits?per_page=1")
  last=$(echo "$last_json" | jq -r '.[0].sha')
  compare_json=$(curl -s "$api/compare/${first}...${last}")
  ahead_by=$(echo "$compare_json" | jq -r '.ahead_by')
  num=$((ahead_by+1))
  printf "r%d.%s" $num "${last:0:7}"
}

build() {
  GOPATH="$srcdir" go get -u -v -fix "github.com/mholt/caddy"
}

package() {
  install -Dm755 "$srcdir/bin/caddy" "$pkgdir/usr/bin/caddy"
}
