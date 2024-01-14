# Maintainer: Moritz Biering <moritzbiering.mb@gmail.com>

pkgname=nachrichten
pkgver=0.1.5
pkgrel=1
pkgdesc="Stay informed without leaving your command line"
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/zMoooooritz/${pkgname}"
license=('MIT')
makedepends=('git' 'go')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('0449729a6de3f86debfb2c799e6cc59c8ab621d595ec4e5727f548a0795be836')

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

