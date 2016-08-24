# Maintainer: Jakub "Kubuxu" Sztandera  <kubuxu@protonmail.ch>
# vim: set expandtab ts=2 sw=2:

pkgname=gx-go
pkgver=1.3.0.r0.g3cbfcbb
pkgrel=1
epoch=
pkgdesc="A tool to use with the gx package manager for packages written in go."
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/whyrusleeping/$pkgname"
license=('MIT')
depends=('gx')
makedepends=('git' 'go')
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
  # Renable after tags are placed in the repo.
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p "$srcdir"/src/github.com/whyrusleeping/
  ln -fs "$srcdir/$pkgname" "$srcdir"/src/github.com/whyrusleeping/"$pkgname"
}

build() {
  # Required for go get
  export GOPATH="$srcdir"
  export GOBIN="$GOPATH/bin"
  cd "$srcdir"/src/github.com/whyrusleeping/"$pkgname"

  msg2 'Installing dependencies...'
  go get -v

  msg2 'Building binary...'
  go install -v
}

package() {
  msg2 'Packaging binary...'
  install -Dm 755 bin/gx-go "${pkgdir}/usr/bin/gx-go"

  msg2 'Packaging auxiliary files...'
  cd "$pkgname"
  install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
