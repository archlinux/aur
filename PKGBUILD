# Contributor: Stéphane Graber <stgraber AT ubuntu DOT com>
# Maintainer: graysky <graysky AT archlinux DOT us>
# Maintainer: edacval <edacval AT gmail DOT com>

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
  cd $_pkgname
  echo "$(git rev-list --count HEAD).$(git describe --always)"
}

prepare() {
  rm -rf "${srcdir}"/gosrc/src/$_url
  install -d "$(dirname "${srcdir}"/gosrc/src/$_url)"
  git clone -s "$srcdir"/$_pkgname "${srcdir}"/gosrc/src/$_url
  cd "${srcdir}"/gosrc/src/$_url
  gofmt -s -w -l .
  GOPATH="${srcdir}"/gosrc go get -v -d ./...
}

build() {
  cd "${srcdir}"/gosrc/src/$_url/$_pkgname
  GOPATH="${srcdir}"/gosrc go build -v -trimpath -ldflags '-s -w' -o $_pkgname .
}

package() {
  install -v -Dm755 "${srcdir}"/gosrc/src/$_url/$_pkgname/$_pkgname "$pkgdir"/usr/bin/$_pkgname
  install -v -d "$pkgdir"/var/cache/$_pkgname
  install -v -Dm644 -t "$pkgdir"/usr/share/$_pkgname "${srcdir}"/gosrc/src/$_url/doc/examples/*
}
