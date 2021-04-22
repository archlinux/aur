# Maintainer Henry Smith <henrysmith6003@protonmail.com>

pkgname=golaunch
pkgver=0.7
pkgrel=1
pkgdesc='a simple .desktop launcher written in go.'
arch=('x86_64')
url="https://github.com/hen6003/golaunch"
license=('MIT')
makedepends=('go' 'git')
source=("https://github.com/hen6003/golaunch/archive/$pkgver.tar.gz")
sha256sums=('7c9de9c52dd08b04aab0fa2b5738ba28d452a7bb42d777636132c19a1199c84c')

prepare() {
  go get -u \
    github.com/rkoesters/xdg/basedir \
	github.com/rkoesters/xdg/desktop
}

build() {
  cd "$pkgname"-"$pkgver"
  go mod init main
  go mod tidy

  cd golaunch
  go build -gcflags "all=-trimpath=$PWD" \
    -asmflags "all=-trimpath=$PWD" \
    -ldflags "-extldflags $LDFLAGS" \
    ./golaunch.go

  cd ../godesktop
  go build -gcflags "all=-trimpath=$PWD" \
    -asmflags "all=-trimpath=$PWD" \
    -ldflags "-extldflags $LDFLAGS" \
    ./godesktop.go
}

package() {
  cd "$pkgname"-"$pkgver"
  install -Dm755 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
  install -Dm755 golaunch/$pkgname "$pkgdir"/usr/bin/"$pkgname"
  install -Dm755 godesktop/godesktop "$pkgdir"/usr/bin/"godesktop"
}
