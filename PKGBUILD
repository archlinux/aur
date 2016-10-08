# Maintainer Brenton Horne <brentonhorne77 at gmail dot com>

pkgname=hugo-src
_pkgname=hugo
pkgver=0.17
pkgrel=1
pkgdesc="Fast and Flexible Static Site Generator in Go — built from source."
arch=('i686' 'x86_64')
url="http://hugo.spf13.com/"
conflicts=("${_pkgname}")
license=('Apache')
depends=('glibc')
optdepends=('pygmentize: syntax-highlight code snippets.')
makedepends=('go' 'git' 'mercurial')
source=("https://github.com/spf13/${_pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('1c21b029895182be2648fa4f4f3a8040a44f3d7db13fff378992b7eec23cd58ca4354358defbb317e679c1b2f176c1e4f0812b737404abc36f7f739ba3da0844')

build() {
  cd "$srcdir/${_pkgname}-${pkgver}"

  # Force our own git checkout
  export GOPATH="$srcdir"
  mkdir -p "$GOPATH/src/github.com/spf13"
  ln -s `pwd` "$GOPATH/src/github.com/spf13/hugo"

  go get -d -v . || printf "Failed at go get"
  make no-git-info || printf "make no-git-info failed"
}

package() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  install -Dm755 "${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
}
