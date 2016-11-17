# Maintainer: Jakub "Kubuxu" Sztandera  <kubuxu@protonmail.ch>
# vim: set expandtab ts=2 sw=2:

pkgname=gx
pkgver=0.10.0.r16.gfc98488
pkgrel=1
epoch=
pkgdesc="Packaging tool built around the distributed, content addressed filesystem IPFS. It aims to be flexible, powerful and simple."
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/whyrusleeping/$pkgname"
license=('MIT')
makedepends=('git' 'go')
optdepends=('gx-go: gx packaing module for go')
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
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
  install -Dm 755 bin/gx "${pkgdir}/usr/bin/gx"

  msg2 'Packaging auxiliary files...'
  cd "$pkgname"
  install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
