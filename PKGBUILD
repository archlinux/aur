# Maintainer: Jack O'Connor <oconnor663@gmail.com>

pkgname=keybase-staging
pkgdesc='staging build of the Keybase Go client'
url='https://keybase.io/docs/cli_kbstage'
license=('BSD')
pkgver=4310.2bf6d46
pkgver() {
  cd "$srcdir/client"
  tag="$(git describe --abbrev=0 --tags)"
  echo $(git rev-list --count "$tag").$(git rev-parse --short "$tag")
}
pkgrel=1
arch=(i686 x86_64)
makedepends=(go)
depends=(gnupg)
source=('git://github.com/keybase/client')
md5sums=('SKIP')

package() {
  cd "$srcdir/client"
  tag="$(git describe --abbrev=0 --tags)"
  git checkout "$tag"
  cd "$srcdir"
  export GOPATH=`pwd`
  export GO15VENDOREXPERIMENT=1
  mkdir -p src/github.com/keybase
  cp -r client src/github.com/keybase/
  cd src/github.com/keybase/client/go/keybase
  dest="$pkgdir/usr/bin/kbstage"
  mkdir -p "$(dirname "$dest")"
  echo building kbstage binary...
  go build -a -tags staging -o "$dest"
}
