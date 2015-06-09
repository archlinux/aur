# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=the_platinum_searcher
pkgver=1.7.7
pkgrel=1
pkgdesc="A code search tool similar to ack and the_silver_searcher(ag)"
arch=('i686' 'x86_64')
makedepends=('git' 'go' 'mercurial')
url="https://github.com/monochromegane/the_platinum_searcher"
license=('MIT')
provides=('pt' 'the_platinum_searcher')
source=('git+https://github.com/monochromegane/the_platinum_searcher.git')
md5sums=('SKIP')

build() {
  repodir="$srcdir"/src/github.com/monochromegane
  mkdir -p "$repodir"
  mv "$srcdir"/$pkgname "$repodir"
  cd "$repodir"/$pkgname
  git checkout -q v$pkgver
  GOPATH="$srcdir" go get -v ./...
}

check() {
  [[ -f /etc/profile.d/go.sh ]] && source /etc/profile.d/go.sh
  GOPATH="$GOPATH:$srcdir" go test -v -x github.com/monochromegane/the_platinum_searcher/
}

package() {
  [[ -f /etc/profile.d/go.sh ]] && source /etc/profile.d/go.sh

  msg 'Installing binaries...'
  for _bin in `find "$srcdir/bin" -mindepth 1 -maxdepth 1 -type f -printf '%f\n'`; do
    install -Dm 755 "$srcdir/bin/$_bin" "$pkgdir/usr/bin/$_bin"
  done
}
