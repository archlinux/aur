# Maintainer: Jack O'Connor <oconnor663@gmail.com>

pkgname=keybase-staging
pkgdesc='staging build of the Keybase Go client'
url='https://keybase.io/docs/cli_kbstage'
license=('BSD')
pkgver=18.39b5bf0
pkgver() {
  cd "$srcdir/client-beta"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}
pkgrel=1
arch=(i686 x86_64)
# Asyncio and pathlib are standard in Python 3.4, so they're not in the
# dependencies list.
makedepends=(go)
depends=(gnupg)
source=('git://github.com/keybase/client-beta')
md5sums=('SKIP')

package() {
  cd "$srcdir/client-beta"
  export GOPATH=`pwd`
  mkdir -p src/github.com/keybase
  cp -r client src/github.com/keybase/
  cd src/github.com/keybase/client/go/keybase
  echo fetching dependencies with go get...
  go get
  dest="$pkgdir/usr/bin/kbstage"
  mkdir -p "$(dirname "$dest")"
  echo building kbstage binary...
  go build -a -tags staging -o "$dest"
}
