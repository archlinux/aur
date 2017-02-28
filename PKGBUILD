# Maintainer Brenton Horne <brentonhorne77 at gmail dot com>

pkgname=hugo
pkgver=0.19
pkgrel=2
pkgdesc="Fast and Flexible Static Site Generator in Go — built from source."
arch=('i686' 'x86_64')
url="http://hugo.spf13.com/"
conflicts=("${pkgname}-src" "${pkgname}-bin")
license=('Apache')
depends=('glibc')
optdepends=('pygmentize: syntax-highlight code snippets.')
makedepends=('go' 'git' 'govendor')
source=("https://github.com/spf13/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('c1d5e206bc011e8ceb2fb4b515a02b56b2b619d768dd3b38456f50849651b0f16077ccf30a3a61e6b934b8a92bd71d45e24e1cc9d65b5d362f7c2f11e75c8a12')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"

  # Force our own git checkout
  export GOPATH="$srcdir"
  mkdir -p "$GOPATH/src/github.com/spf13"
  ln -s `pwd` "$GOPATH/src/github.com/spf13/hugo"

  cd "$GOPATH/src/github.com/spf13/hugo"
  govendor sync -v || printf "govendor failed"
  make no-git-info || printf "make no-git-info failed"
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  install -Dm755 "${pkgname}" "$pkgdir/usr/bin/${pkgname}"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
