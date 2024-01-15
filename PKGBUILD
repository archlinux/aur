# Maintainer: Moritz Biering <moritzbiering.mb@gmail.com>

pkgname=nachrichten
pkgver=0.1.6
pkgrel=1
pkgdesc="Stay informed without leaving your command line"
arch=('any')
url="https://github.com/zMoooooritz/${pkgname}"
license=('MIT')
makedepends=('git' 'go')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('cc07b62d6c1bddb7bab26844f869703d7213521da6a8635a701c9b51a4ac920f')

build() {
  local commit
  local extraflags
  commit=$(zcat ${pkgname}-${pkgver}.tar.gz | git get-tar-commit-id)
  extraflags="-X main.Version=${pkgver} -X main.CommitSHA=${commit}"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"

  cd "$pkgname-$pkgver"
  go build \
      -trimpath \
      -buildmode=pie \
      -mod=readonly \
      -modcacherw \
      -ldflags "${extraflags} -extldflags \"${LDFLAGS}\"" \
      -o "$pkgname" .
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

