# Maintainer: Reik Keutterling <spielkind@gmail.com>
pkgname=notary-git
pkgver=0.7.0.r55.g40969cc3
pkgrel=1
pkgdesc="Notary is a project that allows anyone to have trust over arbitrary collections of data."
arch=('x86_64')
url="https://github.com/theupdateframework/notary"
license=('APACHE')
makedepends=('git' 'go')
provides=(${pkgname%-*}=$pkgver)
conflicts=(${pkgname%-*}-bin)
options=('!strip' '!emptydirs')
source=($pkgname::git+https://github.com/theupdateframework/${pkgname%-*}.git)
sha256sums=('SKIP')

_gourl=github.com/theupdateframework/notary
_gobuild=build/src/$_gourl

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p "$(dirname $_gobuild)"
  cp -a "$srcdir/$pkgname" $_gobuild
}

build() {
  cd $_gobuild
  GOPATH="$srcdir/build" make client
}

package() {
   mkdir -p "$pkgdir/usr/bin"
   install -Dm755 $srcdir/$_gobuild/bin/notary $pkgdir/usr/bin/notary
}
