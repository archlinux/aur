pkgname=nanolist-git
_pkgname=nanolist
pkgdesc="mailing lists - the unix way"
pkgver=v1.0.0.r0.gbfd770a
pkgrel=1
arch=('i686' 'x86_64')
url='https://github.com/eXeC64/nanolist'
source=('git+https://github.com/eXeC64/nanolist')
depends=()
makedepends=('go')
sha1sums=('SKIP')
license=('BSD 3-Clause License')

pkgver() {
  cd "$srcdir/$_pkgname"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build(){
  cd "$srcdir/$_pkgname"
  GO111MODULE=on go build
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 'nanolist' "$pkgdir/usr/bin/nanolist"
  install -Dm644 'README.md' "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  sed -n '/^```ini$/,/^```$/{//!p}' README.md > "$pkgdir/usr/share/doc/$pkgname/nanolist.ini.sample"
}
