# Maintainer: George Rawlinson <george@rawlinson.net.nz>
pkgname=realize
pkgver=2.0.2
pkgrel=3
pkgdesc="Golang live reload and task runner"
arch=('x86_64')
url="https://github.com/oxequa/realize"
license=('GPL')
conflicts=('realize-git')
makedepends=('go' 'git' 'dep')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/oxequa/${pkgname}/archive/v${pkgver}.tar.gz"
        "$pkgname.patch")
sha512sums=('8e68504710552a487dcec92e6295d18ea830d29192c4c3d1af316589861a04325b99765eb0051adb7ecb8ff344d98bf667453d7bbd8e6d588a44db446f267a56'
            '60f5eddc6efc3a4767f2fb0aa3f174ed1188d379fec24b3009103c27ba5c02d623990b313d424dc0f5bcb5d9e7ac5e2276649ab0d2c6ab270b8902ba8b770ab5')

prepare() {
  # patching
  cd "$pkgname-$pkgver"
  patch -p1 -i "$srcdir/realize.patch"

  # symlink extracted archive to $GOPATH
  cd "$srcdir"
  mkdir -p gopath/src/github.com/oxequa
  ln -srfT $pkgname-$pkgver gopath/src/github.com/oxequa/realize
  export GOPATH="$srcdir"/gopath

  # download dependencies with dep
  cd "$srcdir/gopath/src/github.com/oxequa/realize"
  dep ensure -v
}
build() {
  export GOPATH="$srcdir"/gopath
  cd gopath/src/github.com/oxequa/realize
  go install \
    -trimpath \
    -ldflags "-extldflags $LDFLAGS" \
    -v ./...
}

package() {
  cd "$srcdir"
  install -Dm755 "gopath/bin/$pkgname" "${pkgdir}/usr/bin/realize"
  install -Dm644 "$pkgname-$pkgver/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
