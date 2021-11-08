pkgname=aws-console-git
pkgver=v0.1.1.r0.g3c0c80b
pkgrel=1
pkgdesc='Generate a temporary login URL for the AWS Console'
arch=('x86_64')
url="https://github.com/joshdk/aws-console"
license=('MIT')
makedepends=('go')
source=('git+https://github.com/joshdk/aws-console')
sha256sums=('SKIP')

pkgver() {
  cd "aws-console"

  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "aws-console"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-X 'jdk.sh/meta.name=${pkgname}' \
              -X 'jdk.sh/meta.desc=${pkgdesc}' \
              -X 'jdk.sh/meta.url=${url}' \
              -X 'jdk.sh/meta.version=${pkgver}' \
              -X 'jdk.sh/meta.date=$(date -u +'%Y-%m-%dT%H:%M:%SZ' --date=@${SOURCE_DATE_EPOCH})' \
              -linkmode=external \
              -extldflags \"${LDFLAGS}\"" \
    .
}

check() {
  cd "aws-console"

  go test ./...
}

package() {
  cd "aws-console"

  install -Dm755 aws-console "$pkgdir"/usr/bin/aws-console
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
