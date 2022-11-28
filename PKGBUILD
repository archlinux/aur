pkgname=aws-saml
_releasever=0.1.0-rc.2
pkgver=0.1.0rc2
pkgrel=1
pkgdesc='Generate AWS credentials from a SAML IdP login'
arch=('x86_64')
url="https://github.com/joshdk/aws-saml"
license=('MIT')
makedepends=('go')
source=("$pkgname-v$pkgver.tar.gz::https://github.com/joshdk/aws-saml/archive/refs/tags/v$_releasever.tar.gz")
sha256sums=('f565ae76cd4b6d92128cb57d8ebc4085903ee72b90240c0867d4f1456f205367')

prepare() {
  cd "$pkgname-$_releasever"

  go mod download
}

build() {
  cd "$pkgname-$_releasever"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOPROXY=off
  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-X 'jdk.sh/meta.name=${pkgname}' \
              -X 'jdk.sh/meta.desc=${pkgdesc}' \
              -X 'jdk.sh/meta.url=${url}' \
              -X 'jdk.sh/meta.version=${_releasever}' \
              -X 'jdk.sh/meta.date=$(date -u +'%Y-%m-%dT%H:%M:%SZ' --date=@${SOURCE_DATE_EPOCH})' \
              -linkmode=external \
              -extldflags \"${LDFLAGS}\"" \
    .
}

check() {
  cd "$pkgname-$_releasever"

  ./aws-saml --version
}

package() {
  cd "$pkgname-$_releasever"

  install -Dm755 aws-saml "$pkgdir"/usr/bin/aws-saml
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
