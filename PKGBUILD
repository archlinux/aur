# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=duplicacy-util
pkgver=1.5
pkgrel=5
pkgdesc="A utility to run Duplicacy backups"
arch=('x86_64' 'i686')
url="https://github.com/jeffaco/duplicacy-util"
license=('Apache License 2.0')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jeffaco/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('ec49b052dbf1c23d90c95b648ddeaaa80f4f885d0f257ac2146724f626db8eb8')

prepare(){
  cd ${pkgname}-${pkgver}
#  export GO111MODULE=on
  go mod init github.com/jeffaco/duplicacy-util
  go mod tidy
}

build() {
  cd "${pkgname}-${pkgver}"
  source version
  # echo "Building version: $VERSION"
  # export GO111MODULE=on
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export GOFLAGS="-buildmode=pie -trimpath -modcacherw"
#  go get -v
  go build -ldflags "-linkmode=external -X main.versionText=$VERSION"
}

check() {
  cd "$pkgname-$pkgver"
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "$pkgname" "$pkgdir/usr/bin/$pkgname"

  # Package license (if available)
  for f in LICENSE COPYING LICENSE.* COPYING.*; do
    if [ -e "$srcdir/src/$_gourl/$f" ]; then
      install -Dm644 "$srcdir/src/$_gourl/$f" "$pkgdir/usr/share/licenses/$pkgname/$f"
    fi
  done
}
