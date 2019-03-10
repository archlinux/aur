# Maintainer: Ward Segers <w@rdsegers.be>

pkgname=signal-back-git
pkgver=0.1.6.r0.5b3bce7
pkgrel=2
pkgdesc="Decrypt Signal encrypted backups outside the app"
arch=('i686' 'x86_64')
url="https://github.com/xeals/signal-back"
license=('Apache')
makedepends=('dep' 'git' 'go-pie')
provides=("${pkgname%-git}=$pkgver")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/xeals/signal-back.git')
md5sums=('SKIP')

_pkgname="${pkgname%-git}"

pkgver() {
  cd "$srcdir/src/github.com/xeals/$_pkgname"
  printf "%s" "$(git describe --tags --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
  rm -rf -- src/github.com/xeals
  mkdir -p src/github.com/xeals
  mv "$_pkgname" src/github.com/xeals/

  cd src/github.com/xeals/signal-back/
  git checkout v0.1.6
}

build() {
  export GOPATH="$srcdir"
  cd "$GOPATH/src/github.com/xeals/$_pkgname"
  dep ensure
  go build .
}

package() {
  install -Dm755 "$srcdir/src/github.com/xeals/$_pkgname/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
