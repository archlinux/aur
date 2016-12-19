# Maintainer Brenton Horne <brentonhorne77 at gmail dot com>

pkgname=hugo
pkgver=0.18
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
sha512sums=('b55a9e75a9d71fab2882d1eb923861dad0f504b219bcd9c6d5dd8a81fdb7509355cbb2ce692a488dc8b7439166772cd40563742234182e5e66c320906145583f')

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
