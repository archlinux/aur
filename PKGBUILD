# Maintainer: David Roizenman <david@hmnd.io>

_pkgname=todoist
pkgname=${_pkgname}-git
pkgver=r196.a73b330
pkgrel=1
pkgdesc="Todoist CLI Client, written in Golang."
arch=('x86_64' 'i686')
url="https://github.com/sachaos/todoist"
license=('MIT')
makedepends=('go' 'git' 'dep')
optdepends=('peco: for zsh functions script')
options=('!strip' '!emptydirs')
source=("${pkgname}::git://github.com/sachaos/todoist.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
 mkdir -p "$srcdir/go/src/github.com/sachaos"
 ln -sf "$srcdir/$pkgname" "$srcdir/go/src/github.com/sachaos/$_pkgname"
}

build() {
 export GOPATH="$srcdir/go"
 export PATH="$PATH:$srcdir/go/bin/"
 export GO111MODULE="on"
 cd "$srcdir/go/src/github.com/sachaos/$_pkgname"
 make install
}

package() {
  install -Dm755 "$srcdir/go/bin/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  cd "$srcdir/go/src/github.com/sachaos/$_pkgname"
  install -Dm644 todoist_functions.sh "${pkgdir}/usr/share/todoist/todoist_functions.sh"
  mkdir -p "$pkgdir/usr/share/licenses/$_pkgname"
  install -m 0644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/"
}
