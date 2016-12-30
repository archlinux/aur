# Maintainer Brenton Horne <brentonhorne77 at gmail dot com>

pkgname=hugo
pkgver=0.18.1
pkgrel=1
pkgdesc="Fast and Flexible Static Site Generator in Go — built from source."
arch=('i686' 'x86_64')
url="http://hugo.spf13.com/"
conflicts=("${pkgname}-src" "${pkgname}-bin")
license=('Apache')
depends=('glibc')
optdepends=('pygmentize: syntax-highlight code snippets.')
makedepends=('go' 'git')
source=("https://github.com/spf13/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('1c14fa5f4d35ed344e6b5446bcdeecd1287d7951b615461659dc25f1037155e99b1d653c0cf621bdc46651e0b32a3432b13b393c6c6eac3960639df5ec862d56')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"

  # Force our own git checkout
  export GOPATH="$srcdir"
  mkdir -p "$GOPATH/src/github.com/spf13"
  ln -s `pwd` "$GOPATH/src/github.com/spf13/hugo"

  go get -d -v . || printf "Failed at go get"
  make no-git-info || printf "make no-git-info failed"
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  install -Dm755 "${pkgname}" "$pkgdir/usr/bin/${pkgname}"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
