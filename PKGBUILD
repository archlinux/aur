# Contributor: graysky <graysky AT archlinux DOT us>
# Contributor: Stéphane Graber <stgraber AT ubuntu DOT com>
# Maintainer: edacval <edacval AT gmail DOT com

_pkgname=distrobuilder
_url=github.com/lxc/$_pkgname
pkgname=$_pkgname-git
pkgver=538.56211c4
pkgrel=1
pkgdesc="System container image builder for LXC and LXD"
arch=('x86_64')
url="https://$_url"
license=('APACHE')
depends=('lxc')
provides=($_pkgname)
conflicts=($_pkgname)
makedepends=('go' 'git')
source=($_pkgname::git://$_url.git)
sha256sums=('SKIP')

pkgver() {
  export GOPATH="${srcdir}"/gosrc

  cd "${GOPATH}"/src/$_url
  echo "$(git rev-list --count HEAD).$(git describe --always)"
}

prepare() {
  export GOPATH="${srcdir}"/gosrc
  export GOCACHE=/tmp/makepkg/$pkgname/gocache

  rm -rf "${GOPATH}"/src/$_url
  install -d $(dirname "${GOPATH}"/src/$_url)
  mv -v "$srcdir"/$_pkgname "${GOPATH}"/src/$_url
  cd "${GOPATH}"/src/$_url
  gofmt -s -w .
  go get -v -d ./...
}

build() {
  export GOPATH="${srcdir}"/gosrc
  export GOCACHE=/tmp/makepkg/$pkgname/gocache

  cd "${GOPATH}"/src/$_url/$_pkgname
  go build -v -trimpath -ldflags '-s -w' -o $_pkgname .
}

package() {
  export GOPATH="${srcdir}"/gosrc

  install -v -Dm755 "$GOPATH"/src/$_url/$_pkgname/$_pkgname "$pkgdir"/usr/bin/$_pkgname
  install -v -d "$pkgdir"/var/cache/$_pkgname
  install -v -Dm644 -t "$pkgdir"/usr/share/$_pkgname "$GOPATH"/src/$_url/doc/examples/*
}
