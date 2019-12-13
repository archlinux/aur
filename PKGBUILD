# Maintainer Adrià Arrufat <swiftscythe@gmail.com>
# Contributor yochananmarqos 

pkgname=powerline-go
pkgver=1.15.0
pkgrel=1
pkgdesc="A beautiful, useful and fast prompt for your shell"
arch=('x86_64')
url="https://github.com/justjanne/powerline-go"
license=('GPL3')
makedepends=('go-pie' 'dep')
optdepends=('powerline-fonts')
source=("$pkgname-$pkgver.tar.gz::https://github.com/justjanne/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('25d54855473c13348423d56406ebd0edc9318b3d4518d151994d90e49f496cb8')

prepare() {
  mkdir -p gopath/src/github.com/justjanne
    ln -rTsf "$pkgname-$pkgver" "gopath/src/github.com/justjanne/$pkgname"
    export GOPATH="$srcdir"/gopath

    cd "gopath/src/github.com/justjanne/$pkgname"
    dep init
    dep ensure
}

build() {
  cd "$pkgname-$pkgver"
    go build \
    -gcflags "all=-trimpath=${PWD}" \
    -asmflags "all=-trimpath=${PWD}" \
    -ldflags "-extldflags=-zrelro" \
    -ldflags "-extldflags=-znow" \
    .
}

package() {
  cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
