# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>

pkgname=fsql-git
pkgver=r45.db57e29
pkgrel=3
pkgdesc='Search through your filesystem with SQL-esque queries'
arch=('i686' 'x86_64')
url='https://github.com/kshvmdn/fsql'
license=('MIT')
depends=(glibc)
makedepends=(git go)
source=('git+https://github.com/kshvmdn/fsql.git')
_gitname='fsql'
md5sums=(SKIP)

pkgver(){
  if [ -d "$srcdir"/$_gitname ]; then
    cd "$srcdir"/$_gitname
    ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" )
  fi
}
prepare(){
  if [ ! -h "$srcdir"/src/github.com/kshvmdn/fsql ]; then
    mkdir -p "$srcdir"/src/github.com/kshvmdn
    cd "$srcdir"/src/github.com/kshvmdn
    ln -s "$srcdir"/fsql
  fi
}
build(){
  export GOPATH="$srcdir"
  cd "$srcdir"/$_gitname
  go build -v
}
check(){
  cd "$srcdir"/$_gitname
  go test -v
}
package(){
  cd "$srcdir"/$_gitname
  install -Dm755 fsql "$pkgdir/usr/bin/fsql"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

